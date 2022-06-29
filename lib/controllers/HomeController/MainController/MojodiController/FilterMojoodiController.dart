

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
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
  RxList<MojoodiKalaList> mojoodiList = [MojoodiKalaList()].obs;
  List<MojoodiKalaList> helpMojoodiList = <MojoodiKalaList>[];
  RxList<DropdownMenuItem> anbarModelDropDown = [DropdownMenuItem(child: Text("") , value: "",)].obs;
  
  
  void getanbar() async{
    if(LocalData.getConnectionMethode() == "socket"){
      
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetAnbarList",
        "methodType": "post",
      }, (value) {
        var result = AnbarModel.fromJson(value);
        anbarModel.value = result;
        anbarModelDropDown.clear();
        for(var i=0 ; i < result.anbarList!.length ; i++ ){
          anbarModelDropDown.add(DropdownMenuItem<String>(child: Text(result.anbarList![i].fldNMFINV.toString()) , value: result.anbarList![i].fldNMFINV.toString(),));
        }
        showLoadingV.value = true;
      });
      
    }else{
      
    }
    await RequestManager().postReq(url: "tservermethods1/GetAnbarList", body: {
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
    
    if(LocalData.getConnectionMethode() == "socket"){
      if(anbarId != ""){
        for(var ss in anbarModel.value.anbarList!){
          if(ss.fldNMFINV == anbarId){
            anbarId = ss.fldCodINV.toString();
          }
        }
      }
      
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "anbarid": anbarId
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetMojoodiKalaList",
        "methodType": "post",
      }
      , (value) {
        var result = MojoodiKalaModel.fromJson(value);
        mojoodikalaModel.value = result;
        mojoodiList.value.addAll(result.mojoodiKalaList!);
        helpMojoodiList.addAll(result.mojoodiKalaList!);
        print(result);
        Get.back();
        Get.to(()=>MojoodikalaScreen());
      });
      
    }else{

      if(anbarId != ""){
        for(var ss in anbarModel.value.anbarList!){
          if(ss.fldNMFINV == anbarId){
            anbarId = ss.fldCodINV.toString();
          }
        }
      }
      await RequestManager().postReq(url: "tservermethods1/GetMojoodiKalaList", body:{
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
        mojoodiList.value.addAll(result.mojoodiKalaList!);
        helpMojoodiList.addAll(result.mojoodiKalaList!);
        print(result);
        Get.back();
        Get.to(()=>MojoodikalaScreen());
      });
    }
    
    

  }
  void searchMojoodi(String value){
    List<MojoodiKalaList> fakeList = <MojoodiKalaList>[];

    if(value ==""){
      fakeList.clear();
      fakeList.addAll(helpMojoodiList);
    }else if(value !=""){
      fakeList.clear();
      helpMojoodiList.forEach((element) {
        if(element.fldtiflfac.toString().contains(value.toLowerCase())){
          fakeList.add(element);
        }
      });
    }

    mojoodiList.value.clear();
    mojoodiList.value.addAll(fakeList);
    mojoodiList.refresh();
    update();

  }
}