// ignore_for_file: prefer_const_constructors

import 'package:first/screens/navi.dart';
import 'package:flutter/material.dart';

class Display {
  Widget display(String name, String dept, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding:
            EdgeInsetsGeometry.lerp(EdgeInsets.all(5), EdgeInsets.all(5), 0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        style: ListTileStyle.list,
        autofocus: true,
        leading: Icon(Icons.list),
        trailing: Icon(Icons.delete),
        title: Text(name),
        subtitle: Text(dept),
        tileColor: Colors.white,
        textColor: Colors.green,
        iconColor: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => Navi(name, dept))));
        },
      ),
    );
  }

  Widget button(Icon icon, String text, Color color) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: color,
      icon: icon,
      label: Text(text),
      elevation: 5,
      splashColor: Colors.green,
      foregroundColor: Colors.white,
      tooltip: 'Add',
    );
  }
}

Display dis = Display();
