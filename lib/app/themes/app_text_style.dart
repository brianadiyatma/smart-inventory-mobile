import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextTheme defaultTheme(BuildContext context) =>
      Theme.of(context).textTheme;

  static ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
}
