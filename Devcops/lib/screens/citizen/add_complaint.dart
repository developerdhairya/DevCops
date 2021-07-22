import 'dart:io';
import 'package:flutter/material.dart';
import 'package:devcops/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/image_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../components/round button.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  String category;
  String message;
  String location;
  String description;
  File _image;

  FirebaseDatabase _db = FirebaseDatabase.instance;
  List<DropdownMenuItem<String>> getItems() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < categories.length; i++) {
      String currency = categories[i];
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(color: Colors.black54),
        ),
        value: currency,
      );
      items.add(newItem);
    }
    return items;
  }

  String getDateTime() {
    var now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss  EEE d MMM').format(now);
    return formattedDate;
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      location = position.toString();
      // print(location);
      // errorToast(location);
    } catch (e) {
      print(e);
      LocationPermission permission = await Geolocator.requestPermission();
    }
  }

  void errorToast(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColorPublic,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Register a Complaint",
                  style: kComplaintTopTextStyle,
                ),
                SvgPicture.asset(
                  'assets/add.svg',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColorPublic.withAlpha(50),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        message = value;
                      });
                    },
                    style: TextStyle(color: kPrimaryColorPublic),
                    cursorColor: kPrimaryColorPublic,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColorPublic.withAlpha(50),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    style: TextStyle(color: kPrimaryColorPublic),
                    cursorColor: kPrimaryColorPublic,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    value: category,
                    hint: Text(
                      'Category',
                      style: kComplaintTextStyle,
                    ),
                    items: getItems()),
                SizedBox(height: 10.0),
                Center(
                  child: _image == null
                      ? Text('No image selected.')
                      : Text(
                          _image.path,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                        onPressed: () async {
                          ImageSelection img = ImageSelection();
                          var newImg = await img.getImagefromCamera();
                          setState(() {
                            _image = newImg;
                          });
                        },
                        child: Icon(Icons.camera)),
                    SizedBox(
                      width: 10.0,
                    ),
                    TextButton(
                        onPressed: () async {
                          ImageSelection img = ImageSelection();
                          var newImage = await img.getImagefromGallery();
                          setState(() {
                            _image = newImage;
                          });
                        },
                        child: Icon(Icons.folder)),
                  ],
                ),
                SizedBox(height: 20.0),
                RoundButton(
                  size: size.width * 0.8,
                  color: kPrimaryColorPublic,
                  text: 'SEND',
                  callback: () async {
                    getLocation();
                    final snackBar = SnackBar(
                      content: Text(
                        'Sending Complaint',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: kPrimaryColorPublic,
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //Implement send functionality.
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    try {
                      final img = ImageSelection();
                      var url = await img.uploadImage(_image);
                      if (url == null)
                        url =
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSo7f1RdMtPN3AkxLTXMCP-eJ2UEiYzg7hpYacuJaboWpAWKrjN6tAsre1lfLAgQD9U9U&usqp=CAU';
                      if (message == null) {
                        errorToast('Complaint title Empty');
                        return;
                      }
                      if (description == null) {
                        errorToast('Complaint Description Empty');
                        return;
                      }
                      if (category == null) {
                        errorToast('No Category selected');
                        return;
                      }
                      _db
                          .reference()
                          .child('Categories')
                          .child(category)
                          .push()
                          .set({
                        'Sender': prefs.getString('username'),
                        'Complaint': message,
                        'Location': location,
                        'AadharCard': prefs.getString('aadhar'),
                        'ContactNo': prefs.getString('mobileNo'),
                        'Description': description,
                        'Priority': 'High',
                        'Progress': '0',
                        'Progress Description': "No Progress Description yet",
                        'Status': 'New Case',
                        'Image': url,
                        'Date&Time': getDateTime()
                      });
                      errorToast('Complaint Send Successfuly');
                      Navigator.pop(context);
                    } catch (e) {}
                  },
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
