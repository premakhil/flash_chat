import 'package:flutter/material.dart';

const mainPurple = Color(0xff6750A4);
const subPurple = Color(0xffE8DEF8);
var borderPurple = Color(0xffE8DEF8);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Specify value here',
  hintStyle: TextStyle(color: Color.fromARGB(255, 176, 190, 197)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE8DEF8), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE8DEF8), width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
