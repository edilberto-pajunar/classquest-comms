import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final bool isPass;
  final String label;
  final IconData icon;
  final TextEditingController controller;
  String? Function(String?)? validator;
  FormWidget({
    super.key,
    required this.icon,
    this.isPass = false,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: Icon(
          icon,
        ),
      ),
      obscureText: isPass,
    );
  }
}
