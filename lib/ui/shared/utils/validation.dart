import 'package:flutter/material.dart';

class Validation {
  static Color verifyStatus(String status) {
    if (status == "Alive") {
      return Colors.green;
    } else if (status == "Dead") {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}