import 'package:flutter/material.dart';

void buildSnackBar(
  BuildContext context, {
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
