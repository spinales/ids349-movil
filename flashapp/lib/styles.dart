import 'package:flutter/material.dart';

const kInputStyle =
InputDecoration(
  hintText: '',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlue,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.lightBlue,
        width: 2.0
    ),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
)
;