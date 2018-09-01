import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';


class Category {

  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final IconData iconLocation;

  Category({this.name, this.color, this.units, this.iconLocation});
}