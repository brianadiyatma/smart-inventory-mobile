import 'package:flutter/material.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_colors.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';

class TransactionResumeList extends StatelessWidget {
  const TransactionResumeList(
      {Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              text1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                  color: Colors.grey.shade500, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            flex: 2,
            child: Text(
              text2,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
