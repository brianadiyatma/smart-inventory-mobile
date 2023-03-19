import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/material/material_view/controllers/material_controller.dart';

class Searchmaterial extends StatelessWidget implements PreferredSizeWidget {
  const Searchmaterial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaterialController());
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              height: 50,
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextField(
                controller: controller.searchController,
                onEditingComplete: () {
                  controller.getMaterialList();
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15),
                  prefixIcon: Icon(CupertinoIcons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
