import 'dart:io';

import 'package:devcops/models/sketch_to_image/drawing_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Sketch extends StatefulWidget {
  @override
  _SketchState createState() => _SketchState();
}

class _SketchState extends State<Sketch> {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: onBackPressed, child: SketchScreen());
  }
}
