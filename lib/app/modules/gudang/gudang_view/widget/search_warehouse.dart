import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchwarehouse extends StatelessWidget implements PreferredSizeWidget {
  final Function onChange;
  final TextEditingController controller;
  const Searchwarehouse({
    Key? key,
    required this.onChange,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                controller: controller,
                onEditingComplete: () {
                  onChange();
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
          const Expanded(flex: 1, child: SizedBox.shrink()),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[900],
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
              child: IconButton(
                icon: const Icon(CupertinoIcons.qrcode_viewfinder),
                iconSize: 34,
                color: Colors.white,
                onPressed: () async {
                  String qr = await Get.toNamed('/qr-helper', arguments: (e) {
                    String query = e.split('/')[3];
                    Get.back(result: query);
                  });
                  controller.text = qr;
                  onChange();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
