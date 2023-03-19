import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inka_smart_inventory_mobile/app/modules/bpm/informasi_detail_bpm/widgets/app_text_field.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';
import '../../../../utils/assets_util.dart';
import '../../../../widgets/table_info.dart';
import '../controllers/informasi_detail_bpm_controller.dart';

class InformasiDetailBpmView extends GetView<InformasiDetailBpmController> {
  const InformasiDetailBpmView({Key? key}) : super(key: key);

  @override
  void dispose() {
    controller.binController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(CupertinoIcons.back, color: Colors.blue[900]),
            ),
          ),
          body: Obx((() {
            late final List<SelectedListItem> listOfBin = controller
                            .informasiDetailBPM.value.data!.bin?.isEmpty ==
                        true ||
                    controller.informasiDetailBPM.value.data!.bin?.isEmpty ==
                        true
                ? [
                    SelectedListItem(
                        name: "No Data", value: "0", isSelected: false)
                  ]
                : controller.informasiDetailBPM.value.data!.bin!
                    .map((e) => SelectedListItem(
                        name:
                            "${e.plantName.toString()}/${e.storageLocationName.toString()}/${e.storageTypeName.toString()}/${e.storageBinName.toString()}",
                        value: e.id.toString(),
                        isSelected: false))
                    .toList();
            if (controller.isLoading.value && controller.error.value.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!controller.isLoading.value &&
                controller.error.value.isNotEmpty) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      controller.error.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.fetchInfoBPM();
                      },
                      child: const Text("Try Again"),
                    )
                  ],
                ),
              );
            } else if (!controller.isLoading.value &&
                controller.error.value.isEmpty) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //logo
                      Center(
                        child: Image.asset(
                          AssetsUtil.imageLogoAppBorder,
                          width: 56,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //Title
                      Center(
                        child: Text(
                          "BPM Information".toUpperCase(),
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
                      //Table
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
                                context: context, text: "Reservation "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.reservationNumber}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Material Code "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.materialCode}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "WBS Code "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.wbsCode}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Items "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.item}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Specifications "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.specification}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(context: context, text: "UOM "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.uomCode}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Quantity Requested"),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.requirementQty}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Request Date "),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.requirementDate}"),
                          ]),
                          TableRow(children: [
                            BuildItemTableInfo(
                                context: context, text: "Description"),
                            BuildItemTableInfo(
                                context: context,
                                text:
                                    ": ${controller.informasiDetailBPM.value.data!.detail!.note}"),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //Title
                      Center(
                        child: Text(
                          "Stock Information".toUpperCase(),
                          style: AppTextStyle.defaultTheme(context)
                              .bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 12,
                            child: AppTextFieldBPM(
                              title: "Layout/Bin",
                              readOnly: true,
                              textEditingController: controller.binController,
                              hint: "Layout/Bin",
                              isCitySelected: true,
                              items: listOfBin,
                              onChange: (e) {
                                controller.bin.value = e;
                                // print(e);
                                // print(controller
                                //     .informasiDetailBPM.value.data!.bin![0].id);

                                var element = controller
                                    .informasiDetailBPM.value.data!.bin!
                                    .where((element) =>
                                        element.id == int.parse(e));
                                controller.qtyCurrentItem.value =
                                    element.first.qty!;
                                // print(element.first);
                              },
                            ),
                          ),
                        ],
                      ),
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
                                hintText: "Take",
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
                      //tambah stok
                      Row(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Container(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                height: 50,
                                child: Text(
                                  // "${controller.informasiDetailBPM.value.data?.detail?.qtyLeft.toString()} Available Stock",
                                  "Available Stock ${controller.qtyCurrentItem.value} ${controller.informasiDetailBPM.value.data!.detail!.uomCode}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Container(
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 8),
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
                      //tambah stok
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
                                                padding: const EdgeInsets.only(
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
                                                    decoration: const BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black26,
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
                                icon: const Icon(
                                  CupertinoIcons.camera_fill,
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
                                      onPressed: controller.postData,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              4), // <-- Radius
                                        ),
                                      ),
                                      child: const Text(
                                        'Take Stock',
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
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                height: 50,
                                child: Text(
                                  "${controller.informasiDetailBPM.value.data?.detail?.qtyLeft.toString()} Items Unprocessed",
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
                ),
              );
            } else {
              return const Center(
                child: Text("Application Error ! Call Admin"),
              );
            }
          }))),
    );
  }
}
