
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/RizFactorModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/RizFactorScreen.dart';

class FactorForooshController extends GetxController{
  TextEditingController searchController = TextEditingController();
  Rx<RizFactorModel> rizFactorModel = RizFactorModel().obs;






  void getRizFactor(String factorForooshId) async{

    if(LocalData.getConnectionMethode() == "socket"){

      SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "factorforooshid": factorForooshId
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetFactorForooshRizKalaList",
        "methodType": "post",
      }, (value) {
        var result = RizFactorModel.fromJson(value);
        rizFactorModel.value = result;
        Get.back();
        Get.to(()=>RizFactorScreen());
      });


    }else{

      await RequestManager().postReq(url: "tservermethods1/GetFactorForooshRizKalaList", body: {
        "params": {
          "bookid": Utils.bookId,
          "factorforooshid": factorForooshId
        }
      } , header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = RizFactorModel.fromJson(value);
        rizFactorModel.value = result;
        Get.back();
        Get.to(()=>RizFactorScreen());
      });

    }



  }

}