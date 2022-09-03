import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/FactorForooshController/FilterFFCotroller.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:search_choices/search_choices.dart';

class FilterFactorForooshScreen extends StatelessWidget {
   FilterFactorForooshScreen({Key? key}) : super(key: key);
  static String person= "null";
  static String visitor="null";
  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    RxInt visitorSelector = 1.obs;
    RxInt personSelector = 3.obs;

    FilterFactorForooshController controller = Get.put(FilterFactorForooshController(),tag: "FilterFFController");
    return Scaffold(
      backgroundColor: Color(AppColor.onPrimaryColor),
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.ff+" "+AppString.factorFrosh),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: he * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
              onPressed: () {
                if(visitorSelector.value == 1) visitor="null";
                if(personSelector.value == 3) person="null";
                controller.getFactorForooshList(convertJtoGDate(controller.year.value, controller.month.value, controller.day.value),
                    convertJtoGDate(controller.endYear.value , controller.endMonth.value,controller.endDay.value), Utils.bookId!, visitor, person);
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
                visitorSelector.value = 1;
                personSelector.value = 3;
                person="";
                visitor="";
                controller.day.value  = Get.find<HomeController>().jalili.value.day;
                controller.month.value = Get.find<HomeController>().jalili.value.month;
                controller.year.value= Get.find<HomeController>().jalili.value.year;
                controller.endDay.value = Get.find<HomeController>().jalili.value.day;
                controller.endMonth.value  = Get.find<HomeController>().jalili.value.month;
                controller.endYear.value  = Get.find<HomeController>().jalili.value.year;

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
        width: wi,
        height: he,
        child: ListView(
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
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: wi * 0.045, vertical: he * 0.01),
              width: wi,
              height: he * 0.05,
              child: Text(
                AppString.visitor,
                style:
                    TextStyle(fontSize: wi * 0.04, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: wi * 0.045, vertical: he * 0.01),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(AppColor.primaryColor)),
                  borderRadius: BorderRadius.circular(wi * 0.02)),
              child: Obx(
                () {
                  return Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Obx(() {
                            return Radio<int>(
                                value: 1,
                                groupValue: visitorSelector.value,
                                onChanged: (value) {
                                  visitorSelector.value = value!;
                                });
                          }),
                          Text("همه"),
                          SizedBox(
                            width: wi * 0.05,
                          ),
                          Obx(() {
                            return Radio<int>(
                                value: 2,
                                groupValue: visitorSelector.value,
                                onChanged: (value) {
                                  visitorSelector.value = value!;
                                });
                          }),
                          Text("ویزیتور خاص"),
                        ],
                      ),
                  if(visitorSelector==2)
                    visitorWidget(controller, wi)
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: wi * 0.045, vertical: he * 0.01),
              width: wi,
              height: he * 0.05,
              child: Text(
                AppString.persons,
                style:
                    TextStyle(fontSize: wi * 0.04, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: wi * 0.045, vertical: he * 0.01),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(AppColor.primaryColor)),
                  borderRadius: BorderRadius.circular(wi * 0.02)),
              child: Obx(
                () {
                  return Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Obx(() {
                            return Radio<int>(
                                value: 3,
                                groupValue: personSelector.value,
                                onChanged: (value) {
                                  personSelector.value = value!;
                                });
                          }),
                          Text("همه"),
                          SizedBox(
                            width: wi * 0.05,
                          ),
                          Obx(() {
                            return Radio<int>(
                                value: 4,
                                groupValue: personSelector.value,
                                onChanged: (value) {
                                  personSelector.value = value!;
                                });
                          }),
                          Text("شخص خاص"),
                        ],
                      ),
                      if(personSelector.value==4 )
                        personWidget(controller, wi )



                    ],
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context,
      FilterFactorForooshController controller, int num) async {
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
  Widget personWidget(FilterFactorForooshController controller , double wi ){

    controller.getPersonList();
    return  controller.showLoadingP==false ? Container(padding: EdgeInsets.all(wi*0.05),child: CircularProgressIndicator()) :Container(
      margin:
      EdgeInsets.symmetric(horizontal: wi * 0.04),
      child: SearchChoices.single(
        items: controller.personsList,
        value: person,
        hint: AppString.selectPerson,
        rightToLeft: true,
        searchHint: "جستجو",
        onChanged: (value) {person = value;},
        dialogBox: false,
        isExpanded: true,
        menuConstraints:
        BoxConstraints.tight(Size.fromHeight(350)),
      ),
    );
  }
  Widget visitorWidget(FilterFactorForooshController controller , double wi ){

    controller.getVisitorList();
    return  controller.showLoadingV==false ? Container(padding: EdgeInsets.all(wi*0.05),child: CircularProgressIndicator()) :Container(
      margin:
      EdgeInsets.symmetric(horizontal: wi * 0.04),
      child: SearchChoices.single(
        items: controller.visitorList,
        value:visitor,
        hint: AppString.selectVisitor,
        rightToLeft: true,
        searchHint: "جستجو",
        onChanged: (value) {visitor = value;},
        dialogBox: false,
        isExpanded: true,
        menuConstraints:
        BoxConstraints.tight(Size.fromHeight(350)),
      ),
    );
  }
}
