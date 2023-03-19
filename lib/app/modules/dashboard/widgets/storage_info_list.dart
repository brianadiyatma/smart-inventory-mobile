import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';

class StorageInfoList extends StatelessWidget {
  const StorageInfoList(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);
  final String text;
  final Icon icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
