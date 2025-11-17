import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { SUCCESS, ERORR, WARNING }


Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green.shade500;
      break;
    case ToastState.ERORR:
      color = Colors.red.shade500;
      break;
    case ToastState.WARNING:
      color = Colors.amber.shade500;
      break;
  }
  return color;
}


void showToast({
  required String msg,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);


