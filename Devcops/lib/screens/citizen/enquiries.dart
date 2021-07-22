import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../constants.dart';
import '../../components/round button.dart';

class Enquires extends StatefulWidget {
  @override
  _EnquiresState createState() => _EnquiresState();
}

class _EnquiresState extends State<Enquires> {
  String enq;
  @override
  void initState() {
    super.initState();
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

  void errorToast(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColorPublic.withAlpha(50),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void sendEnquiry() async {
    FocusScope.of(context).unfocus();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('username');
    String number = prefs.getString('mobileNo');
    String email = prefs.getString('email');
    if (enq != null)
      try {
        FirebaseDatabase _db = FirebaseDatabase.instance;
        _db.reference().child('Inquiries').push().set(
            {'name': name, 'email': email, 'contatNo': number, 'inquiry': enq});
        errorToast('Enquiry Sent');
      } catch (e) {
        print(e);
        errorToast('Error Sending Enquiry');
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  "Enquiries",
                  style: kComplaintTopTextStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SvgPicture.asset(
                  'assets/enquiry.svg',
                  height: 300,
                  width: 300,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColorPublic.withAlpha(50),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        enq = value;
                      });
                    },
                    style: TextStyle(color: kPrimaryColorPublic),
                    cursorColor: kPrimaryColorPublic,
                    decoration: InputDecoration(
                      hintText: 'Type your enquiry here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                RoundButton(
                  size: size.width * 0.6,
                  color: kPrimaryColorPublic,
                  text: 'SEND',
                  callback: () {
                    sendEnquiry();
                  },
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
