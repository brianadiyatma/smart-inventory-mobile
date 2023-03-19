import 'package:flutter/material.dart';
import '../themes/app_text_style.dart';

class BuildItemTableInfo extends StatelessWidget {
  const BuildItemTableInfo({
    Key? key,
    required this.context,
    required this.text,
    this.uppercaseAll = true,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final bool uppercaseAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        uppercaseAll ? text.toUpperCase() : text,
        style: AppTextStyle.defaultTheme(context).caption?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
      ),
    );
  }
}
