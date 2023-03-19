import 'package:flutter/material.dart';

class Popup extends StatelessWidget implements PreferredSizeWidget {
  final String? text1, text2;
  const Popup({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 8, child: Text(text1.toString())),
          const Expanded(flex: 1, child: Text(":")),
          Expanded(flex: 10, child: Text(text2.toString())),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
