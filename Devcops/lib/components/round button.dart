import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function callback;
  final double size;
  final Color color;
  final String text;
  RoundButton({this.callback, this.size, this.color, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
