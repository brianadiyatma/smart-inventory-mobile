import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inka_smart_inventory_mobile/app/modules/profile/screens/edit_password.dart';

import '../controllers/profile_controller.dart';
import './styles/button_style.dart';
import '../../../utils/assets_util.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

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
              Text("Profile",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isProfileLoading.value &&
              controller.isProfileError.value.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.isProfileError.value.isNotEmpty &&
              !controller.isProfileLoading.value) {
            return Center(
              child: Text(controller.isProfileError.value),
            );
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Stack(
                      children: [
                        Obx(() {
                          return Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1))
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        controller.profilePic.value.isNotEmpty
                                            ? Image.memory(base64Decode(
                                                    controller.profilePic.value
                                                        .toString()))
                                                .image
                                            : const AssetImage(
                                                AssetsUtil.profileNotFound))),
                          );
                        }),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        Colors.white, // <-- SEE HERE
                                    builder: (context) {
                                      return SizedBox(
                                        height: 220,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 30, right: 30),
                                              child: Center(
                                                child: Container(
                                                  height: 55.0,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                Offset(0, 5),
                                                            blurRadius: 5.0)
                                                      ],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.blue,
                                                                Colors.lightBlue
                                                              ])),
                                                  child: ElevatedButton(
                                                    // onPressed: () {},
                                                    onPressed: (() =>
                                                        controller.pickImage()),
                                                    style: ElevatedButton
                                                        .styleFrom(),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(CupertinoIcons
                                                            .photo_fill),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Browse Galery',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Center(
                                                child: Text(
                                                  "OR",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 25,
                                                  left: 30,
                                                  right: 30),
                                              child: Center(
                                                child: Container(
                                                  height: 55.0,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                Offset(0, 5),
                                                            blurRadius: 5.0)
                                                      ],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.blue,
                                                                Colors.lightBlue
                                                              ])),
                                                  child: ElevatedButton(
                                                    // onPressed: () {},
                                                    onPressed: (() => controller
                                                        .pickImageC()),
                                                    style: ElevatedButton
                                                        .styleFrom(),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(CupertinoIcons
                                                            .camera_fill),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Use a Camera',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    color: Colors.blue[800]),
                                child: const Icon(
                                  CupertinoIcons.pen,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Center(
                      child: Text(
                        controller.profileData.value.user!.name.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'NIP: ${controller.profileData.value.user!.nip.toString()}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      controller.profileData.value.user!
                                                  .plant ==
                                              null
                                          ? '-'
                                          : controller.profileData.value.user!
                                              .plant!.plantName
                                              .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900])),
                                  Text("Plant",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
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
                                  height: 50,
                                  width: 2,
                                )),
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      controller.profileData.value.user!
                                                  .division ==
                                              null
                                          ? "-"
                                          : controller.profileData.value.user!
                                              .division!.divisionName
                                              .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900])),
                                  Text("Division",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
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
                                  height: 50,
                                  width: 2,
                                )),
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      controller.profileData.value.user!
                                                  .position ==
                                              null
                                          ? "-"
                                          : controller.profileData.value.user!
                                              .position!.positionName
                                              .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900])),
                                  Text("Position",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[900])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       boxShadow: <BoxShadow>[
                        //         BoxShadow(
                        //           color: Colors.grey.withOpacity(0.1),
                        //           blurRadius: 5,
                        //           offset: const Offset(0, 3),
                        //         ),
                        //       ],
                        //     ),
                        //     child: TextButton(
                        //       style: TextButton.styleFrom(
                        //         padding: const EdgeInsets.all(20),
                        //         backgroundColor: Colors.blue[800],
                        //       ),
                        //       onPressed: (() {
                        //         // Navigator.push(
                        //         //   context,
                        //         //   MaterialPageRoute(
                        //         //       builder: (context) => const MyTransactionsView()),
                        //         // );
                        //       }),
                        //       child: Row(
                        //         children: const [
                        //           Icon(
                        //             Icons.person,
                        //             size: 26,
                        //             color: Colors.white,
                        //           ),
                        //           SizedBox(width: 20),
                        //           Expanded(
                        //             child: Text(
                        //               "Account",
                        //               style: TextStyle(
                        //                   fontSize: 17,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w600),
                        //             ),
                        //           ),
                        //           Icon(
                        //             Icons.arrow_forward_ios,
                        //             color: Colors.white,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextButton(
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
                                    CupertinoIcons.list_dash,
                                    size: 26,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "My Transaction",
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Colors.blue[900],
                              ),
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPasswordView()),
                                );
                              }),
                              child: Row(
                                children: const [
                                  Icon(
                                    CupertinoIcons.pen,
                                    size: 26,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "Edit Password",
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Colors.blue[900],
                              ),
                              onPressed: (() {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Logout"),
                                    content:
                                        const Text("Apakah anda ingin Logout?"),
                                    actions: <Widget>[
                                      TextButton(
                                        style: flatButtonStyle,
                                        child: const Text("Cancel"),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                        style: flatButtonStyle,
                                        child: const Text("Logout"),
                                        onPressed: () => controller.logOut(),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              child: Row(
                                children: const [
                                  Icon(
                                    size: 26,
                                    CupertinoIcons.arrow_right_square,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      "Logout",
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
