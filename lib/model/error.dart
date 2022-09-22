import 'package:flutter/cupertino.dart';

class Error {
  String message;
  String title;
  int code;
  IconData icon;

  Error({
    required this.code,
    required this.title,
    required this.message,
    required this.icon,
  });
}
