

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class FilterBedBesController extends GetxController{

  RxList<DropdownMenuItem> personList = [DropdownMenuItem<String>(child: Text("خالی") , value: "خالی",)].obs;
  RxBool showLoadin = true.obs;



  void getPersonList() async{
    await RequestManager.postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value) {
      var result = PersonListModel.fromJson(value);
    if(result.personList!.length > 1){
      for(var i=0 ;i<result.personList!.length ; i++){
        personList.value.add( new DropdownMenuItem<String>(child: Text(result.personList![i].fldTifLfac.toString()) , value:result.personList![i].fldTifLfac.toString() ,));
      }
      print(personList.value);
      showLoadin.value = false;
    }
    });
  }
}