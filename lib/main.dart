// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:first/screens/first.dart';
import 'package:first/screens/second.dart';
import 'package:first/screens/third.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pratice',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Test'),
              backgroundColor: Colors.green,
              centerTitle: true,
              elevation: 5,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Add',
                    icon: Icon(Icons.add),
                  ),
                  Tab(
                    text: 'Update',
                    icon: Icon(Icons.update),
                  ),
                  Tab(
                    text: 'delete',
                    icon: Icon(Icons.delete),
                  )
                ],
                indicatorColor: Colors.white,
                indicatorWeight: 1.0,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            body: TabBarView(
              children: [First(), Second(), Third()],
            )),
      ),
    );
  }
}
