import 'package:flutter/material.dart';
import 'package:unit_converter/converter_route.dart';
import 'package:unit_converter/unit.dart';

class Category extends StatelessWidget {

  final String name;
  final Color color;
  final IconData iconLocation;
  final List<Unit> units;

  Category({this.name, this.color, this.iconLocation, this.units});

  void _navigateToConverter(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(name, style: Theme.of(context).textTheme.display1),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            name: name,
            color: color,
            units: units,
          ),
        );
      }
    ));
  }

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
            _navigateToConverter(context);
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
