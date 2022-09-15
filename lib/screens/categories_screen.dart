import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2 ,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 16.0,
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(
            id: e.id,
            title: e.title,
            color: e.color!,
          )).toList()
        ,

    );
  }
}
