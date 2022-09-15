import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String,bool>  currentFilters;
  const FiltersScreen({Key? key, required this.saveFilters, required  this.currentFilters}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten']!;
    _vegeterian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(subtitle),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(onPressed: (){
            final  selectedfilters ={
              "gluten" : _glutenFree,
              "lactose" : _lactoseFree,
              "vegan" : _vegan,
              "vegetarian" : _vegeterian,
            };

            widget.saveFilters(selectedfilters);
          } , icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text("Adjust your meal selection",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "GLuten free",
                  "Only include gluten free Meals",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian  ",
                  "Only include vegetarian Meals",
                  _vegeterian,
                      (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan  ",
                  "Only include vegan Meals",
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),

                _buildSwitchListTile(
                  "Lactose Free  ",
                  "Only include Lactose Free Meals",
                  _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
