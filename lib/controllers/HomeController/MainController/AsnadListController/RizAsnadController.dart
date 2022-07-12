
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/AsnadModel/LogInfoModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/LogInfoScreen.dart';

class RizAsnadController extends GetxController{


  Rx<LogInfoModel> logInfoModel = LogInfoModel().obs;


  void getLogInfo(String fld_cod_doc , BuildContext context) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "FLD_COD_DOC": fld_cod_doc
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetLogInfo",
        "methodType": "post",
      }, (value) {
        var result = LogInfoModel.fromJson(value);
        logInfoModel.value = result;
       Get.back();
       Get.to(()=>LogInfoScreen() , transition: Transition.upToDown );

      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/GetLogInfo", body: {
        "params": {
          "bookid": Utils.bookId,
          "doccode": fld_cod_doc
        }
      },header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = LogInfoModel.fromJson(value);
        logInfoModel.value = result;
        Get.back();
        Get.to(()=>LogInfoScreen() , transition: Transition.upToDown);

      });
    }


  }


}