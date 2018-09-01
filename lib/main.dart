import 'package:flutter/material.dart';
import 'package:unit_converter/category_route.dart';
import 'package:unit_converter/unit.dart';

void main() => runApp(UnitConverterApp());


class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}

class ConverterRoute extends StatelessWidget {
  final name;
  final Color color;
  final List<Unit> units;

  ConverterRoute({this.name, this.color, this.units});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: units.map((Unit unit){
        return Container(
          color: color,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(unit.name, style: Theme.of(context).textTheme.headline),
              Text('Conversion: ${unit.conversion}', style: Theme.of(context).textTheme.subhead)
            ],
          ),
        );
      }).toList(),
    );
  }
}
