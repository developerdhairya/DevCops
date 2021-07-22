import 'package:devcops/components/sign_buttons.dart';
import 'package:devcops/components/stack_design.dart';
import 'package:devcops/screens/authentication/login_citizen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'login_cop.dart';

class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return StackDesign(
      heightFactor: 1.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginCop(),
                ),
              );
            },
            fontSize: 20.0,
            linearGradient: kGreenGradient,
            text: "I'm a Cop",
          ),
          SizedBox(
            height: 40,
          ),
          SignButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginCitizen(),
                ),
              );
            },
            linearGradient: kPinkGradient,
            text: "I'm a Citizen",
            fontSize: 20.0,
          ),
        ],
      ),
    );
  }
}
