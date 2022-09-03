import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AsnadListController/FilterAsnadListController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class FilterAsnadScreen extends StatelessWidget {
  const FilterAsnadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterAsnadController controller = Get.put(FilterAsnadController());
    controller.getAsnadEmroz(
        convertJtoGDate(Get.find<HomeController>().jalili.value.year,
            Get.find<HomeController>().jalili.value.month, Get.find<HomeController>().jalili.value.day),
        convertJtoGDate(Get.find<HomeController>().jalili.value.year,
            Get.find<HomeController>().jalili.value.month, Get.find<HomeController>().jalili.value.day)
        );
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.ff + " " + AppString.AsnadList),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: Container(
        width: wi,
        height: he,
        child: Column(
          children: [

                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: wi * 0.045, vertical: he * 0.01),
                      width: wi,
                      height: he * 0.05,
                      child: Text(
                        AppString.date,
                        style: TextStyle(
                            fontSize: wi * 0.04, fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      width: wi,
                      height: he * 0.16,
                      margin: EdgeInsets.symmetric(
                          horizontal: wi * 0.045, vertical: he * 0.01),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(AppColor.primaryColor),
                          ),
                          borderRadius: BorderRadius.circular(wi * 0.02)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      child: Text("از"),
                                      alignment: Alignment.center),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        showCalender(context, controller, 1);
                                      },
                                      child: Container(
                                        child: Obx(() {
                                          return Text(
                                            controller.year.value.toString() +
                                                "/" +
                                                controller.month.value
                                                    .toString() +
                                                "/" +
                                                controller.day.value.toString(),
                                            style: TextStyle(
                                              color:
                                                  Color(AppColor.primaryColor),
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }),
                                        alignment: Alignment.center,
                                      )),
                                  flex: 1,
                                )
                              ],
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      child: Text("تا"),
                                      alignment: Alignment.center),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        showCalender(context, controller, 2);
                                      },
                                      child: Container(
                                        child: Obx(() {
                                          return Text(
                                            controller.endYear.value
                                                    .toString() +
                                                "/" +
                                                controller.endMonth.value
                                                    .toString() +
                                                "/" +
                                                controller.endDay.value
                                                    .toString(),
                                            style: TextStyle(
                                              color:
                                                  Color(AppColor.primaryColor),
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }),
                                        alignment: Alignment.center,
                                      )),
                                  flex: 1,
                                )
                              ],
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: wi,
                      margin: EdgeInsets.only(top: he*0.02),
                      alignment: Alignment.center,
                      child: Text(
                        AppString.asnadEmroz,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: he * 0.017),
                      ),
                    ),

            Expanded(
              child: Obx((){return
              Expanded(
                flex: 8,
                child: controller.showCircle.value ? Center(child: CircularProgressIndicator(color: Color(AppColor.primaryColor),),) : Container(
                  width: wi,
                  child: controller.asnadModelEmroz.value.documentList!=[]
                      ? emptyScreen(wi, he)
                      : ListView.builder(
                    itemCount:
                    controller.asnadModelEmroz.value.documentList?.length,
                    itemBuilder: (context , index){
                      return Container();
                    },
                  ),
                ),
              );}),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        controller.getAsnad(
                            convertJtoGDate(controller.year.value,
                                controller.month.value, controller.day.value),
                            convertJtoGDate(
                                controller.endYear.value,
                                controller.endMonth.value,
                                controller.endDay.value));
                        showLoading(wi, he);
                      },
                      height: he * 0.05,
                      minWidth: wi * 0.4,
                      splashColor: Color(AppColor.primaryColor),
                      color: Color(AppColor.primaryColor),
                      padding: EdgeInsets.symmetric(horizontal: wi * 0.1),
                      child: Text(
                        AppString.filter,
                        style: TextStyle(color: Color(AppColor.onPrimaryColor)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(wi * 0.02)),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.day.value =
                            Get.find<HomeController>().jalili.value.day;
                        controller.month.value =
                            Get.find<HomeController>().jalili.value.month;
                        controller.year.value =
                            Get.find<HomeController>().jalili.value.year;
                        controller.endDay.value =
                            Get.find<HomeController>().jalili.value.day;
                        controller.endMonth.value =
                            Get.find<HomeController>().jalili.value.month;
                        controller.endYear.value =
                            Get.find<HomeController>().jalili.value.year;
                      },
                      height: he * 0.05,
                      minWidth: wi * 0.4,
                      color: Color(AppColor.onPrimaryColor),
                      padding: EdgeInsets.symmetric(horizontal: wi * 0.1),
                      child: Text(
                        AppString.cleanFilter,
                        style: TextStyle(color: Color(AppColor.primaryColor)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(wi * 0.02)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  void showCalender(
      BuildContext context, FilterAsnadController controller, int num) async {
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
}
