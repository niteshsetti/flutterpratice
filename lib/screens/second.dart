// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:first/display.dart';
import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                leading: Icon(Icons.movie),
                title: Text("Item ${(index + 1).toString()}"),
                trailing: Icon(Icons.airplane_ticket),
                tileColor: Colors.blue,
                textColor: Colors.white,
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          );
        },
      ),
      floatingActionButton:dis.button(Icon(Icons.edit),"Edit",Colors.purple),
    );
  }
}
