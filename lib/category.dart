import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  final String name;
  final Color color;
  final IconData iconLocation;

  Category({this.name, this.color, this.iconLocation});

  @override
  Widget build(BuildContext context) {
    final _rowHeight = 100.0;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: BorderRadius.circular(_rowHeight/2),
          highlightColor: color,
          splashColor: color,
          onTap: (){

          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(name, style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
