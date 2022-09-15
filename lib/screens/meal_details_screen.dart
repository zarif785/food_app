import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFav;
  final Function isFav;
  const MealDetailsScreen({Key? key, required this.toggleFav, required this.isFav}) : super(key: key);


  Widget buildSectionTitle(String text){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  Text(text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600 )),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
        decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),

    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 200,
    width: 300,
    child: child,
    );
    }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meals details"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            buildSectionTitle("Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context,index){
                  return Card(
                    color:Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal:10 ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,

              ),
            ),
            buildSectionTitle("Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "# ${(index+1)}"
                          ),

                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                       const Divider(),

                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,

              ),
            ),
              

              // child: ListView.builder(itemBuilder: (context,)),

          ]),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          toggleFav(mealId );
        },
        child: Icon(
            isFav(mealId)? Icons.favorite :Icons.favorite_border ,
        ),
      ),
    );
  }
}
