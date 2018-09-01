import 'package:flutter/material.dart';
import 'package:unit_converter/backdrop.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/category_tile.dart';
import 'package:unit_converter/converter_route.dart';
import 'package:unit_converter/unit.dart';

class CategoryRoute extends StatefulWidget {
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {

  static const List<String> _categoryNames = [
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Degital Storage',
    'Energy',
    'Currency',
  ];

  static const List<Color> _baseColors = [
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];


  @override
  void initState() {
    super.initState();
    for(int i = 0; i < _categoryNames.length; i++){
      var category = Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: List.generate(10, (int u) {
          u += 1;
          return Unit(
            name: '${_categoryNames[i]} Unit $u',
            conversion: u.toDouble(),
          );
        }),
      );
      if(i == 0){
        _defaultCategory = category;
      } else {
        _categories.add(category);
      }
    }
  }

  Category _defaultCategory;
  Category _currentCategory;
  final _categories = <Category>[];

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Backdrop(
        currentCategory: _currentCategory == null ? _defaultCategory : _currentCategory,
        frontPanel: _currentCategory == null? UnitConverter(category: _defaultCategory) : UnitConverter(category: _currentCategory),
        frontTitle: Text('Unit Converter'),
        backTitle: Text('Select a category'),
        backPanel: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 48.0),
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index){
              return CategoryTile(
                category: _categories[index],
                onTap: _onCategoryTap,
              );
            },
          ),
        ),
      ),
      resizeToAvoidBottomPadding: true,
    );
  }


}
