import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/converter_route.dart';
import 'package:unit_converter/unit.dart';

class CategoryTile extends StatelessWidget {

  final Category category;
  final ValueChanged<Category> onTap;

  CategoryTile({this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    final _rowHeight = 100.0;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: BorderRadius.circular(_rowHeight/2),
          highlightColor: category.color,
          splashColor: category.color,
          onTap: () => onTap(category),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    category.iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(category.name, style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
