// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, unnecessary_import, unused_import, prefer_const_literals_to_create_immutables

import 'package:first/screens/Dbase.dart';
import 'package:first/screens/alerts_msgs.dart';
import 'package:first/screens/dog.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:cool_alert/cool_alert.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  int value = 0;
  List<Map<String, dynamic>> dogs = [];
  @override
  void initState() {
    super.initState();
    databaseConnection.fetch_dog().then((value) {
      setState(() {
        dogs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dogs.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "No Dogs Data Found.",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                )
              ],
            ))
          : RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    databaseConnection.fetch_dog().then((value) {
                      setState(() {
                        dogs = value;
                      });
                    });
                  });
                });
              },
              child: ListView.builder(
                itemCount: dogs.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BannerListTile(
                      showBanner: false,
                      randomBackgroundColor: true,
                      backgroundColor: Color.fromARGB(255, 35, 184, 37),
                      borderRadius: BorderRadius.circular(8),
                      imageContainer: Image(
                          image: AssetImage("assets/puppy.jpg"),
                          fit: BoxFit.cover),
                      title: Text(
                        dogs[index]["name"].toString(),
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Text("Age : ${dogs[index]["age"].toString()}",
                          style: TextStyle(fontSize: 13, color: Colors.white)),
                      trailing: IconButton(
                          onPressed: () {
                            alerts
                                .cool_alert(context, dogs, index)
                                .then((value) {
                              setState(() {
                                databaseConnection.fetch_dog().then((value) {
                                  setState(() {
                                    dogs = value;
                                  });
                                });
                              });
                            });
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          )),
                      onTap: () {
                        alerts.Bottom_sheet(context, dogs, index);
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}

_ThirdState third = _ThirdState();
