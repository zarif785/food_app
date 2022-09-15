import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;Function
  const MealItem({Key? key,required this.id, required this.title, required this.imageUrl, required this.duration, required this.complexity, required this.affordability,}) : super(key: key);

  void selectMeal(BuildContext ctx){
      Navigator.of(ctx).pushNamed(
          MealDetailsScreen.routeName, arguments: id

      );

  }

  String get complexityText {
    switch(complexity){
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch(affordability){
      case Affordability.pricey:
        return "Pricey";
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15) ,topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),

                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,

                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

              ],

            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text("${duration} mins")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.cases),
                      SizedBox(width: 6,),
                      Text(complexityText)
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(width: 6,),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
