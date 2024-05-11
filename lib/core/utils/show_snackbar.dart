import 'package:flutter/material.dart';

void ShowSnackbar({required String ERROR, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(ERROR)),
    backgroundColor: Colors.black,
  ));
}
