

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class AshkhasCotrolller extends GetxController{


  Rx<PersonListModel> personListModel = PersonListModel().obs;





  @override
  void onReady() {
    showLoading(Get.width, Get.height);
    getPersonList();
    super.onReady();
  }

  void getPersonList() async{
    await RequestManager.postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value) {
      var result = PersonListModel.fromJson(value);
      personListModel.value = result;
      print(result);
      Get.back();
    });
  }
}