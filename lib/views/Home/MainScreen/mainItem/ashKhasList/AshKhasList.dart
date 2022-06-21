import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AshkhasController/AshkhasController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AshKhasListScreen extends StatelessWidget {
  const AshKhasListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    MainController controller = Get.find<MainController>();
    AshkhasCotrolller personController = Get.put(AshkhasCotrolller());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppString.personsList),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: controller.personListModel.value.personList!.isEmpty
          ? emptyScreen(wi, he)
          : Container(
              width: wi,
              height: he,
              child: Column(
                children: [
                  Expanded(
                      child: _searchBox(wi, he, controller, personController)),
                  Expanded(
                      flex: 11,
                      child: Container(
                        child: Obx(() {
                          return ListView.builder(
                              padding: EdgeInsets.only(bottom: personController.showLoading.value==true ? 16 : 0),
                              controller: personController.scrollController,
                              shrinkWrap: true,
                              itemCount: personController
                                  .personListAhskhas.value.length,
                              itemBuilder: (context, int index) {
                                return _items(wi, he, index, controller,
                                    personController);
                              });
                        }),
                      )),
                  Obx(() {
                    return personController.showLoading.value == true
                        ? Padding(
                            padding: EdgeInsets.only(top: 8 , bottom: 8),
                            child: CircularProgressIndicator(
                              color: Color(
                                AppColor.primaryColor,
                              ),
                            ))
                        : Container();
                  })
                ],
              )),
    );
  }

  Widget _searchBox(double wi, double he, MainController controller,
      AshkhasCotrolller personController) {
    return Container(
      width: wi,
      height: he * 0.05,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.004),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: "جستجو براساس کد حساب",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
        ),
        onChanged: (value) {
          personController.searachAhskhas(value);
        },
      ),
    );
  }

  Widget _items(double wi, double he, int index, MainController controller,
      AshkhasCotrolller personController) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      width: wi,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 2))
          ],
          color: Colors.white70.withOpacity(0.25),
          border: Border(
              right: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0145))),
      margin:
          EdgeInsets.only(bottom: he * 0.02, left: wi * 0.04, right: wi * 0.04),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(personController
                        .personListAhskhas.value[index].fldTifLfac
                        ?.toLowerCase() ==
                    "null"
                ? "فاقد نام"
                : "${personController.personListAhskhas.value[index].fldTifLfac}"),
            iconColor: Color(AppColor.primaryColor),
            children: [
              _itemRow(
                  AppString.personName,
                  personController.personListAhskhas.value[index].fldNmmfPer
                      .toString()),
              InkWell(
                  onTap: () {
                    if (personController
                            .personListAhskhas.value[index].fldphn1per
                            .toString()
                            .toLowerCase() !=
                        "null")
                      UrlLauncher.launch(
                          "tel://${personController.personListAhskhas.value[index].fldphn1per}");
                  },
                  child: _itemRow(
                      AppString.phoneNumber1,
                      personController.personListAhskhas.value[index].fldphn1per
                          .toString(),
                      isPhoneNumber: true)),
              InkWell(
                  onTap: () {
                    if (personController
                            .personListAhskhas.value[index].fldphn2per
                            .toString()
                            .toLowerCase() !=
                        "null")
                      UrlLauncher.launch(
                          "tel://${personController.personListAhskhas.value[index].fldphn2per}");
                  },
                  child: _itemRow(
                      AppString.phoneNumber2,
                      personController.personListAhskhas.value[index].fldphn2per
                          .toString(),
                      isPhoneNumber: true)),
              _itemRow(
                  AppString.address,
                  personController.personListAhskhas.value[index].fldadfper
                      .toString()),
            ],
          ),
          _itemRow(AppString.codehesab,
              personController.personListAhskhas.value[index].cfs.toString()),
        ],
      ),
    );
  }

  Widget _itemRow(String rowName, String value, {bool isPhoneNumber = false}) {
    if (value.toLowerCase() == "null") value = "----";

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04, vertical: Get.height * 0.005),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                rowName + " :  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 3,
              child: Text(
                value,
                style: TextStyle(
                    color: isPhoneNumber ? Colors.blue : Colors.black87),
                overflow: TextOverflow.clip,
              ))
        ],
      ),
    );
  }
}
