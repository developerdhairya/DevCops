import 'package:devcops/components/bottom_nav.dart';
import 'package:devcops/components/round%20button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants.dart';

class LoginCop extends StatefulWidget {
  @override
  _LoginCopState createState() => _LoginCopState();
}

class _LoginCopState extends State<LoginCop> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
    if (user != null) {
      await prefs.setString('firebaseUser', user.toString());
      await prefs.setString('userCategory', 'Cop');
      await prefs.setBool('copLogged', true);
      prefs.setBool('pubicLogged', false);
      await prefs.setString('CopEmail', email);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      ).then((value) {
        Navigator.pop(context);
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Authentication Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.brown.shade300,
          textColor: Colors.white,
          fontSize: 16.0);
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height * 0.2);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      'assets/cop_svg.svg',
                      height: 240,
                      width: 240,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(50),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: kPrimaryColor),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Username',
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(50),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        style: TextStyle(color: kPrimaryColor),
                        obscureText: true,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Password',
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                      size: size.width * 0.8,
                      color: kPrimaryColor,
                      text: 'LOGIN',
                      callback: () {
                        FocusScope.of(context).unfocus();
                        login();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
