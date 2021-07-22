import 'package:flutter/material.dart';
import '../../components/bottom_nav.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/round button.dart';

class LoginCitizen extends StatefulWidget {
  @override
  _LoginCitizenState createState() => _LoginCitizenState();
}

class _LoginCitizenState extends State<LoginCitizen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController otpController = TextEditingController(text: "");
  String mobNo;
  String name;
  String aadhar;
  String email;

  //Setting Preferences
  void setPreferences(var user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('firebaseUser', user.toString());
      prefs.setString('mobileNo', mobNo.trim());
      prefs.setString('username', name);
      prefs.setString('aadhar', aadhar);
      prefs.setString('email', email);
      prefs.setString('userCategory', 'Public');
      prefs.setBool('publicLogged', true);
      prefs.setBool('copLogged', false);
    });
  }

  //verifying Mobile
  void verifyMobile() {
    _auth.verifyPhoneNumber(
        phoneNumber: mobNo,
        verificationCompleted: (AuthCredential credentials) async {
          Navigator.of(context).pop();
          var user = await _auth.signInWithCredential(credentials);
          if (user != null) {
            setPreferences(user);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            ).then((value) {
              Navigator.pop(context);
            });
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          Fluttertoast.showToast(
              msg: 'Authentication Failed',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.brown.shade300,
              textColor: Colors.white,
              fontSize: 16.0);
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: kPrimaryColorPublic,
                  title: Text(
                    'Enter the OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        controller: otpController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        AuthCredential credentials =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: otpController.text.trim());
                        var user =
                            await _auth.signInWithCredential(credentials);
                        if (user != null) {
                          setPreferences(user);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNav()),
                          ).then((value) {
                            Navigator.pop(context);
                          });
                        } else {
                          print('error');
                        }
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String code) {
          otpController.text = code;
        },
        timeout: Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height * 0.1);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: size.width - 25,
                height: defaultLoginSize,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg blue.svg',
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColorPublic.withAlpha(50),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          cursorColor: kPrimaryColorPublic,
                          style: TextStyle(color: kPrimaryColorPublic),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColorPublic,
                              ),
                              hintText: 'Full Name',
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
                          color: kPrimaryColorPublic.withAlpha(50),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          style: TextStyle(color: kPrimaryColorPublic),
                          cursorColor: kPrimaryColorPublic,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: kPrimaryColorPublic,
                              ),
                              hintText: 'Email',
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
                          color: kPrimaryColorPublic.withAlpha(50),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              aadhar = value;
                            });
                          },
                          style: TextStyle(color: kPrimaryColorPublic),
                          cursorColor: kPrimaryColorPublic,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_box,
                                color: kPrimaryColorPublic,
                              ),
                              hintText: 'Aadhar Card',
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
                          color: kPrimaryColorPublic.withAlpha(50),
                        ),
                        child: TextFormField(
                          initialValue: "+91",
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              mobNo = value;
                            });
                          },
                          style: TextStyle(color: kPrimaryColorPublic),
                          cursorColor: kPrimaryColorPublic,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: kPrimaryColorPublic,
                              ),
                              hintText: 'Mobile Number',
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundButton(
                        size: size.width * 0.8,
                        color: kPrimaryColorPublic,
                        text: 'GET OTP',
                        callback: () {
                          FocusScope.of(context).unfocus();
                          verifyMobile();
                        },
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
