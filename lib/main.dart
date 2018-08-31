import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

void main() => runApp(UnitConverterApp());


class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: Category(
            name: 'Cake',
            color: Colors.green,
            iconLocation: Icons.cake,
          ),
        ),
      ),
    );
  }
}