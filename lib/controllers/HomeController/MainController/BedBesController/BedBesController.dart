import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/FilterBedBesController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/BedBesModel/RizBedBesModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/RizBedBesScreen.dart';

class BedBesController extends GetxController {
  Rx<RizBedBesModel> rizBedBesModel = RizBedBesModel().obs;
  RxList<PersonList> personLists = [PersonList()].obs;
  List<PersonList> helpListPerson = <PersonList>[];
  RxInt filterRadio = 0.obs;

  @override
  void onInit() {
    // personLists.value = Get.find<MainController>().personListModel.value.personList!;
    personLists.value =
        Get.find<FilterBedBesController>().personFilterList.value;
    helpListPerson.addAll(personLists.value);
    print(helpListPerson.length);
    print(personLists.value.length);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.onInit();
  }

  void getRizBedBes(String lfac, String name) async {
    if (LocalData.getConnectionMethode() == "socket") {
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": "1990/01/01",
          "enddate": "2500/4/29",
          "lfac": "227"
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetPersonAccount",
        "methodType": "post",
      }, (value) {
        var result = RizBedBesModel.fromJson(value);
        rizBedBesModel.value = result;
        Get.back();
        Get.to(RizBedBesScreen(
          name: name,
        ));
      });
    } else {
      await RequestManager()
          .postReq(url: "tservermethods1/GetPersonAccount", body: {
        "params": {
          "bookid": Utils.bookId,
          "startdate": "1990/01/01",
          "enddate": "2050/1/1",
          "lfac": lfac
        }
      }, header: {
        'Content-type': 'application/json',
        'authorization': auth()
      }).then((value) {
        var result = RizBedBesModel.fromJson(value);
        rizBedBesModel.value = result;
        Get.back();
        Get.to(RizBedBesScreen(
          name: name,
        ));
      });
    }
  }

  void searchPerson(String value) {
    List<PersonList> filterList = <PersonList>[];

    if (value == "") {
      filterList.clear();
      filterList.addAll(helpListPerson);
    } else if (value != "") {
      filterList.clear();
      helpListPerson.forEach((element) {
        if (element.fldTifLfac!.contains(value.toLowerCase())) {
          filterList.add(element);
        }
      });
    }
    print(filterList);
    personLists.value.clear();
    personLists.value.addAll(filterList);
    personLists.refresh();
    update();
  }

  void showSort(double wi, double he) {
    Get.bottomSheet(Obx(() {
      return Container(
        width: wi,
        height: he * 0.25,
        child: Column(
          children: [
            RadioListTile<int>(
                title: Text("بیشترین بستانکار"),
                value: 0,
                groupValue: filterRadio.value,
                onChanged: (value) {
                  filterRadio.value = value!;
                }),
            RadioListTile<int>(
                title: Text("بیشترین بدهکار"),
                value: 1,
                groupValue: filterRadio.value,
                onChanged: (value) {
                  filterRadio.value = value!;
                }),
            MaterialButton(
              onPressed: () {
                personLists.value.forEach((element) { print(element.prc!);});
                if (filterRadio.value == 0) {
                  personLists.value.sort((a, b) => int.parse(
                          a.prc!.toString().toLowerCase() == "null" || a.prc!.toString() ==""
                              ? "0"
                              : a.prc!.toString())
                      .compareTo(int.parse(b.prc!.toString().toLowerCase() == "null" || b.prc!.toString() ==""
                          ? "0"
                          : b.prc!.toString())));
                } else {
                  personLists.value.sort((a, b) => int.parse(
                      b.prc!.toString().toLowerCase() == "null" || b.prc!.toString() ==""
                          ? "0"
                          : b.prc!.toString())
                      .compareTo(int.parse(a.prc!.toString().toLowerCase() == "null" || a.prc!.toString() ==""
                      ? "0"
                      : a.prc!.toString())));
                }
                personLists.refresh();
                //update();
                Get.back();
              },
              child: Text(
                "مرتب سازی",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(AppColor.primaryColor),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(wi * 0.05),
          color: Colors.white,
        ),
      );
    }),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: wi * 0.008, color: Color(AppColor.primaryColor)),
            borderRadius: BorderRadius.all(Radius.circular(wi * 0.05))));
  }
}
