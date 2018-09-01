import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

class CategoryRoute extends StatelessWidget {

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Unit Converter', style: Theme.of(context).textTheme.display1),
        backgroundColor: Colors.green[100],
      ),
      body: Container(
        color: Colors.green[100],
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: _categoryNames.length,
          itemBuilder: (context, index){
            return Category(
              name: _categoryNames[index],
              color: _baseColors[index],
              iconLocation: Icons.cake,
            );
          },
        ),
      ),
    );
  }
}
