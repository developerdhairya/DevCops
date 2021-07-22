import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/complaint.dart';
import '../../constants.dart';
import 'edit_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CopComplaint extends StatefulWidget {
  @override
  _CopComplaintState createState() => _CopComplaintState();
}

class _CopComplaintState extends State<CopComplaint> {
  final _reference = FirebaseDatabase.instance.reference().child('Categories');
  bool once = false;
  void fetchComplaints() {
    List<Complaint> temp = [];
    complaintList.clear();
    for (String current in categories) {
      final currentRef = _reference.child(current);
      currentRef.once().then((DataSnapshot snapshot) {
        var data = snapshot.value;
        if (data != null)
          data.forEach((key, value) {
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
                status: value['Status'] != null ? value['Status'] : 'No Status',
                image: value['Image'] != null ? value['Image'] : 'No Image',
                category: current);
            temp.add(complaint);

            print(key);
            print(temp.length);
            setState(() {
              print('fetching again');
              complaintList = temp;
            });
          });
      });
    }
    return null;
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
  void initState() {
    super.initState();
    fetchComplaints();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () {
            return new Future(() => false);
          },
          child: GestureDetector(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Complaints',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Container(
                          child: complaintList.length == 0
                              ? Text('No Complaints')
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: complaintList.length,
                                  itemBuilder: (_, index) {
                                    var c = complaintList;
                                    try {
                                      return ComplaintCard(
                                        img: c[index].image != null
                                            ? c[index].image
                                            : 'No image',
                                        title: c[index].title,
                                        description: c[index].description,
                                        location: c[index].Location,
                                        progress: c[index].Progress,
                                        progDesc: c[index].progessDesc,
                                        category: c[index].category,
                                        sender: c[index].name,
                                        status: c[index].status,
                                        current: c[index],
                                        index: index,
                                        update:
                                            (int currentIndex, Complaint comp) {
                                          print('in here');

                                          setState(() {
                                            complaintList[index] = comp;
                                            // fetchComplaints();
                                          });
                                        },
                                      );
                                    } catch (e) {
                                      print(e);
                                      return null;
                                    }
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
      ),
    );
  }
}

class ComplaintCard extends StatefulWidget {
  final img,
      title,
      description,
      location,
      progress,
      progDesc,
      status,
      category,
      sender;
  final Complaint current;
  final Function update;
  final int index;

  ComplaintCard(
      {this.index,
      this.update,
      this.current,
      this.sender,
      this.img,
      this.title,
      this.description,
      this.location,
      this.progress,
      this.progDesc,
      this.status,
      this.category});

  @override
  _ComplaintCardState createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  final networkImg =
      'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () async {
          var comp;
          comp = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditComplaint(widget.current)),
          );
          print('back here');
          if (comp != 'No change')
            setState(() {
              widget.update(widget.index, comp);
            });
        },
        child: Card(
          color: kPrimaryColor.withAlpha(90),
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
                      widget.img == 'NO image' ? networkImg : widget.img,
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
                        widget.title != Null ? widget.title : 'Empty',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: kCardTextColorPublic),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.description != Null
                            ? widget.description
                            : 'Empty',
                        style: kCardTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.sender != Null
                            ? 'Sender: ${widget.sender}'
                            : 'Empty',
                        style: kCardTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.progress != Null ? widget.progress : 'empty',
                        style: kCardTextStyle,
                      ),
                      LinearProgressIndicator(
                        value: widget.progress != Null
                            ? double.parse(widget.progress) / 100
                            : 0,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.status != Null
                            ? 'Status: ${widget.status}'
                            : 'Empty',
                        style: kCardTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.progDesc != Null ? widget.progDesc : 'Empty',
                        style: kCardTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          widget.category != Null
                              ? 'Category: ${widget.category}'
                              : 'Empty',
                          style: kCardTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
