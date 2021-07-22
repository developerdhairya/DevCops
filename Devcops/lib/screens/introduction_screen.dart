import 'package:devcops/screens/authentication/role_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../constants.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body: "Welcome to DevCops, the best companion for public and cops",
            image: Center(
              child: Image.asset("assets/welcome.png"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Realtime Updation",
            body:
                "The sending and receiving details about complaints is completely realtime. User can check the current progress and status about their complaints at any time quickly. On the cop side, progress can be updated using the app anytime.",
            image: Center(
              child: Image.asset("assets/conference.png"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Security",
            body:
                "App is secured using API verification and OTP verification verification. Additionally on getting unexpected behaviour from a mobile number, login from that number is banned for certain time.",
            image: Center(
              child: Image.asset("assets/secure.jpg"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RoleSelectionScreen()));
      },
      onSkip: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoleSelectionScreen(),
          ),
        );
      },
      showSkipButton: true,
      showDoneButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
