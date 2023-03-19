import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/my_transactions_controller.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyTransactionsController());
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
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
                onChanged: (value) {
                  controller.searchTransaction(
                      query: controller.searchController.text);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter document number',
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
}
