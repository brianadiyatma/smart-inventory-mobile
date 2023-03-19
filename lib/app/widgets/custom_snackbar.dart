import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static var data =
      Get.snackbar("Login Status", "Login berhasil di verifikasi oleh server");

  static SnackbarController snackbarSuccess(
      {required String title,
      required String message,
      SnackPosition? position}) {
    return Get.snackbar(title, message,
        borderColor: Colors.greenAccent,
        borderWidth: 2,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          CupertinoIcons.check_mark_circled,
          color: Colors.white,
        ),
        snackPosition: position,
        duration: const Duration(seconds: 5),
        messageText: Text(
          message,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static SnackbarController snackbarBlue(
      {required String title,
      required String message,
      SnackPosition? position}) {
    return Get.snackbar(title, message,
        borderColor: Colors.blueAccent,
        borderWidth: 2,
        backgroundColor: Colors.blue[800],
        colorText: Colors.white,
        icon: const Icon(
          CupertinoIcons.check_mark_circled,
          color: Colors.white,
        ),
        snackPosition: position,
        duration: const Duration(seconds: 5),
        messageText: Text(
          message,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static SnackbarController snackbarFailed(
      {required String title,
      required String message,
      SnackPosition? position}) {
    return Get.snackbar(title, message,
        borderColor: Colors.redAccent,
        borderWidth: 2,
        backgroundColor: Colors.red[600],
        colorText: Colors.white,
        icon: const Icon(CupertinoIcons.exclamationmark_shield,
            color: Colors.white),
        snackPosition: position,
        duration: const Duration(seconds: 5),
        messageText: Text(
          message,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static SnackbarController snackbarWarning(
      {required String title,
      required String message,
      SnackPosition? position}) {
    return Get.snackbar(title, message,
        borderColor: Colors.yellowAccent,
        borderWidth: 2,
        backgroundColor: Colors.yellow[600],
        colorText: Colors.black,
        icon: const Icon(CupertinoIcons.info_circle, color: Colors.black),
        snackPosition: position,
        duration: const Duration(seconds: 5),
        messageText: Text(
          message,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
