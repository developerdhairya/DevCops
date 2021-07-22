import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/complaint.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/round button.dart';

class EditComplaint extends StatefulWidget {
  @override
  _EditComplaintState createState() => _EditComplaintState();
  final Complaint complaint;

  EditComplaint(this.complaint);
}

class _EditComplaintState extends State<EditComplaint> {
  TextEditingController prog = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController status = TextEditingController();
  String currentPriority;
  String currentStatus;
  double currentProgress;

  List<DropdownMenuItem<String>> getPriority() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < prioritiesList.length; i++) {
      String currency = prioritiesList[i];
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: kEditTextStyle,
        ),
        value: currency,
      );
      items.add(newItem);
    }
    return items;
  }

  List<DropdownMenuItem<String>> getStatus() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < statusList.length; i++) {
      String currency = statusList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      items.add(newItem);
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    var progress = widget.complaint.Progress;
    prog.text = progress;
    desc.text = widget.complaint.progessDesc;
    status.text = widget.complaint.status;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    SvgPicture.asset(
                      'assets/edit.svg',
                      height: 200,
                      width: 200,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: widget.complaint.title,
                      enabled: false,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: widget.complaint.description,
                      enabled: false,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: widget.complaint.category,
                      enabled: false,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: widget.complaint.name,
                      enabled: false,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Sender',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: widget.complaint.Location,
                      enabled: false,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Sender',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: kPrimaryColor.withAlpha(50),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: kPrimaryColor,
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                        value: double.parse(prog.text.toString()),
                        min: 0.0,
                        max: 100.0,
                        onChanged: (double value) {
                          setState(() {
                            prog.text = value.round().toString();
                          });
                        },
                      ),
                    ),
                    Text(
                      '${prog.text.toString()}',
                      textAlign: TextAlign.center,
                      // decoration:
                      //     kMessageTextFieldDecoration.copyWith(hintText: 'Progress'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: desc,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        setState(() {});
                      },
                      maxLines: 2,
                      style: kEditTextStyle,
                      decoration: const InputDecoration(
                        labelText: 'Progress Description',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        currentPriority = value;
                      });
                    },
                    value: currentPriority,
                    hint: Text('Priority'),
                    items: getPriority()),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(
                      size: size.width * 0.3,
                      color: kPrimaryColor,
                      text: 'EDIT',
                      callback: () async {
                        Map<String, Object> map = HashMap();
                        map['Progress'] = prog.text.toString();
                        map['Progress Description'] = desc.text.toString();
                        map['Status'] = status.text.toString();
                        map['Priority'] = currentPriority;
                        if (prog.text.toString() == '100') {
                          map['Status'] = statusList[2];
                        } else if (prog.text.toString() != '0')
                          map['Status'] = statusList[1];
                        else
                          map['Status'] = statusList[0];
                        var currentComp = widget.complaint;
                        currentComp.Progress = prog.text.toString();
                        currentComp.progessDesc = desc.text.toString();
                        currentComp.status = status.text.toString();
                        final ref = FirebaseDatabase.instance
                            .reference()
                            .child('Categories')
                            .child(widget.complaint.category)
                            .child(widget.complaint.key);
                        await ref.update(map);
                        Fluttertoast.showToast(
                            msg: "Complaint Edited Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.brown.shade300,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pop(context, currentComp);
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    RoundButton(
                      size: size.width * 0.3,
                      color: kPrimaryColor,
                      text: 'CANCEL',
                      callback: () {
                        Navigator.pop(context, 'No change');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
