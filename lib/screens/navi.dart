// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class Navi extends StatefulWidget {
   String? name;
   String? dept;
   Navi(this.name,this.dept, {Key? key}) : super(key: key);

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(widget.name.toString())),
          Center(child: Text(widget.dept.toString())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
             decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Enter Your Name',
              border: OutlineInputBorder(),
             ),
            
            ),
          ),
        ],
      )
    );
  }
}