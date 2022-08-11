import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/DashboardController/DashboardController.dart';
import 'package:novin_dashboard1/model/DashBoard/ChartModel.dart';
import 'package:novin_dashboard1/model/DashBoard/DashBoardModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    DashBoardController controller = Get.put(DashBoardController());
    if(Utils.dashBoardReq) {
      controller.getDashboard(
          convertJtoGDate(controller.year.value, controller.month.value,
              controller.day.value),
          convertJtoGDate(controller.endYear.value, controller.endMonth.value,
              controller.endDay.value));
      Utils.dashBoardReq = false;
    }

    return Scaffold(
      body: Container(
        width: wi,
        height: he,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wi * 0.04),
                child: Row(
                  children: [
                    Text('از  '),
                    MaterialButton(
                      onPressed: () {
                        showCalender(context, controller, 1);
                      },
                      height: he * 0.04,
                      minWidth: wi * 0.25,
                      child: Obx(() {
                        return Text(
                          controller.year.value.toString() +
                              "/" +
                              controller.month.value.toString() +
                              "/" +
                              controller.day.value.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(AppColor.primaryColor)),
                        );
                      }),
                      color: Colors.grey.shade100,
                      elevation: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    SizedBox(
                      width: wi * 0.04,
                    ),
                    Text('تا  '),
                    MaterialButton(
                      onPressed: () {
                        showCalender(context, controller, 0);
                      },
                      height: he * 0.04,
                      minWidth: wi * 0.25,
                      child: Obx(() {
                        return Text(
                          controller.endYear.value.toString() +
                              "/" +
                              controller.endMonth.value.toString() +
                              "/" +
                              controller.endDay.value.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(AppColor.primaryColor)),
                        );
                      }),
                      color: Colors.grey.shade100,
                      elevation: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        controller.loadingDashboard.value = true;
                        controller.getDashboard(
                            convertJtoGDate(controller.year.value,
                                controller.month.value, controller.day.value),
                            convertJtoGDate(
                                controller.endYear.value,
                                controller.endMonth.value,
                                controller.endDay.value));
                      },
                      child: Container(
                        height: he * 0.04,
                        width: wi * 0.25,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: wi * 0.04),
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Color(AppColor.primaryColor)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade100,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]),
                        child:Text("نمایش"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: he * 0.03,
              ),
              Obx(() {
                return controller.loadingDashboard.value == true
                    ? Container(
                        margin: EdgeInsets.only(top: he / 3.5),
                        child: CircularProgressIndicator(
                          color: Color(AppColor.primaryColor),
                        ),
                      )
                    : Container(
                        width: wi,
                        child: Column(
                          children: [
                            Container(
                              width: wi,
                              height: he * 0.3,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    boxForoosh(controller),
                                    boxReturnForoosh(controller),
                                    boxDaryafti(controller),
                                    boxPardakhti(controller),
                                    boxHazinehVdaramad(controller)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: wi * 0.025,
                            ),
                            Container(
                              width: wi,
                              height: he * 0.05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.activeBackGround.value = 1;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(wi * 0.016),
                                      child: Text(
                                        "فروش کل_تعدادی",
                                        style: TextStyle(fontSize: wi * 0.03),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: controller
                                                            .activeBackGround
                                                            .value ==
                                                        1
                                                    ? Colors.green.shade100
                                                    : Colors.white10,
                                                blurRadius: 4,
                                                spreadRadius: 4,
                                                offset: Offset(2, 2))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(wi * 0.02)),
                                          color: controller
                                                      .activeBackGround.value ==
                                                  1
                                              ? Colors.green.shade200
                                              : Colors.grey.shade200),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.activeBackGround.value = 2;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(wi * 0.016),
                                      child: Text(
                                        "فروش کل_ریالی",
                                        style: TextStyle(fontSize: wi * 0.03),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(wi * 0.02)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: controller
                                                            .activeBackGround
                                                            .value ==
                                                        2
                                                    ? Colors.orange.shade100
                                                    : Colors.white10,
                                                blurRadius: 4,
                                                spreadRadius: 4,
                                                offset: Offset(2, 2))
                                          ],
                                          color: controller
                                                      .activeBackGround.value ==
                                                  2
                                              ? Colors.orange.shade200
                                              : Colors.grey.shade200),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.activeBackGround.value = 3;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(wi * 0.016),
                                      child: Text(
                                        "فروش هفتگی",
                                        style: TextStyle(fontSize: wi * 0.03),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: controller
                                                            .activeBackGround
                                                            .value ==
                                                        3
                                                    ? Colors.blue.shade100
                                                    : Colors.white10,
                                                blurRadius: 4,
                                                spreadRadius: 4,
                                                offset: Offset(2, 2))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(wi * 0.02)),
                                          color: controller
                                                      .activeBackGround.value ==
                                                  3
                                              ? Colors.blue.shade200
                                              : Colors.grey.shade200),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.activeBackGround.value = 4;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(wi * 0.016),
                                      child: Text(
                                        "برگشت فروش هفتگی",
                                        style: TextStyle(fontSize: wi * 0.03),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: controller
                                                            .activeBackGround
                                                            .value ==
                                                        4
                                                    ? Color(0xffe1bee7)
                                                    : Colors.white10,
                                                blurRadius: 4,
                                                spreadRadius: 4,
                                                offset: Offset(2, 2))
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(wi * 0.02)),
                                          color: controller
                                                      .activeBackGround.value ==
                                                  4
                                              ? Color(0xffce93d8)
                                              : Colors.grey.shade200),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: wi * 0.02,
                            ),
                            Container(
                              padding: EdgeInsets.all(wi * 0.04),
                              width: wi,

                              child: Column(
                                children: [
                                  controller.activeBackGround.value == 1
                                      ? forooshKol_tedad_chart(controller)
                                      : controller.activeBackGround.value == 2
                                          ? forooshKol_rial_chart(controller)
                                          : controller.activeBackGround.value ==
                                                  3
                                              ? foroosh_haftegi(controller)
                                              : returnForoosh_haftegi(controller)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

void showCalender(BuildContext context, DashBoardController controller, int num) async {
  /////////////////////////Example 1////////////////////////////
  Jalali? picked = await showPersianDatePicker(
    context: context,
    initialDate: Jalali.now(),
    firstDate: Jalali(1385, 8),
    lastDate: Jalali(1450, 9),
  );
  if (num == 1) {
    controller.day.value = picked!.day;
    controller.month.value = picked.month;
    controller.year.value = picked.year;
  } else {
    controller.endDay.value = picked!.day;
    controller.endMonth.value = picked.month;
    controller.endYear.value = picked.year;
  }
}

Widget boxForoosh(DashBoardController controller) {
  return Container(
    width: Get.width * 0.35,
    height: Get.height * 0.3,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.primaryColor), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              color: Color(AppColor.primaryColor),
              child: Text(
                "فروش",
                style: TextStyle(
                    fontSize: Get.width * 0.035,
                    color: Color(AppColor.onPrimaryColor)),
              ),
            )),
        Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("مبلغ فروش",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.totalOfSales.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("زیان",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.soodZian.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("تعداد",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.qSaleDoc.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget boxReturnForoosh(DashBoardController controller) {
  return Container(
    width: Get.width * 0.35,
    height: Get.height * 0.3,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.primaryColor), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              color: Color(AppColor.primaryColor),
              child: Text(
                "برگشت از فروش",
                style: TextStyle(
                    fontSize: Get.width * 0.035,
                    color: Color(AppColor.onPrimaryColor)),
              ),
            )),
        Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("مبلغ برگشت از فروش",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.retFactorTotalPrice.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("تعداد",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.countgoods.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("مقدار",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.dashBoardModel.value.foroshAndReturnList!.countReturndocs.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget boxDaryafti(DashBoardController controller) {
  return Container(
    width: Get.width * 0.35,
    height: Get.height * 0.3,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.primaryColor), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              color: Color(AppColor.primaryColor),
              child: Text(
                "دریافتی",
                style: TextStyle(
                    fontSize: Get.width * 0.035,
                    color: Color(AppColor.onPrimaryColor)),
              ),
            )),
        Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("اسناد وصولی نزد صندوق",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.asnadVosol.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("حساب صندوق",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.hesab_sandoq.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("سود فروش",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.hesab_bank_d.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget boxPardakhti(DashBoardController controller) {
  return Container(
    width: Get.width * 0.35,
    height: Get.height * 0.3,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.primaryColor), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              color: Color(AppColor.primaryColor),
              child: Text(
                "پرداختی",
                style: TextStyle(
                    fontSize: Get.width * 0.035,
                    color: Color(AppColor.onPrimaryColor)),
              ),
            )),
        Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("اسناد پرداختی",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.asnad_pardakhti.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("مبلغ چک های پرداختی",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber("0"),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("حساب بانک ها",
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.hesab_bank_p.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Color(AppColor.primaryColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget boxHazinehVdaramad(DashBoardController controller) {
  return Container(
    width: Get.width * 0.35,
    height: Get.height * 0.3,
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.primaryColor), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              color: Color(AppColor.primaryColor),
              child: Text(
                "هزینه و درآمد",
                style: TextStyle(
                    fontSize: Get.width * 0.035,
                    color: Color(AppColor.onPrimaryColor)),
              ),
            )),
        Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("فروش خدمات",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.foroosh_khadamat.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("هزینه",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.hazine.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text("سایر درآمد",
                            style: TextStyle(
                                fontSize: Get.width * 0.032,
                                color: Colors.black)),
                        Text(setFormatNumber(controller.sayer_daramad.toString()),
                            style: TextStyle(
                                fontSize: Get.width * 0.03,
                                color: Color(AppColor.primaryColor))),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget forooshKol_tedad_chart(DashBoardController controller){

  return Center(
      child:SfCircularChart(
         // title: ChartTitle(text: 'Sales by sales person'),
          legend: Legend(isVisible: true),
          series: <PieSeries<ForoshMojodiKala, String>>[
            PieSeries<ForoshMojodiKala, String>(
                explode: true,
                explodeIndex: 0,
                dataSource: controller.dashBoardModel.value.foroshMojodiKala,
                xValueMapper: (ForoshMojodiKala data, _) => data.fLDTIFLFAC,
                yValueMapper: (ForoshMojodiKala data, _) => int.parse(data.sumQty!),
               // dataLabelMapper: (_PieData data, _) => data.text,
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]
      )
  );
}
Widget forooshKol_rial_chart(DashBoardController controller){

  return Center(
      child:SfCircularChart(
        //  title: ChartTitle(text: 'Sales by sales person'),
          legend: Legend(isVisible: true),
          series: <PieSeries<ForoshMojodiKala, String>>[
            PieSeries<ForoshMojodiKala, String>(
                explode: true,
                explodeIndex: 0,
                dataSource: controller.dashBoardModel.value.foroshMojodiKala,
                xValueMapper: (ForoshMojodiKala data, _) => data.fLDTIFLFAC,
                yValueMapper: (ForoshMojodiKala data, _) => int.parse(data.total!),
                // dataLabelMapper: (_PieData data, _) => data.text,
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]
      )
  );
}
Widget foroosh_haftegi(DashBoardController controller){

  return  SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      // Chart title
     // title: ChartTitle(text: 'Half yearly sales analysis'),
      // Enable legend
     // legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<ChartModel, String>>[
      LineSeries<ChartModel, String>(
      dataSource: controller.forooshWeek.value,
      xValueMapper: (ChartModel sales, _) => sales.lable,
      yValueMapper: (ChartModel sales, _) => sales.value,
      name: 'فروش هفتگی',
      // Enable data label
      dataLabelSettings: DataLabelSettings(isVisible: true))
  ]);

}
Widget returnForoosh_haftegi(DashBoardController controller){



  return  SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      // Chart title
      //title: ChartTitle(text: 'Half yearly sales analysis'),
      // Enable legend
      //legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<ChartModel, String>>[
      LineSeries<ChartModel, String>(
      dataSource: controller.returnForooshWeek.value,
      xValueMapper: (ChartModel sales, _) => sales.lable,
      yValueMapper: (ChartModel sales, _) => sales.value,
      name: 'برگشت فروش',
      // Enable data label
      dataLabelSettings: DataLabelSettings(isVisible: true))
  ]);

}

