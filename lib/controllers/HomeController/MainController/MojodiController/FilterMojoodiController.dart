

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/MojoodiModel/AnbarModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/MojoodiModel/MojoodiKalaModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/MojoodiModel/MojoodiKalaModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/mojoodiKala/MojoodiKalaScreen.dart';

class FilterMojoodiController extends GetxController{

  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;

  RxBool showLoadingV= false.obs;
  Rx<AnbarModel> anbarModel  = AnbarModel().obs;
  Rx<MojoodiKalaModel> mojoodikalaModel = MojoodiKalaModel().obs;
  RxList<DropdownMenuItem> anbarModelDropDown = [DropdownMenuItem(child: Text("") , value: "",)].obs;
  
  
  void getanbar() async{
    await RequestManager.postReq(url: "tservermethods1/GetAnbarList", body: {
      "params": {
        "bookid": "1"
      }
    },header:{
      'Content-type': 'application/json',
      'authorization':auth()
    } ).then((value){
      var result = AnbarModel.fromJson(value);
      anbarModel.value = result;
      anbarModelDropDown.clear();
      for(var i=0 ; i < result.anbarList!.length ; i++ ){
        anbarModelDropDown.add(DropdownMenuItem<String>(child: Text(result.anbarList![i].fldNMFINV.toString()) , value: result.anbarList![i].fldNMFINV.toString(),));
      }
      showLoadingV.value = true;
    });

  }


  void getMojoodikala(String startDate , String endDate , String anbarId ) async{
    if(anbarId != ""){
      for(var ss in anbarModel.value.anbarList!){
        if(ss.fldNMFINV == anbarId){
          anbarId = ss.fldCodINV.toString();
        }
      }
    }
    await RequestManager.postReq(url: "tservermethods1/GetMojoodiKalaList", body:{
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate,
        "anbarid": anbarId
      }
    },header:{
      'Content-type': 'application/json',
      'authorization':auth()
    } ).then((value){
     var result = MojoodiKalaModel.fromJson(value);
     mojoodikalaModel.value = result;
     print(result);
     Get.back();
     Get.to(MojoodikalaScreen());
    });

  }
}