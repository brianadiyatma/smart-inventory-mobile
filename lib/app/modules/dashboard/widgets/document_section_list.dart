import 'package:flutter/material.dart';
import 'package:inka_smart_inventory_mobile/app/themes/app_text_style.dart';

class DocumentSectionList {
  static DataCell buildDataCell(BuildContext context, String text) {
    return DataCell(Text(
      text,
      style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
          color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 18),
    ));
  }

  static DataColumn buildDataColumn(BuildContext context, String title) {
    return DataColumn(
      label: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.defaultTheme(context).bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 20),
        ),
      ),
    );
  }
}
