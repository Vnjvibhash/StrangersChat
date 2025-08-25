import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
