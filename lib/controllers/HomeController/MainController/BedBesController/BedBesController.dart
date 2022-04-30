
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/BedBesModel/RizBedBesModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/RizBedBesScreen.dart';


class BedBesController extends GetxController{

  Rx<RizBedBesModel> rizBedBesModel = RizBedBesModel().obs;






  void getRizBedBes(String lfac , String name) async{
    await RequestManager.postReq(url: "tservermethods1/GetPersonAccount", body: {
      "params": {
        "bookid": Utils.bookId,
        "startdate": "1990/01/01",
        "enddate": "2050/1/1",
        "lfac": lfac
      }
    },header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value){

      var result = RizBedBesModel.fromJson(value);
      rizBedBesModel.value = result;
      Get.back();
      Get.to(RizBedBesScreen(name: name,));
    });
  }

}