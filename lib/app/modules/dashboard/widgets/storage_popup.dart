// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inka_smart_inventory_mobile/app/data/data_dashboard.dart';
import 'package:intl/intl.dart';

class StoragePopup extends StatelessWidget {
  const StoragePopup({
    Key? key,
    required this.materialInfo,
  }) : super(key: key);
  final MaterialInfo materialInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("GR Date"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(DateFormat.yMMMMd()
                      .format(DateTime.parse(materialInfo.grDate.toString()))),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Material Code"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.materialCode.toString()),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Material Desc"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.materialCodes.toString()),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Specification"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.specification.toString()),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Project"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.specialStockNumber.toString()),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Available stock"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.qty.toString()),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("UOM code/name"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                      "${materialInfo.uomId.toString()}/${materialInfo.uomName}"),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text("Storage bin"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 6,
                  child: Text(materialInfo.binCode.toString()),
                )
              ],
            ),
          ],
        ));
  }
}
