import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
  String? placeHolder;
  TextEditingController? controller;
  PasswordForm({super.key, this.placeHolder = "", required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue[900]!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue[600]!),
          ),
          hintText: placeHolder,
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500]),
        ),
      ),
    );
  }
}
