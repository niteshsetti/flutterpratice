// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_element, non_constant_identifier_names, avoid_print

import 'package:first/screens/adddog.dart';
import 'package:first/screens/third.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pratice',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Sqlflite'),
              backgroundColor: Colors.green,
              centerTitle: true,
              elevation: 5,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Add Dog',
                    icon: Icon(Icons.add),
                  ),
                  Tab(
                    text: 'Fetch Dogs',
                    icon: Icon(Icons.details),
                  ),
                ],
                indicatorColor: Colors.white,
                indicatorWeight: 1.0,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            body: TabBarView(
              children: [AddDog(), Third()],
            )),
      ),
    );
  }
}
