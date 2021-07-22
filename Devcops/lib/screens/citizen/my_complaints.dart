import 'dart:io';

import 'package:devcops/components/stack_design.dart';
import 'package:devcops/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/complaint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_complaint.dart';

class MyComplaints extends StatefulWidget {
  const MyComplaints({Key key}) : super(key: key);

  @override
  _MyComplaintsState createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {
  final _reference = FirebaseDatabase.instance.reference().child('Categories');
  List<Complaint> complaints = [];
  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String category = prefs.getString('userCategory');
    print(category);
  }

  //Fetching Complaints
  void fetchComplaints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String aadharNo = prefs.getString('aadhar');
    print('aadhar card:$aadharNo');
    List<Complaint> temp = [];
    complaints.clear();
    for (String current in categories) {
      final currentRef = _reference.child(current);
      currentRef.once().then((DataSnapshot snapshot) {
        var data = snapshot.value;
        if (data != null)
          data.forEach((key, value) {
            if (value['AadharCard'] == aadharNo) {
              Complaint complaint = Complaint(
                  key: key,
                  name: value['Sender'] != null ? value['Sender'] : 'No Name',
                  title: value['Complaint'] != null
                      ? value['Complaint']
                      : 'No Title',
                  description: value['Description'] != null
                      ? value['Description']
                      : 'No Description',
                  Location: value['Location'] != null
                      ? value['Location']
                      : 'No Location',
                  Progress: value['Progress'] != null
                      ? value['Progress']
                      : 'No Progress',
                  progessDesc: value['Progress Description'] != null
                      ? value['Progress Description']
                      : 'No Progress Description',
                  status:
                      value['Status'] != null ? value['Status'] : 'No Status',
                  image: value['Image'] != null ? value['Image'] : 'No Image',
                  category: current);
              temp.add(complaint);
            }
            setState(() {
              complaints = temp;
            });
          });
      });
    }
  }

  @override
  void initState() {
    login();
    super.initState();
    fetchComplaints();
  }

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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Complaints()))
              .then((value) {
            fetchComplaints();
            print('back here');
          });
        },
      ),
      body: WillPopScope(
        onWillPop: onBackPressed,
        child: SafeArea(
          child: StackDesign(
            heightFactor: 1.9,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'My Complaints',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Container(
                        child: complaints.length == 0
                            ? Text('No Complaints')
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: complaints.length,
                                itemBuilder: (_, index) {
                                  var c = complaints;
                                  print(c[index].image);
                                  return ComplaintCard(
                                    img: c[index].image,
                                    title: c[index].title,
                                    description: c[index].description,
                                    progress: c[index].Progress,
                                    progDesc: c[index].progessDesc,
                                    category: c[index].category,
                                    status: c[index].status,
                                  );
                                }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final img, title, description, progress, progDesc, status, category;

  ComplaintCard(
      {this.img,
      this.title,
      this.description,
      this.progress,
      this.progDesc,
      this.status,
      this.category});

  final networkImg =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSo7f1RdMtPN3AkxLTXMCP-eJ2UEiYzg7hpYacuJaboWpAWKrjN6tAsre1lfLAgQD9U9U&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColorPublic.withAlpha(90),
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * 0.9,
        // alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 5),
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image(
                image: NetworkImage(
                  img == 'NO image' ? networkImg : img,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title != Null ? title : 'Empty',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kCardTextColorPublic),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    description != Null ? description : 'Empty',
                    style: kCardTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    progress != Null ? progress : 'empty',
                    style: kCardTextStyle,
                  ),
                  LinearProgressIndicator(
                    value: progress != Null ? double.parse(progress) / 100 : 0,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    status != Null ? 'Status: $status' : 'Empty',
                    style: kCardTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    progDesc != Null ? progDesc : 'Empty',
                    style: kCardTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(category != Null ? 'Category: $category' : 'Empty',
                      style: kCardTextStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
