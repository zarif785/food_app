import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavortiesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavortiesScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<FavortiesScreen> createState() => _FavortiesScreenState();
}

class _FavortiesScreenState extends State<FavortiesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty){
    return const Center(
      child: Text(
        "The Favorites"
      ),
    );
  }
  else{
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          title: widget.favoriteMeals[index].title,
          imageUrl: widget.favoriteMeals[index].imageUrl,
          duration: widget.favoriteMeals[index].duration,
          complexity: widget.favoriteMeals[index].complexity,
          affordability: widget.favoriteMeals[index].affordability,
          id: widget.favoriteMeals[index].id,
        );
      },
      itemCount: widget.favoriteMeals.length,
    );
    }
  }

}
