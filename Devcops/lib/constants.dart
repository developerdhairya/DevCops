import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/custom_text_field.dart';
import 'models/complaint.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintStyle: TextStyle(color: Colors.black87),
);

const kComplaintTopTextStyle = TextStyle(
    fontSize: 25.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none);

const kComplaintTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none);

const List<String> categories = [
  'Burglary',
  'Childhood abuse',
  'Cyber crime and online fraud',
  'Domestic abuse',
  'Murder',
  'Rape or sexual assault',
  'Violent crime',
  'Others'
];

const List<String> prioritiesList = ['High', 'Medium', 'Low'];
const List<String> statusList = ['New Case', 'In Progress', 'Resolved'];

TextStyle mystyle(double size, [Color color, FontWeight fw = FontWeight.w700]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

List<Complaint> complaintList = [];
List<String> userList = [];

List<Color> kPinkGradient = [
  Color.fromRGBO(240, 19, 77, 1),
  Color.fromRGBO(228, 0, 124, 1)
];

List<Color> kGreenGradient = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];
Color kPrimaryColor = Colors.brown.shade400;

Color kPrimaryColorPublic = Color(0xFF116ac5);

const kCardTextColorPublic = Colors.white;

const kCardTextStyle = TextStyle(fontSize: 14.0, color: kCardTextColorPublic);

const kEditTextStyle = TextStyle(color: Colors.black);

CustomTextField kUsernameField(TextEditingController controller) {
  return CustomTextField(
    controller: controller,
    icon: Icons.person,
    keyboardType: TextInputType.text,
    hintText: "Username",
  );
}

CustomTextField kEmailField(TextEditingController controller) {
  return CustomTextField(
    controller: controller,
    icon: Icons.email,
    keyboardType: TextInputType.emailAddress,
    hintText: "Email",
  );
}

CustomTextField kPasswordField(TextEditingController controller) {
  return CustomTextField(
    icon: Icons.lock,
    keyboardType: TextInputType.visiblePassword,
    hintText: "Password",
    controller: controller,
  );
}
