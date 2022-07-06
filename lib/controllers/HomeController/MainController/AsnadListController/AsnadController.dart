


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/AsnadModel/RizAsnadModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/RizAsnadScreen.dart';

import 'FilterAsnadListController.dart';

class AsnadController extends GetxController{

  Rx<RizAsnadModel> rizAsnad = RizAsnadModel().obs;


  // int page = 2;
  // late ScrollController scrollController ;
  // RxBool showLoading=false.obs;


  // @override
  // void onInit() {
  //   scrollController = ScrollController();
  //   scrollController.addListener(() async{
  //
  //     if(scrollController.offset == scrollController.position.maxScrollExtent){
  //       if(LocalData.getConnectionMethode()=="socket"){
  //         showLoading.value = true;
  //         await SocketManager.request({
  //           "params": {
  //             "bookid": Utils.bookId,
  //             "startdate": convertJtoGDate(Get.find<FilterAsnadController>().year.value,
  //                 Get.find<FilterAsnadController>().month.value, Get.find<FilterAsnadController>().day.value),
  //             "enddate": convertJtoGDate(
  //                 et.find<FilterAsnadController>().endYear.value,
  //                 et.find<FilterAsnadController>().endMonth.value,
  //                 et.find<FilterAsnadController>().endDay.value)
  //           },
  //           "username": Utils.userName,
  //           "password": Utils.passWord,
  //           "methodName": "GetDocumentList",
  //           "methodType": "post",
  //           "page":"$page"
  //         }, (value) {
  //           var result = AsnadModel.fromJson(value);
  //           asnadModel.value = result;
  //           documentList.value=result.documentList!;
  //           update();
  //           documentList.refresh();
  //           helpDocumentList.addAll(result.documentList!);
  //           page++;
  //         });
  //       }
  //     }
  //
  //   });
  //   super.onInit();
  // }






  void getRizAsnad(String sanadCode ) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "doccode": sanadCode
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "getDocumentDetailsList",
        "methodType": "post",
      }, (value) {
        var result = RizAsnadModel.fromJson(value);
        print(result);
        rizAsnad.value=result;
        Get.back();
        Get.to(()=>RizAsnadScreen(),arguments: sanadCode);
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/getDocumentDetailsList", body: {
        "params": {
          "bookid": Utils.bookId,
          "doccode": sanadCode
        }
      },header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = RizAsnadModel.fromJson(value);
        print(result);
        rizAsnad.value=result;
        Get.back();
        Get.to(()=>RizAsnadScreen());
      });
    }


  }


}