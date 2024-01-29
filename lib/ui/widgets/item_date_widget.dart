import 'package:flutter/material.dart';

class ItemDataWidget extends StatelessWidget {
 

  String label;
  String data;



  ItemDataWidget( {required this.label, required this.data});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
      padding: EdgeInsets.all(8),
      child: Row(
      
      children: [
        Text(
          "$label: ",
          style: TextStyle(
              fontSize: 17, color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            "$data",
            style: TextStyle(
                fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    ));
  }
}
