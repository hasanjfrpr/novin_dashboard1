import 'dart:convert';

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';

import 'package:http/http.dart' as http;
import 'package:novin_dashboard1/model/MainModel/mainItemModel/SoodVzianModel/SoodVzianModel.dart';

import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/SoodVzianScreen.dart';

class FilterSoodVzianControler extends GetxController{

  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;

Rx<SoodVzianModel> soodVzianModel = SoodVzianModel().obs;

  void getSoodVzian(String startDate , String endDate ) async{

    await RequestManager.postReq(url: "tservermethods1/GetSoodZian", body:{
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate
      }
    },header:
      {
        'Content-type': 'application/json',
        'authorization':auth()
      }
    ).then((value){
      var result = SoodVzianModel.fromJson(value);
      soodVzianModel.value = result;
      print(soodVzianModel.value.soodZianListO);
     Get.back();
     Get.to(SoodVzianScreen());
    });
  //   await http.post(Uri.parse("http://192.168.0.17:13647/daycomputer/nvn5_android/tservermethods1/GetSoodZian") ,body:jsonEncode({
  //     "params": {
  //       "bookid": Utils.bookId,
  //       "startdate": startDate,
  //       "enddate": endDate
  //     }
  //   }),headers: {
  //        'Content-type': 'application/json',
  //      'authorization':auth()
  //      }
  //     ).then((value) {
  //     print(value);
  //   });
  }


}