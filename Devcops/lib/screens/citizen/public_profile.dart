import 'dart:io';

import 'package:devcops/components/round%20button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/oval_bottom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;
  String number;
  String email;
  String aadhar;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  void getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nameController.text = prefs.getString('username');
      phoneController.text = prefs.getString('mobileNo');
      emailController.text = prefs.getString('email');
    });
  }

  void errorToast(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColorPublic,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<bool> onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(color: kPrimaryColorPublic),
            ),
            content: Text(
              'You are going to exit Devcops',
              style: TextStyle(color: kPrimaryColorPublic),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('YES'),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  void update() async {
    FocusScope.of(context).unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mobileNo', phoneController.text.trim());
    prefs.setString('email', emailController.text);
    errorToast('Credentials Updated');
  }

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 2 - 64,
                  top: MediaQuery.of(context).size.height / 6,
                ),
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // decoration: kEditProfileDecor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Name',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.phone),
                              labelText: 'Mobile',
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                size: size.width * 0.3,
                                color: kPrimaryColorPublic,
                                text: 'UPDATE',
                                callback: () {
                                  update();
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundButton(
                                size: size.width * 0.3,
                                color: kPrimaryColorPublic,
                                text: 'SIGN OUT',
                                callback: () async {
                                  _auth.signOut();
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('firebaseUser', '');
                                  prefs.setString('mobileNo', '');
                                  prefs.setString('username', '');
                                  prefs.setString('aadhar', '');
                                  prefs.setString('email', '');
                                  prefs.setString('userCategory', '');
                                  prefs.setBool('publicLogged', false);
                                  await prefs.setBool('copLogged', false);
                                  Navigator.pop(
                                      context, (route) => route.isFirst);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
