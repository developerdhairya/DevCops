import 'package:flutter/material.dart';
import '../constants.dart';


class SignButton extends StatelessWidget {
  const SignButton({
    Key key,
    this.linearGradient,
    this.text,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  final linearGradient;
  final String text;
  final Function onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: linearGradient,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: mystyle(
              fontSize,
              Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
