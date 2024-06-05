import "package:flutter/material.dart";

class MyTextFeild extends StatelessWidget {
  String? hint, lable;
  TextEditingController controller = TextEditingController();
  MyTextFeild({required this.controller, required this.hint, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: hint,
          labelText: lable,
        ),
      ),
    );
  }
}
