import 'package:flutter/material.dart';

class StackDesign extends StatelessWidget {
  const StackDesign({
    Key key,
    this.child, this.heightFactor,
  }) : super(key: key);

  final child;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(31, 179, 237, 1),
                Color.fromRGBO(17, 106, 197, 1)
              ]),
            ),
            child: Center(
              child: Image.asset("assets/logo.PNG"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / heightFactor,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
