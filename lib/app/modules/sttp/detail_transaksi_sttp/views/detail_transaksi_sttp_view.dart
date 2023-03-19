import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';
import '../../../../utils/assets_util.dart';
import '../../../../widgets/table_info.dart';
import '../controllers/detail_transaksi_sttp_controller.dart';
import '../widgets/request_list_item_sttp.dart';

class DetailTransaksiSttpView extends GetView<DetailTransaksiSttpController> {
  const DetailTransaksiSttpView({
    Key? key,
  }) : super(key: key);
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
              icon: Icon(
                CupertinoIcons.back,
                color: AppColor.primary,
              ),
            ),
          ),
          body: Obx(
            () {
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
                          controller.getSTTP();
                        },
                        child: const Text("Try Again"),
                      )
                    ],
                  ),
                );
              } else if (!controller.isLoading.value &&
                  controller.error.value.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.onInit();
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AssetsUtil.imageLogoApp,
                            width: 56,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Surat Tanda Terima Pengiriman".toUpperCase(),
                            style: AppTextStyle.defaultTheme(context)
                                .bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "(STTP)".toUpperCase(),
                            style: AppTextStyle.defaultTheme(context)
                                .bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 31,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Table(
                                  columnWidths: const {
                                    0: IntrinsicColumnWidth()
                                  },
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
                                          context: context,
                                          text: "Doc Number "),
                                      BuildItemTableInfo(
                                        context: context,
                                        text: ": " +
                                            controller.docNum.split("/")[1],
                                      )
                                    ]),
                                    TableRow(children: [
                                      BuildItemTableInfo(
                                          context: context, text: "PO No "),
                                      BuildItemTableInfo(
                                        context: context,
                                        text:
                                            ": ${controller.sttpInformasiDetail.value.data!.poNumber}",
                                      )
                                    ]),
                                    TableRow(children: [
                                      BuildItemTableInfo(
                                          context: context, text: "Project "),
                                      BuildItemTableInfo(
                                          context: context,
                                          text:
                                              ": ${controller.sttpInformasiDetail.value.data!.projectCode}"),
                                    ]),
                                    TableRow(children: [
                                      BuildItemTableInfo(
                                          context: context, text: "Doc Date "),
                                      BuildItemTableInfo(
                                          context: context,
                                          text:
                                              ": ${DateFormat("dd MMMM yyyy", 'id_ID').format(DateTime.tryParse(controller.sttpInformasiDetail.value.data!.docDate.toString())!)}"),
                                    ]),
                                    TableRow(children: [
                                      BuildItemTableInfo(
                                          context: context,
                                          text: "Receipt Date "),
                                      BuildItemTableInfo(
                                          context: context,
                                          text: controller.sttpInformasiDetail
                                                      .value.data!.finishedAt ==
                                                  null
                                              ? ": -"
                                              : ": ${DateFormat("dd MMMM yyyy", 'id_ID').format(DateTime.tryParse(controller.sttpInformasiDetail.value.data!.finishedAt.toString())!)}"),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            "Material List",
                            style: AppTextStyle.defaultTheme(context)
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                ),
                          ),
                        ),
                        SingleChildScrollView(
                            child: RequestListItemSttp(
                          controller: controller,
                          details: controller
                              .sttpInformasiDetail.value.data!.details!,
                        )),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 36),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (controller.isLoadingButton.value
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.disabled)) {
                                                return AppColor.black.shade50;
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                        onPressed: controller
                                                    .sttpInformasiDetail
                                                    .value
                                                    .data!
                                                    .finish! &&
                                                controller.sttpInformasiDetail
                                                        .value.data!.status !=
                                                    "PROCESSED"
                                            ? controller.postTransactionComplete
                                            : null,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18, horizontal: 24),
                                          child: Text(
                                            "Transaction Done",
                                            style: AppTextStyle.defaultTheme(
                                                    context)
                                                .button,
                                          ),
                                        ),
                                      )),
                                const SizedBox(
                                  height: 4,
                                ),
                                !controller
                                        .sttpInformasiDetail.value.data!.finish!
                                    ? const Text(
                                        "Some materials have not been processed",
                                        style: TextStyle(
                                          color: AppColor.error,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: Text("Application Error ! Call Admin")),
                    ElevatedButton(
                      onPressed: () {
                        controller.getSTTP();
                      },
                      child: const Text("Try Again"),
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
