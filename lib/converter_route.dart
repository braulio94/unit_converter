import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';

class ConverterRoute extends StatefulWidget {
  final name;
  final Color color;
  final List<Unit> units;

  ConverterRoute({this.name, this.color, this.units});

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {

  Unit _fromValue;
  Unit _toValue;
  double _inputValue;
  String _convertedValue;
  List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  void _createDropdownMenuItems(){
    var newItems = <DropdownMenuItem>[];
    for(var unit in widget.units){
      newItems.add(
        DropdownMenuItem(
          value: unit.name,
          child: Container(
            child: Text(unit.name, softWrap: true),
          ),
        )
      );
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  void _setDefaults(){
    setState(() {
      _fromValue = widget.units[0];
      _toValue = widget.units[1];
    });
  }

  _createDropdown({String currentValue, ValueChanged<dynamic> onChanged}){
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey[400], width: 1.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey[50]),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: currentValue,
              items: _unitMenuItems,
              onChanged: onChanged,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final input = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.display1,
              errorText: _showValidationError ? 'Invalid Number Entered' : null,
              labelText: 'Input',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0)
              )
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          ),
          _createDropdown(currentValue: _fromValue.name)//, onChanged: _updateFromConversion)
        ],
      ),
    );
    final output = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            //TODO put converted value here
            child: Text('', style: Theme.of(context).textTheme.display1,),
            decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.display1,
                labelText: 'Output',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                ),
            ),
          ),
          _createDropdown(currentValue: _toValue.name)//, onChanged: _updateFromConversion)
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          input,
          output,
        ],
      ),
    );
  }
}
