


import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/AsnadModel/AsnadModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/AsnadList.dart';

class FilterAsnadController extends GetxController{



  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;

  Rx<AsnadModel> asnadModelEmroz = AsnadModel().obs;
  Rx<AsnadModel> asnadModel = AsnadModel().obs;
  RxBool showCircle = true.obs;

  void getAsnadEmroz(String startDate , String endDate) async{

    await RequestManager.postReq(url: "tservermethods1/GetDocumentList", body: {
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
      showCircle.value = false;
      print(result);
    });


  }


  void getAsnad(String startDate , String endDate) async{

    await RequestManager.postReq(url: "tservermethods1/GetDocumentList", body: {
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

      Get.back();
      Get.to(AsnadListScreen());
    });


  }

}