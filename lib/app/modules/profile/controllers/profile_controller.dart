import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/profile.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inka_smart_inventory_mobile/app/services/auth_service.dart';
import 'package:inka_smart_inventory_mobile/app/widgets/custom_snackbar.dart';
import '../../../services/auth_service.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final Rx<File> image = File('').obs;
  final box = GetStorage();

//changepassword
  final TextEditingController oldCont = TextEditingController();
  final TextEditingController newCont = TextEditingController();
  final TextEditingController retypeCont = TextEditingController();
  final loadingButtonChangePassword = false.obs;
///////////////////////////////////////////
//profile
  final Rx<Profile> profileData = Profile().obs;
  final RxBool isProfileLoading = true.obs;
  final RxString isProfileError = ''.obs;
  final RxString profilePic = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print("new init");
    getProfile();
    getPhoto();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logOut() async {
    String token = box.read('token');
    try {
      Response response = await AuthService().logout(token);

      box.remove('token');
      Get.offAllNamed('/login');
      dispose();
      CustomSnackbar.snackbarBlue(
          title: "Logout Completed",
          message: "Logout Completed, Please Login Again");
    } on DioError catch (e) {
      print(e.error);
      CustomSnackbar.snackbarFailed(
          title: "Logout Failed",
          message: e.error.toString(),
          position: SnackPosition.BOTTOM);
    }
  }

  void changePasswordSubmit() async {
    loadingButtonChangePassword.value = true;
    if (oldCont.text.isEmpty ||
        newCont.text.isEmpty ||
        retypeCont.text.isEmpty) {
      CustomSnackbar.snackbarFailed(
          title: "Failed",
          message: "All Field Must Input",
          position: SnackPosition.BOTTOM);
    } else if (newCont.text != retypeCont.text) {
      CustomSnackbar.snackbarFailed(
          title: "Failed",
          message: "New Password not Same",
          position: SnackPosition.BOTTOM);
    } else {
      String token = box.read('token');
      try {
        Response response = await AuthService().changePassword(token, {
          'old_password': oldCont.text.toString(),
          'new_password': newCont.text.toString(),
          'new_password_confirmation': retypeCont.text.toString()
        });

        Get.back();
        CustomSnackbar.snackbarBlue(
            title: "Success", message: "Change Password Successfuly");
      } on DioError catch (e) {
        if (e.response?.statusCode == 401) {
          CustomSnackbar.snackbarFailed(
              title: "Error",
              message: "User Not Authorized",
              position: SnackPosition.TOP);
          logOut();
        } else {
          CustomSnackbar.snackbarFailed(
              title: "Failed",
              message: "Something Went Wrong",
              position: SnackPosition.TOP);
        }
      } finally {
        loadingButtonChangePassword.value = false;
      }
    }
  }

  void getProfile() async {
    String token = box.read('token');
    try {
      Response response = await AuthService().getProfile(token);
      if (response.statusCode == 200) {
        // print(response.data);
        Profile data = Profile.fromJson(response.data);
        profileData.value = data;
      }
    } on DioError catch (e) {
      isProfileError.value = e.error.toString();
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Error",
            message: "User Unauthorized",
            position: SnackPosition.TOP);
        logOut();
      } else {
        CustomSnackbar.snackbarFailed(
            title: "Failed",
            message: "Something Went Wrong",
            position: SnackPosition.TOP);
      }
    } finally {
      isProfileLoading.value = false;
    }
  }

  void pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      onChangeProfile();

      Get.back();
    } on PlatformException catch (e) {
      print('Failed to Pick Image: $e');
    }
  }

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      onChangeProfile();

      Get.back();
    } on PlatformException catch (e) {
      print('Failed to Pick Image: $e');
    }
  }

  void onChangeProfile() async {
    String token = box.read('token');

    try {
      Response response = await AuthService().changeProfile(
          token,
          FormData.fromMap({
            'foto': await MultipartFile.fromFile(image.value.path,
                filename: image.value.path.split('/').last)
          }));

      if (response.statusCode == 200) {
        CustomSnackbar.snackbarBlue(
            title: "Success", message: "Success to Change Photo");
        onInit();
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        CustomSnackbar.snackbarFailed(
            title: "Error",
            message: "User not Aauthorized",
            position: SnackPosition.TOP);
        logOut();
      } else {
        CustomSnackbar.snackbarFailed(
            title: "Gagal",
            message: "Something Went Wrong",
            position: SnackPosition.TOP);
      }
    }
  }

  void getPhoto() async {
    String token = box.read('token');
    try {
      Response response = await AuthService().getPhoto(token);
      if (response.data['image'] != '') {
        profilePic.value = response.data['image'];
      }
    } on DioError catch (e) {
      CustomSnackbar.snackbarFailed(
          title: "Image Failed", message: "Image Can't be Loaded");
    }
  }
}
