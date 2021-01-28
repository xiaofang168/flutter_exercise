import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AppToast {

 static void show(String title,{ToastGravity position = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xE5333333),
        textColor: Colors.white,
        fontSize: 14.0);
  }

}