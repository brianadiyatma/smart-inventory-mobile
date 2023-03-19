import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NipFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  const NipFieldLogin({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(CupertinoIcons.person),
          hintText: "Enter your NIP",
          hintStyle: const TextStyle(height: 1, color: Colors.grey),
        ),
      ),
    );
  }
  //   );
  // }
}
