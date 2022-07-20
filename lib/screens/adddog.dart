// ignore_for_file: non_constant_identifier_names, unused_element, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:first/screens/Dbase.dart';
import 'package:first/screens/dog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AddDog extends StatefulWidget {
  const AddDog({Key? key}) : super(key: key);

  @override
  State<AddDog> createState() => _AddDogState();
}

class _AddDogState extends State<AddDog> {
  TextEditingController dog_id = TextEditingController();
  TextEditingController dog_name = TextEditingController();
  TextEditingController dog_age = TextEditingController();
  late int id, age;
  late String name;
  final _key = GlobalKey<FormState>();
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool Alert = false;
  @override
  void initState() {
    super.initState();
    _check_internet_connectivity(context);
    _getConnectivity();
  }

  _getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && Alert == false) {
        showDialogBox();
        setState(() {
          Alert = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "Dog - Details",
                  style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
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
                validator: (value) {
                  if (value!.isNotEmpty) {
                    id = int.parse(value.toString());
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
                    name = value.toString();
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
                    age = int.parse(value.toString());
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
                        .insert_dog(Dog(id, name, age))
                        .then((value) {
                      Fluttertoast.showToast(
                          msg:
                              "Dog Added Successfully with Status ${value.toString()}",
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
                    databaseConnection
                        .fetch_dog()
                        .then((value) => print(value));
                  }
                },
                child: const Text("Add"),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDialogBox() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('No connection'),
            content: Text('Please check your internet connectivity'),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'Cancel');
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                    setState(() {
                      Alert = false;

                      if (!isDeviceConnected) {
                        showDialogBox();
                        setState(() {
                          Alert = true;
                        });
                      }
                    });
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}

_check_internet_connectivity(BuildContext context) async {
  var result = await (Connectivity().checkConnectivity());
  if (result == ConnectivityResult.mobile) {
    print("You are Connected to Mobile");
    _snackbar(context, "Success", "You are Connected to Mobile Network",
        AnimatedSnackBarType.success);
  } else if (result == ConnectivityResult.wifi) {
    print("You are Connected to Wifi");
    _snackbar(context, "Success", "You are Connected to Wifi Network",
        AnimatedSnackBarType.success);
  } else if (result == ConnectivityResult.none) {
    print("You are not connected to Network");
    _snackbar(context, "Network Error", "You are not Connected to Network",
        AnimatedSnackBarType.error);
  }
}

_snackbar(BuildContext context, String msgtype, String msg,
    AnimatedSnackBarType animated) {
  AnimatedSnackBar.rectangle(msgtype, msg,
          type: animated,
          brightness: Brightness.light,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom)
      .show(
    context,
  );
}
