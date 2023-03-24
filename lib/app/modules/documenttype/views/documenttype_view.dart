import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/documenttype_controller.dart';

class DocumenttypeView extends GetView<DocumenttypeController> {
  const DocumenttypeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Select Document Type",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue[900],
              ),
              onPressed: (() {
                Get.toNamed('/my-transactions');
              }),
              child: Row(
                children: const [
                  Icon(
                    CupertinoIcons.arrow_down_circle,
                    size: 26,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Surat Tanda Terima Pengiriman",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue[900],
              ),
              onPressed: (() {
                Get.toNamed('/my-transactions');
              }),
              child: Row(
                children: const [
                  Icon(
                    CupertinoIcons.arrow_merge,
                    size: 26,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Bon Permintaan Material",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
