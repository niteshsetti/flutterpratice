// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:ui';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:first/screens/Dbase.dart';
import 'package:first/screens/third.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_bottom_sheet/drag_zone_position.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';
import 'package:just_bottom_sheet/just_bottom_sheet_configuration.dart';
import 'package:share_plus/share_plus.dart';
import 'dog.dart';

class Alerts {
  final scrollController = ScrollController();
  Future<dynamic> cool_alert(
      BuildContext context, List<Map<String, dynamic>> dogs, int index) {
    return CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "Do you want to delete ${dogs[index]["name"].toString()}",
        cancelBtnText: 'Cancel',
        confirmBtnText: 'Delete',
        confirmBtnColor: Colors.green,
        confirmBtnTextStyle: const TextStyle(color: Colors.white),
        onConfirmBtnTap: () {
          databaseConnection.delete_dog(dogs[index]["id"]);
          Navigator.pop(context);
        });
  }

  Future Bottom_sheet(
      BuildContext context, List<Map<String, dynamic>> dogs, int index) {
    return showAdaptiveActionSheet(
      context: context,
      title: Text('Choose Action with ${dogs[index]["name"].toString()}'),
      androidBorderRadius: 30,
      actions: <BottomSheetAction>[
        BottomSheetAction(
            title: const Text('Update'),
            onPressed: (BuildContext context) {
              Navigator.pop(context);
              TextEditingController dog_id =
                  TextEditingController(text: dogs[index]["id"].toString());
              TextEditingController dog_name =
                  TextEditingController(text: dogs[index]["name"]);
              TextEditingController dog_age =
                  TextEditingController(text: dogs[index]["age"].toString());
              late int uid, uage;
              late String uname;
              final _key = GlobalKey<FormState>();
              showJustBottomSheet(
                context: context,
                dragZoneConfiguration: JustBottomSheetDragZoneConfiguration(
                  dragZonePosition: DragZonePosition.outside,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 4,
                      width: 30,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[300]
                          : Colors.white,
                    ),
                  ),
                ),
                configuration: JustBottomSheetPageConfiguration(
                    height: MediaQuery.of(context).size.height * 0.85,
                    builder: (context) {
                      return Scaffold(
                        body: Form(
                          key: _key,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  const Center(
                                    child: Text(
                                      "Update Dog - Details",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: dog_id,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Dog ID',
                                      labelText: 'Enter Dog ID',
                                      border: OutlineInputBorder(),
                                    ),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        uid = int.parse(value.toString());
                                      } else {
                                        return 'Required';
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: dog_name,
                                    decoration: const InputDecoration(
                                      hintText: 'Dog Name',
                                      labelText: 'Enter Dog Name',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        uname = value.toString();
                                      } else {
                                        return 'Required';
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: dog_age,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Dog Age',
                                      labelText: 'Enter Dog Age',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        uage = int.parse(value.toString());
                                      } else {
                                        return 'Required';
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        databaseConnection
                                            .update_dog(Dog(uid, uname, uage))
                                            .then((value) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Dog Updated Successfully with Status ${value.toString()}",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        });
                                        dog_id.clear();
                                        dog_name.clear();
                                        dog_age.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text("Update"),
                                    color: Colors.green,
                                    textColor: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scrollController: scrollController,
                    closeOnScroll: true,
                    cornerRadius: 16,
                    backgroundColor: Colors.white),
              );
            }),
        BottomSheetAction(
            title: const Text('Share'), onPressed: (BuildContext context) {
              Share.share(" Dog-ID : ${dogs[index]["id"]}\n Name : ${dogs[index]["name"]}\n Age :  ${dogs[index]["age"]}",

              );
            }),
      ],
      cancelAction: CancelAction(
          title: const Text(
              'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}

Alerts alerts = Alerts();
