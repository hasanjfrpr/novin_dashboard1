
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/FactorForooshModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/VisitorListFModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/FactorForooshScreen.dart';

class FilterFactorForooshController extends GetxController{
RxInt day = Get.find<HomeController>().jalili.value.day.obs;
RxInt month = Get.find<HomeController>().jalili.value.month.obs;
RxInt year = Get.find<HomeController>().jalili.value.year.obs;
RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;
RxBool showLoadingP = false.obs;
RxBool showLoadingV= false.obs;
RxBool showLoading= false.obs;
Rx<FactorForooshModel> factorForooshModel = FactorForooshModel().obs;
Rx<FactorForooshModel> suggestFactorForooshModel  = FactorForooshModel().obs;

PersonListModel _personModel = PersonListModel();
VisitorListFModel _visitorModel = VisitorListFModel();

 RxList<DropdownMenuItem> personsList = [DropdownMenuItem(child: Text("") , value:"")].obs;
RxList<DropdownMenuItem> visitorList = [DropdownMenuItem(child: Text("") , value:"")].obs;



void getPersonList() async{
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('${Utils.userName}:${Utils.passWord}'));

  await RequestManager.postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
    'Content-type': 'application/json',
    'authorization':basicAuth
  }).then((value) {
    var result = PersonListModel.fromJson(value);
    _personModel = result;
    personsList.value.clear();
    for(var i = 0 ; i<result.personList!.length ; i++){
      personsList.add(DropdownMenuItem<String>(child: Text(result.personList![i].fldTifLfac!) , value: result.personList![i].fldTifLfac!,));
    }

    showLoadingP.value = true;
  });
}
void getVisitorList() async{
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('${Utils.userName}:${Utils.passWord}'));

  await RequestManager.postReq(url: "tservermethods1/GetvisitorList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
    'Content-type': 'application/json',
    'authorization':basicAuth
  }).then((value) {
    var result = VisitorListFModel.fromJson(value);
    _visitorModel = result;
    visitorList.value.clear();
    for(var i = 0 ; i<result.visitorList!.length ; i++){
      visitorList.add(DropdownMenuItem<String>(child: Text(result.visitorList![i].fldTifLfac!) , value: result.visitorList![i].fldTifLfac!,));
    }

    showLoadingV.value = true;
  });
}

void getFactorForooshList(String startDate , String endDate , String bookId , String visitor , String person) async{
  String finalVisitor="null";
  String finalPerson = "null";

 if(person != "null"){
   for(var i=0 ; i<_personModel.personList!.length ; i++){
     if(_personModel.personList![i].fldTifLfac == person){
       finalPerson = _personModel.personList![i].fLDCodLFAC.toString();
     }
   }
 }

 if(visitor !="null"){
   for(var i=0 ; i<_visitorModel.visitorList!.length ; i++){
     if(_visitorModel.visitorList![i].fldTifLfac == visitor){
       finalVisitor = _visitorModel.visitorList![i].fLDCodSelc.toString();
     }
   }
 }
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('${Utils.userName}:${Utils.passWord}'));


  await RequestManager.postReq(url: "tservermethods1/GetFactorForooshList", body: {
    "params": {
      "bookid": bookId,
      "startdate": startDate,
      "enddate": endDate,
      "visitorid": finalVisitor,
      "personid": finalPerson
    }
  }, header:{
    'Content-type': 'application/json',
    'authorization':basicAuth
  }).then((value){
    var result = FactorForooshModel.fromJson(value);
    factorForooshModel.value = result;
    suggestFactorForooshModel.value = factorForooshModel.value;
    Get.back();
    Get.to(FactorForooshScreen());
  });
}

void searchPattern(String value){
   List<FactorForooshList> fakeList = <FactorForooshList>[];

  if(value.isEmpty){
    fakeList.addAll(factorForooshModel.value.factorForooshList!);
  }else{
    fakeList= factorForooshModel.value.factorForooshList!.where((element) {
      return element.fldtiflfac!.contains(value);
    }).toList();
  }

  print(fakeList);
  suggestFactorForooshModel.value.factorForooshList!.addAll(fakeList);
  update();
}

}