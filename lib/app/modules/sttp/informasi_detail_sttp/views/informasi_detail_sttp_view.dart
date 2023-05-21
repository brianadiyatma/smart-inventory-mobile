import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';
import '../../../../utils/assets_util.dart';
import '../../../../widgets/table_info.dart';
import '../controllers/informasi_detail_sttp_controller.dart';

import '../widgets/app_text_field.dart';

class InformasiDetailSttpView extends GetView<InformasiDetailSttpController> {
  InformasiDetailSttpView({Key? key}) : super(key: key);

  @override
  void dispose() {
    controller.locController.dispose();
    controller.typeController.dispose();
    controller.binController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.back,
                color: AppColor.primary,
              ),
            ),
          ),
          body: Obx(
            () {
              late final List<SelectedListItem> _listOfLoc =
                  controller.dataLoc.value.data?.isEmpty ?? true
                      ? [
                          SelectedListItem(
                              name: "No Data", value: "0", isSelected: false)
                        ]
                      : controller.dataLoc.value.data!
                          .map((e) => SelectedListItem(
                              name: e.storageLocationName.toString(),
                              value: e.storageLocationCode.toString(),
                              isSelected: false))
                          .toList();

              late final List<SelectedListItem> _listOfType =
                  controller.dataType.value.data?.isEmpty ?? true
                      ? [
                          SelectedListItem(
                              name: "No Data", value: "0", isSelected: false)
                        ]
                      : controller.dataType.value.data!
                          .map((e) => SelectedListItem(
                              name: e.storageTypeName.toString(),
                              value: e.storageTypeCode.toString(),
                              isSelected: false))
                          .toList();
              late final List<SelectedListItem> _listOfBin =
                  controller.dataBin.value.data?.isEmpty ?? true
                      ? [
                          SelectedListItem(
                              name: "No Data", value: "0", isSelected: false)
                        ]
                      : controller.dataBin.value.data!
                          .map((e) => SelectedListItem(
                              name: e.storageBinName.toString(),
                              value: e.id.toString(),
                              isSelected: false))
                          .toList();

              if (controller.isLoading.value &&
                  controller.error.value.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!controller.isLoading.value &&
                  controller.error.value.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.error.value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.fetchInfoSTTP();
                        },
                        child: const Text("Coba Lagi"),
                      )
                    ],
                  ),
                );
              } else if (!controller.isLoading.value &&
                  controller.error.value.isEmpty) {
                return SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              AssetsUtil.imageLogoAppBorder,
                              width: 56,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          //title
                          Center(
                            child: Text(
                              "Material Information".toUpperCase(),
                              style: AppTextStyle.defaultTheme(context)
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Table(
                            columnWidths: const {0: IntrinsicColumnWidth()},
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            border: TableBorder(
                              bottom: BorderSide(
                                width: 1.3,
                                color: Colors.grey.shade300,
                                style: BorderStyle.solid,
                              ),
                              horizontalInside: BorderSide(
                                  width: 1.3,
                                  color: Colors.grey.shade300,
                                  style: BorderStyle.solid),
                            ),
                            children: [
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "Material Code "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.materialCode == null ? "-" : controller.informasiDetailSTTP.value.data!.materialCode}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "Description "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.materialDesc == null ? "-" : controller.informasiDetailSTTP.value.data!.materialDesc}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "Specification "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.specification == null ? "-" : controller.informasiDetailSTTP.value.data!.specification}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "UOM "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.uom == null ? "-" : controller.informasiDetailSTTP.value.data!.uom}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "PO Quantity"),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.qtyPo! == null ? "-" : controller.informasiDetailSTTP.value.data!.qtyPo.toString()}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "LPPB Quantity "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.qtyGr105 == null ? "-" : controller.informasiDetailSTTP.value.data!.qtyGr105.toString()}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context, text: "NCR "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.qtyNcr == null ? "-" : controller.informasiDetailSTTP.value.data!.qtyNcr.toString()}"),
                              ]),
                              TableRow(children: [
                                BuildItemTableInfo(
                                    context: context,
                                    text: "Received Quantity "),
                                BuildItemTableInfo(
                                    context: context,
                                    text:
                                        ": ${controller.informasiDetailSTTP.value.data!.qtyWarehouse! == "" ? "-" : controller.informasiDetailSTTP.value.data!.qtyWarehouse.toString()}"),
                              ]),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          //title
                          Center(
                            child: Text(
                              "Storage".toUpperCase(),
                              style: AppTextStyle.defaultTheme(context)
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //layout/rak
                          Row(
                            children: [
                              controller.scanResult.value.isEmpty
                                  ? Expanded(
                                      flex: 8,
                                      child: controller.isLoadingLoc.value
                                          ? const SizedBox(
                                              width: double.infinity,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : AppTextFieldSTTP(
                                              title: "Warehouse",
                                              readOnly: true,
                                              textEditingController:
                                                  controller.locController,
                                              hint: "Warehouse",
                                              isCitySelected: true,
                                              items: _listOfLoc,
                                              onChange: (e) {
                                                controller.getTypeGudang(e);
                                              }))
                                  : Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          controller.scanResult.value,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                              const Expanded(flex: 1, child: SizedBox.shrink()),
                              Expanded(
                                  flex: 3,
                                  child: controller.scanResult.value.isEmpty
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              color: Colors.blue,
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                String qr = await Get.toNamed(
                                                    '/qr-helper',
                                                    arguments: (e) {
                                                  Get.back(result: e);
                                                });
                                                controller.scanResult.value =
                                                    qr;
                                                controller.loc.value = '';
                                                controller.locController.text =
                                                    '';
                                                controller.type.value = '';
                                                controller.typeController.text =
                                                    '';
                                                controller.bin.value = '';
                                                controller.binController.text =
                                                    '';

                                                controller.update();
                                              },
                                              icon: const Icon(
                                                CupertinoIcons
                                                    .qrcode_viewfinder,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              color: Colors.red,
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                controller.scanResult.value =
                                                    "";
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.clear,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 12,
                                  child: controller.loc.value.isEmpty
                                      ? const SizedBox.shrink()
                                      : (controller.isLoadingType.value
                                          ? const SizedBox(
                                              width: double.infinity,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : AppTextFieldSTTP(
                                              title: "Type",
                                              readOnly: true,
                                              textEditingController:
                                                  controller.typeController,
                                              hint: "Type",
                                              isCitySelected: true,
                                              items: _listOfType,
                                              onChange: (e) {
                                                controller.getBinGudang(e);
                                              }))),
                            ],
                          ),
                          controller.type.value.isEmpty
                              ? const SizedBox.shrink()
                              : (controller.isLoadingBin.value
                                  ? const SizedBox(
                                      width: double.infinity,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 12,
                                          child: AppTextFieldSTTP(
                                            title: "Layout/Bin",
                                            readOnly: true,
                                            textEditingController:
                                                controller.binController,
                                            hint: "Layout/Bin",
                                            isCitySelected: true,
                                            items: _listOfBin,
                                            onChange: (e) {
                                              controller.bin.value = e;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                          //kuantitas barang
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: TextFormField(
                                  readOnly: false,
                                  controller: controller.kuantitasController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    contentPadding: EdgeInsets.only(
                                        left: 8, bottom: 0, top: 0, right: 15),
                                    hintText: "Quantity",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //tambah stok
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 8),
                                    child: controller.image.value.path == ''
                                        ? const Text(
                                            "No Image",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Image.file(
                                            height: 200,
                                            controller.image.value,
                                            fit: BoxFit.contain,
                                          )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: Colors.grey,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 25,
                                                            left: 30,
                                                            right: 30),
                                                    child: Center(
                                                      child: Container(
                                                        height: 55.0,
                                                        width: double.infinity,
                                                        decoration: const BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          0, 5),
                                                                  blurRadius:
                                                                      5.0)
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                  Colors.blue,
                                                                  Colors
                                                                      .lightBlue
                                                                ])),
                                                        child: ElevatedButton(
                                                          // onPressed: () {},
                                                          onPressed: (() =>
                                                              controller
                                                                  .pickImage()),
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
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Center(
                                                      child: Text(
                                                        "OR",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            left: 30,
                                                            right: 30),
                                                    child: Center(
                                                      child: Container(
                                                        height: 55.0,
                                                        width: double.infinity,
                                                        decoration: const BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          0, 5),
                                                                  blurRadius:
                                                                      5.0)
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                  Colors.blue,
                                                                  Colors
                                                                      .lightBlue
                                                                ])),
                                                        child: ElevatedButton(
                                                          // onPressed: () {},
                                                          onPressed: (() =>
                                                              controller
                                                                  .pickImageC()),
                                                          style: ElevatedButton
                                                              .styleFrom(),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              Icon(CupertinoIcons
                                                                  .photo_camera_solid),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Use a Camera',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
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
                                    icon: const Icon(
                                      CupertinoIcons.photo_camera_solid,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: SizedBox.shrink(),
                              ),
                              Expanded(
                                flex: 7,
                                child: SizedBox(
                                  height: 50,
                                  child: controller.isLoadingButton.value
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ElevatedButton(
                                          onPressed: controller
                                                          .informasiDetailSTTP
                                                          .value
                                                          .data!
                                                          .qtyLeft ==
                                                      0 &&
                                                  int.tryParse(controller
                                                          .kuantitasController
                                                          .text)! >
                                                      controller
                                                          .informasiDetailSTTP
                                                          .value
                                                          .data!
                                                          .qtyLeft!
                                              ? null
                                              : controller.postData,
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      4), // <-- Radius
                                            ),
                                          ),
                                          child: const Text(
                                            'Add Stock',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: SizedBox.shrink(),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    height: 50,
                                    child: Text(
                                      "${controller.informasiDetailSTTP.value.data!.qtyLeft == null ? "-" : controller.informasiDetailSTTP.value.data!.qtyLeft} Items Unprocessed",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: Text("Application Error ! Call Admin")),
                    ElevatedButton(
                      onPressed: () {
                        controller.fetchInfoSTTP();
                      },
                      child: const Text("Coba lagi"),
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
