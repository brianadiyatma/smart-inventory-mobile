import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_style.dart';
import '../../../../utils/assets_util.dart';
import '../controllers/detail_gudang_controller.dart';

class DetailGudangView extends GetView<DetailGudangController> {
  const DetailGudangView({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 0, left: 0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AssetsUtil.imageLogoApp,
                      width: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //title
                  Center(
                    child: Text(
                      "Detail Warehouse".toUpperCase(),
                      style: AppTextStyle.defaultTheme(context)
                          .bodyLarge
                          ?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // const StoreInfoSection(),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.blue[100]!,
                          blurRadius: 4.0,
                        ),
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.blue[200]!,
                          blurRadius: 4.0,
                        ),
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.blue[300]!,
                          blurRadius: 4.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.blue[500]!, Colors.blue[800]!],
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          "Material Part".toUpperCase(),
                                          style:
                                              AppTextStyle.defaultTheme(context)
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Material Code",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "B529526529",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Special Stock Number",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "S-14001.1.02",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Row(
                                            children: [
                                              Container(
                                                  width: 170,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Stock",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          "5 Barang",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Container(
                                                  width: 145,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "BUN",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          "M",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Strorage Bin",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "R04-001",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "GR Date",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "14 Oktober 2022",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Material Desc",
                                                      style: AppTextStyle
                                                              .defaultTheme(
                                                                  context)
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    ),
                                                    Text(
                                                      "BOLT HEX + NUT + SW + PW BAJA 8.8T",
                                                      style: AppTextStyle
                                                              .defaultTheme(
                                                                  context)
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          "Material by Project".toUpperCase(),
                                          style:
                                              AppTextStyle.defaultTheme(context)
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Material Code",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "B529526529",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Special Stock Number",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "S-14001.1.02",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Material Code",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "B529526529",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Special Stock Number",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "S-14001.1.02",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Material Code",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "B529526529",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Special Stock Number",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "S-14001.1.02",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Row(
                                            children: [
                                              Container(
                                                  width: 170,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Stock",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          "5 Barang",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Container(
                                                  width: 145,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "BUN",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          "M",
                                                          style: AppTextStyle
                                                                  .defaultTheme(
                                                                      context)
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Strorage Bin",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "R04-001",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "GR Date",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "14 Oktober 2022",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Strorage Bin",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "R04-001",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "GR Date",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "14 Oktober 2022",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 170,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 150,
                                                                child:
                                                                    Container(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Strorage Bin",
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        "R04-001",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.defaultTheme(context).bodySmall?.copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 14),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Container(
                                                      width: 145,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "GR Date",
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Text(
                                                              "14 Oktober 2022",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                      .defaultTheme(
                                                                          context)
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Material Desc",
                                                      style: AppTextStyle
                                                              .defaultTheme(
                                                                  context)
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    ),
                                                    Text(
                                                      "BOLT HEX + NUT + SW + PW BAJA 8.8T",
                                                      style: AppTextStyle
                                                              .defaultTheme(
                                                                  context)
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoreInfoSection extends StatelessWidget {
  const StoreInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 100,
          child: ListView.builder(
            itemCount: 4,
            padding: const EdgeInsets.only(left: 14),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '7',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const Text('Komponen')
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
