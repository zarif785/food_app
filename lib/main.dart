import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/category_meals_screen.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters ={
      "gluten" : false,
      "lactose" : false,
      "vegan" : false,
      "vegetarian" : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String,bool> filteredData){
      setState(() {
        _filters = filteredData;
        _availableMeals = DUMMY_MEALS.where((meal){
          if(_filters["gluten"]==true && !meal.isGlutenFree){
            return false;
          }

          if(_filters["lactose"]== true && !meal.isLactoseFree){
            return false;
          }

          if(_filters["vegan"]== true && !meal.isVegan){
            return false;
          }

          if(_filters["vegetarian"]== true && !meal.isVegetarian){
            return false;
          }
          else{
            return true;
          }
        }).toList();
      });

  }

  void _toggleFavourite(String mealId){

    final existingIndex = _favoriteMeals.indexWhere((e) => e.id== mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id ==mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element){
      return element.id ==id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: "RaleWay",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 51)
          ),

            bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 51)
            ),
          // titleMedium: const TextStyle(
          //   fontSize: 24,
          //   fontFamily: "RobotCondensed"
          // )
        )
      ),
      // home: const CategoriesScreen(),
      routes: {
        '/': (ctx)=> TabsScreen(favoriteMeals:  _favoriteMeals),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(availableMeals:_availableMeals),
        MealDetailsScreen.routeName: (ctx)=> MealDetailsScreen(toggleFav: _toggleFavourite,isFav:_isMealFavorite ),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(currentFilters: _filters, saveFilters: _setFilters,),
      },
      initialRoute:  '/',
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
    );
  }
}




