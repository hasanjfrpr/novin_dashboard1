

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
      }, (value) {
        var result = AsnadModel.fromJson(value);
        asnadModel.value = result;
        documentList.value=result.documentList!;
        helpDocumentList.addAll(result.documentList!);
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

}