import 'package:flutter/material.dart';

import '../constants.dart';



class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key key,
    this.icon,
    this.keyboardType,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final IconData icon;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.yellow),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: TextFormField(
          controller: widget.controller,
          style: mystyle(
            18,
            Colors.black,
            FontWeight.w400,
          ),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              widget.icon,
            ),
            hintStyle: mystyle(20, Colors.grey, FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
