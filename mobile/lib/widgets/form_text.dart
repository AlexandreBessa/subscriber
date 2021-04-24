import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  FormText({
    this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
