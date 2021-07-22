import 'dart:async';
import 'package:devcops/screens/authentication/role_selection_screen.dart';
import 'package:devcops/screens/introduction_screen.dart';
import 'components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Devcops());
}

class Devcops extends StatefulWidget {
  @override
  _DevcopsState createState() => _DevcopsState();
}

class _DevcopsState extends State<Devcops> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        '/': (context) => Logged(),
      },
    );
  }
}

//Flash Screen (2 Seconds for now)
class Logged extends StatefulWidget {
  @override
  _LoggedState createState() => _LoggedState();
}

class _LoggedState extends State<Logged> {
  bool isLogged = false;

  Future login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('copLogged') == null &&
        prefs.getBool('publicLogged') == null) {
      prefs.setBool('copLogged', false);
      prefs.setBool('pubicLogged', false);
      return;
    }
    if (prefs.getBool('copLogged') == true ||
        prefs.getBool('publicLogged') == true) {
      setState(() {
        isLogged = true;
      });
    }
  }

  @override
  void initState() {
    login().whenComplete(() async {
      Timer(Duration(seconds: 0), () {
        if (isLogged) {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BottomNav()))
              .then((value) {
            print('here');
            print(value);
            Navigator.pop(context);
          }).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
            );
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IntroAuthScreen()),
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
