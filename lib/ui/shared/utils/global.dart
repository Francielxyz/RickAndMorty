import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void errorSnackBar({
  required BuildContext context,
  required String message,
  String? code,
}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: 'Erro${code != null ? ' $code' : ''}: $message',
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  ).show(context);
}

void successSnackBar({
  required BuildContext context,
  required String message,
  int durationSeconds = 3,
}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: message,
    duration: Duration(seconds: durationSeconds),
    backgroundColor: Colors.green,
  ).show(context);
}
