import 'dart:io';

import 'package:devcops/components/oval_bottom_clipper.dart';
import 'package:devcops/components/round%20button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setEmail();
  }

  void setEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('CopEmail');
    });
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
                  height: MediaQuery.of(context).size.height / 2.5,
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
                  top: MediaQuery.of(context).size.height / 3.1,
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
                      height: MediaQuery.of(context).size.height / 1.75,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // decoration: kEditProfileDecor,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.multiline,
                            enabled: false,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          RoundButton(
                            size: size.width * 0.3,
                            color: kPrimaryColor,
                            text: 'SIGN OUT',
                            callback: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('copLogged', false);
                              await prefs.setString('firebaseUser', '');
                              await prefs.setString('userCategory', '');
                              prefs.setBool('pubicLogged', false);
                              await prefs.setString('CopEmail', '');
                              await FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            },
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
