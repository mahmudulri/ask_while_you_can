import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

endToast() {
  Fluttertoast.showToast(
      msg: "No questions more !!",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 15,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff4F7C87));
}

copyToast() {
  Fluttertoast.showToast(
      msg: "Coppied Successfully!",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 15,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff4F7C87));
}
