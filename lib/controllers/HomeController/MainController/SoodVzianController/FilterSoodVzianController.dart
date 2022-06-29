import 'dart:convert';

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
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
RxBool checkBox = true.obs;

  void getSoodVzian(String startDate , String endDate ) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate":startDate,
          "enddate": endDate,
          "FlagCalc":checkBox.value ? "0" : "1"
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetSoodZian",
        "methodType": "post",
      }, (value) {
        var result = SoodVzianModel.fromJson(value);
        soodVzianModel.value = result;
        Get.back();
        Get.to(()=>SoodVzianScreen());
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/GetSoodZian", body:{
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
        Get.to(()=>SoodVzianScreen());
      });
    }

  }


}