

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/AsnadModel/AsnadModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/AsnadList.dart';
import 'package:socket_io_client/socket_io_client.dart';

class FilterAsnadController extends GetxController{



  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;

  Rx<AsnadModel> asnadModelEmroz = AsnadModel().obs;
  Rx<AsnadModel> asnadModel = AsnadModel().obs;
  RxList<DocumentList> documentList  = [DocumentList()].obs;
  List<DocumentList> helpDocumentList  =<DocumentList>[];
  RxBool showCircle = true.obs;
  int page = 2;
  late ScrollController scrollController ;
  RxBool showLoading=false.obs;
  int totalPage = 1000;


  @override
  void onInit() {

    scrollController = ScrollController();
    scrollController.addListener(() async{

      if(scrollController.offset == scrollController.position.maxScrollExtent && !showLoading.value){
        if(LocalData.getConnectionMethode()=="socket") {
          print("total page is : $totalPage and page is : $page");
          if (page <= totalPage){
            showLoading.value = true;
          await SocketManager.request({
            "params": {
              "bookid": Utils.bookId,
              "startdate": convertJtoGDate(year.value,
                  month.value, day.value),
              "enddate": convertJtoGDate(
                  endYear.value,
                  endMonth.value,
                  endDay.value)
            },
            "username": Utils.userName,
            "password": Utils.passWord,
            "methodName": "GetDocumentList",
            "methodType": "post",
            "page": "$page"
          }, (value) {
            var result = AsnadModel.fromJson(value);
            if (result.documentList!.isNotEmpty) {
              asnadModel.value = result;
              documentList.value.addAll(result.documentList!);
              update();
              documentList.refresh();
              helpDocumentList.addAll(result.documentList!);
              page++;
            }
            showLoading.value = false;
          });
        }
        }
      }

    });
    super.onInit();
  }


  void getAsnadEmroz(String startDate , String endDate) async{
    if(LocalData.getConnectionMethode()=="socket"){

      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetDocumentList",
        "methodType": "post",
      }, (value) {
        var result = AsnadModel.fromJson(value);
        asnadModelEmroz.value = result;
        showCircle.value = false;
      });

    }else{

      await RequestManager().postReq(url: "tservermethods1/GetDocumentList", body: {
        "params": {
          "bookid":Utils.bookId,
          "startdate": startDate,
          "enddate": endDate
        }
      }, header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = AsnadModel.fromJson(value);
        asnadModelEmroz.value = result;
        showCircle.value = false;

      });

    }


  }


  void getAsnad(String startDate , String endDate) async{


    if(LocalData.getConnectionMethode()=="socket"){

      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetDocumentList",
        "methodType": "post",
        "page":"1"
      }, (value) {
        var result = AsnadModel.fromJson(value);
        asnadModel.value = result;
        documentList.value=result.documentList!;
        documentList.refresh();
        update();
        helpDocumentList.addAll(result.documentList!);
        totalPage= int.parse( value['totalpage']);
        Get.back();
        Get.to(AsnadListScreen());

      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/GetDocumentList", body: {
        "params": {
          "bookid":Utils.bookId,
          "startdate": startDate,
          "enddate": endDate
        }
      }, header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = AsnadModel.fromJson(value);
        asnadModel.value = result;
        documentList.value=result.documentList!;
        helpDocumentList.addAll(result.documentList!);
        Get.back();
        Get.to(AsnadListScreen());
      });
    }





  }

  void searchAsnad(String value){
    List<DocumentList> fakeList = <DocumentList>[];

    if(value ==""){
      fakeList.clear();
      fakeList.addAll(helpDocumentList);
    }else if(value !=""){
      fakeList.clear();
      helpDocumentList.forEach((element) {
        if(element.fldCodDoc.toString().contains(value.toLowerCase())){
          fakeList.add(element);
        }
      });
    }

    documentList.value.clear();
    documentList.value.addAll(fakeList);
    documentList.refresh();
    update();

  }
  @override
  void onClose() {

    scrollController.dispose();

    super.onClose();
  }

}