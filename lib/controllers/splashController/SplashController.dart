
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/model/Login/BookCompanyModel/CompanyBookModel.dart';
import 'package:novin_dashboard1/model/MainModel/sliderModel/SliderModel.dart';
import 'package:novin_dashboard1/utils/ConstValue.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/MainScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/FactorForooshScreen.dart';
import 'package:novin_dashboard1/views/login/Login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{

 late Rx<CompanyBookModel> companyModel = CompanyBookModel().obs;
 RxList<DropdownMenuItem> companyItem = [DropdownMenuItem(child: Text("خالی") , value: "خالی",)].obs;
 RxList<DropdownMenuItem> bookItems = [DropdownMenuItem(child: Text("خالی") , value: "خالی",)].obs;
 RxString fld_name_company = "".obs;
 RxString fld_code_company = "".obs;

 RxBool showSecondSpinner = false.obs;



@override
  void onInit() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onInit();
  }


  void getCompanyBook() async{
  await RequestManager.getReq(url: "tservermethods1/GetBookList ", body: {}).then((value) {

 var result= CompanyBookModel.fromJson(value);
 companyModel.value = result;

companyItem.value.clear();
 for(var i=0; i<result.companyList!.length ; i++){
  companyItem.value.add(DropdownMenuItem<String>(child: Text("${result.companyList![i].fldnmfcomp}"),value: "${result.companyList![i].fldnmfcomp}",));
 }


  });

  }

  void getBook() {
   bookItems.clear();
   for(var h=0 ; h<companyModel.value.companyList!.length ; h++){
    if(companyModel.value.companyList![h].fldnmfcomp == fld_name_company.value){
     // fld_code_company.value = companyModel.value.companyList![i].fLDCODComp!;

     for(var i=0 ; i<companyModel.value.bookList!.length ; i++){
      if(companyModel.value.bookList![i].fLDCODComp == companyModel.value.companyList![h].fLDCODComp!){
       bookItems.value.add(DropdownMenuItem<String>(child: Text("${companyModel.value.bookList![i].fldTifBook}") , value: "${companyModel.value.bookList![i].fldTifBook}",));
       showSecondSpinner.value = true;
       // ConstValue.bookId = companyModel.value.bookList![i].fldCOdBook;
       // Utils.bookId=companyModel.value.bookList![i].fldCOdBook;

      }
     }
    }
   }

  }

  void goNexScreen() async{
   await LocalData.getSharedInstance();


if(LocalData.getIp()== "") {
 Dialogs.showServerSettingDialog();
}else{
 Future.delayed(const Duration(seconds: 6)).then((value) => Get.off( const Login() ));
}


  }


}