import 'package:flutter/material.dart';
import 'package:inka_smart_inventory_mobile/app/data/data_materials_list.dart';
import '../../../../themes/app_colors.dart';
import 'package:get/get.dart';
import '../../detail_material/views/detail_material_view.dart';

class Itemmaterial extends StatelessWidget {
  final MaterialContent material;
  const Itemmaterial({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.grey[200]!,
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            splashColor: AppColor.primary.shade50,
            onTap: () {
              Get.toNamed('/detail-material', arguments: {
                "materialCode": material.materialCode,
                "materialDescription": material.materialDesc,
                "materialUom": material.uom,
                "specialStock": material.specialStockNumber,
                "qty": material.qtyStock
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 15, right: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(material.materialCode!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900])),
                        Text("Material Code",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900])),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.grey[400],
                        height: 60,
                        width: 2,
                      )),
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(material.materialDesc!,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 9,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("WBS Code",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[600])),
                                            Text(material.specialStockNumber!,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[800]))
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1, child: SizedBox.shrink()),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Stock",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[600])),
                                            Text(
                                                "${material.qtyStock} ${material.uom}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[800]))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
