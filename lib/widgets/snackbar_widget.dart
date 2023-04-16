import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  final String message;
  const SnackbarWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return snackBar;
  }
}
