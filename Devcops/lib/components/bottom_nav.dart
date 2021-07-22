import 'package:devcops/screens/citizen/enquiries.dart';
import 'package:devcops/screens/citizen/my_complaints.dart';
import 'package:devcops/screens/citizen/public_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/cop/cop_complaints.dart';
import '../screens/cop/sketch_screen.dart';
import '../screens/cop/cop_profile.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = [Text('BottomNav')];
  String cat;
  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String category = prefs.getString('userCategory');
    print('category:-------------------$category');
    setState(() {
      _widgetOptions.clear();
      _widgetOptions.addAll(<Widget>[
        category == 'Public' ? MyComplaints() : CopComplaint(),
        category == 'Public' ? Enquires() : Sketch(),
        category == 'Public' ? ProfileScreen() : Profile(),
      ]);
    });
    cat = category;
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedFontSize: 16,
        selectedFontSize: 18,
        iconSize: 27,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Complaints",
          ),
          cat != 'Public'
              ? BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: "Camera",
                )
              : BottomNavigationBarItem(
                  icon: Icon(Icons.announcement_outlined),
                  label: "Enquires",
                ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
