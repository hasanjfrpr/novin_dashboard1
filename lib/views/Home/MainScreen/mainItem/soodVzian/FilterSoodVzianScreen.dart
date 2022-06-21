import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/FilterSoodVzianController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class FilterSoodVzianScreen extends StatelessWidget {
  const FilterSoodVzianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    FilterSoodVzianControler controller = Get.put(FilterSoodVzianControler());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text("فیلتر صورت حساب " + AppString.sodVzian),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: he * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
              onPressed: () {
                _showConfirmation(wi, he, controller);
                // if(visitorSelector.value == 1) visitor="null";
                // if(personSelector.value == 3) person="null";
                // controller.getFactorForooshList(convertJtoGDate(controller.year.value, controller.month.value, controller.day.value),
                //     convertJtoGDate(controller.endYear.value , controller.endMonth.value,controller.endDay.value), Utils.bookId!, visitor, person);
                // showLoading(wi, he);
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
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: wi * 0.045, vertical: he * 0.01),
              width: wi,
              height: he * 0.05,
              child: Text(
                AppString.date,
                style:
                    TextStyle(fontSize: wi * 0.04, fontWeight: FontWeight.bold),
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
                              child: Text("از"), alignment: Alignment.center),
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
                                        controller.month.value.toString() +
                                        "/" +
                                        controller.day.value.toString(),
                                    style: TextStyle(
                                      color: Color(AppColor.primaryColor),
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
                              child: Text("تا"), alignment: Alignment.center),
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
                                    controller.endYear.value.toString() +
                                        "/" +
                                        controller.endMonth.value.toString() +
                                        "/" +
                                        controller.endDay.value.toString(),
                                    style: TextStyle(
                                      color: Color(AppColor.primaryColor),
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

               SizedBox(height: he*0.01,),
               Obx(
                (){ return ListTile(

                    title: Text("محاسبه سود و زیان براساس آخرین داده ها"),
                    leading: Checkbox(
                      value: controller.checkBox.value,
                      activeColor: Color(AppColor.primaryColor),
                      checkColor: Color(AppColor.onPrimaryColor),
                      onChanged: (v){
                        controller.checkBox.value = v!;
                      },
                    ),
                );}
              ),


          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context, FilterSoodVzianControler controller,
      int num) async {
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

  void _showConfirmation(
      double wi, double he, FilterSoodVzianControler controller) {
    Get.dialog(
      AlertDialog(
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      "فرآیند محاسبه سود و زیان میتواند دقایقی زمانبر باشد و تا پایان محاسبه کلیه عملیات سیستم متوقف خواهد شد.\n",
                      style: TextStyle(fontSize: wi * 0.04),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: Icon(
                        CupertinoIcons.hourglass,
                        size: wi * 0.15,
                        color: Color(AppColor.primaryColor),
                      )))
                ],
              ),
              Divider(
                height: he * 0.0025,
                color: Color(AppColor.borderColor),
              ),
              Container(
                width: wi,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(
                    horizontal: wi * 0.04, vertical: wi * 0.02),
                child: Text(
                  "آیا مایل به ادامه هستید؟",
                  style: TextStyle(
                      color: Color(AppColor.primaryColor), fontSize: wi * 0.05),
                ),
              ),
              SizedBox(
                height: he * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                        controller.getSoodVzian(
                            convertJtoGDate(controller.year.value,
                                controller.month.value, controller.day.value),
                            convertJtoGDate(
                                controller.endYear.value,
                                controller.endMonth.value,
                                controller.endDay.value));
                        showLoading(wi, he);
                      },
                      child: Text(
                        "بله",
                        style: TextStyle(color: Color(AppColor.primaryColor)),
                      )),
                  SizedBox(
                    width: wi * 0.06,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "خیر",
                        style: TextStyle(color: Color(AppColor.primaryColor)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
