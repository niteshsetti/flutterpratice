// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
      // ignore: deprecated_member_use
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(child: Text("You clicked the button :" +value.toString()+" times",style: TextStyle(fontSize: 20.0),)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

         setState(() {
            value=value+1;
         });
      },
      child:Icon(Icons.add)),
    );
  }
}
