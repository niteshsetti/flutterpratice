// ignore_for_file: prefer_const_constructors

import 'package:first/display.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            dis.display("Madhu vasanth", "Computer Science Student"),
            dis.display("Nitesh", "Computer Science Student"),
            dis.display("Kalyan", "Computer Science Student"),
            dis.display("Madhu vasanth", "Computer Science Student"),
            dis.display("Nitesh", "Computer Science Student"),
            dis.display("Kalyan", "Computer Science Student"),
            dis.display("Madhu vasanth", "Computer Science Student"),
            dis.display("Nitesh", "Computer Science Student"),
            dis.display("Kalyan", "Computer Science Student"),
          ],
        ),
      ),
      floatingActionButton: dis.button(Icon(Icons.add),"Add",Colors.green)
    );
  }
}
