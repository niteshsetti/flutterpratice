// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Display {
  Widget display(String name, String dept) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading: Icon(Icons.list),
          trailing: Icon(Icons.delete),
          title: Text(name),
          subtitle: Text(dept),
          tileColor: Colors.blue,
          textColor: Colors.white,
          iconColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
    );
  }

  Widget button(Icon icon,String text,Color color)
  {
    return FloatingActionButton.extended(
        onPressed: (){

        },
        backgroundColor:color,
       icon: icon,
       label: Text(text),
      );
  }
}

Display dis = Display();
