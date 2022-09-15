import 'package:flutter/material.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/favorites_screen.dart';
import 'package:food_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  void _selectPage(int index){
    setState(() {
      selectedpageIndex=index;
    });
  }


  @override
  initState(){
    _pages=[
      const CategoriesScreen(),
      FavortiesScreen(favoriteMeals: widget.favoriteMeals),
    ];
    super.initState();

  }

  int selectedpageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const MainDrawer(),
      body:  _pages[selectedpageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.yellow,
        currentIndex: selectedpageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category,), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Star"),
        ],
      ),
    );
  }
}
