

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/SoodVzianModel/SoodVzianDetailModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/SoodVzianDetailScreen.dart';

class SoodVzianController extends GetxController{


  Rx<SoodVzianDetailModel> soodVzianDetailModel = SoodVzianDetailModel().obs;
  RxList<SoodZianDetailsList> soodVzianDetailModel_fake = [SoodZianDetailsList()].obs;
  RxList<SoodZianDetailsList> updateList = [SoodZianDetailsList()].obs;
  RxList<String> title_s_d = [""].obs;


  void getSoodVzianDetail(String startDate , String endDate , String title , String cod , String head , String sort) async{

    if(LocalData.getConnectionMethode() == "socket"){

      await SocketManager.request({
        "params": {
          "bookid":Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "fld_cod": cod,
          "scrhead": head,
          "sort": sort
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetSoodZianDetails",
        "methodType": "post",
      }, (value) {
        var result = SoodVzianDetailModel.fromJson(value);
        soodVzianDetailModel.value = result;
        soodVzianDetailModel_fake.clear();
        soodVzianDetailModel_fake.value.addAll(result.soodZianDetailsList!);
        getfilterSoozZianListDetail(soodVzianDetailModel_fake.value);
        Get.back();
        Get.to(SoodVzianDetailScreen(title: title,));
      });

    }else{
      await RequestManager().postReq(url: "tservermethods1/GetSoodZianDetails", body: {
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "fld_cod": cod,
          "scrhead": head,
          "sort": sort
        }
      },header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value) {
        var result = SoodVzianDetailModel.fromJson(value);
        soodVzianDetailModel.value = result;
        soodVzianDetailModel_fake.clear();
        soodVzianDetailModel_fake.value.addAll(result.soodZianDetailsList!);
        getfilterSoozZianListDetail(soodVzianDetailModel_fake.value);
        Get.back();
        Get.to(SoodVzianDetailScreen(title: title,));
      });
    }


  }



  void getfilterSoozZianListDetail(List<SoodZianDetailsList> ls) {
    title_s_d.value.clear();
    for(var i =0 ; i< ls.length ; i++){
      if(ls[i].cfs?.length==9){
        title_s_d.value.add(ls[i].fldTifLfac!);
      }
    }

  }

  Future getupdateList(String title) async{
    String? cfs="";
    for(var i=0 ; i<soodVzianDetailModel.value.soodZianDetailsList!.length ; i++ ){
      if(soodVzianDetailModel.value.soodZianDetailsList![i].fldTifLfac!.toLowerCase().trim() == title.toLowerCase().trim()){
        cfs =soodVzianDetailModel.value.soodZianDetailsList![i].cfs.toString();
      }
    }
    updateList.clear();
    for(var i=0 ; i<soodVzianDetailModel.value.soodZianDetailsList!.length ; i++ ){
      if(soodVzianDetailModel.value.soodZianDetailsList![i].cfs!.contains(cfs!)){
        updateList.add(soodVzianDetailModel.value.soodZianDetailsList![i]);
      }
    }
    soodVzianDetailModel_fake.value.clear();
    if(updateList.isNotEmpty) {
      soodVzianDetailModel_fake.value.addAll(updateList);
      soodVzianDetailModel_fake.refresh();
      update();
    } else {
      soodVzianDetailModel_fake.value.addAll(soodVzianDetailModel.value.soodZianDetailsList!);
      soodVzianDetailModel_fake.refresh();
      update();
    }
     soodVzianDetailModel_fake.value.forEach((element) {print(element.cfs); });

  }




  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }
}