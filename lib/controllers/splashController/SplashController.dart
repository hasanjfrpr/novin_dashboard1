import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
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

class SplashController extends GetxController {
  late Rx<CompanyBookModel> companyModel = CompanyBookModel().obs;
  RxList<DropdownMenuItem> companyItem = [
    DropdownMenuItem(
      child: Text("خالی"),
      value: "خالی",
    )
  ].obs;
  RxList<DropdownMenuItem> bookItems = [
    DropdownMenuItem(
      child: Text("خالی"),
      value: "خالی",
    )
  ].obs;
  RxString fld_name_company = "".obs;
  RxString fld_code_company = "".obs;

  RxBool showSecondSpinner = false.obs;



  void getCompanyBook() async {

    if (LocalData.getConnectionMethode() == "socket") {
     await SocketManager.request({
        "params": {},
        "username": "",
        "password": "",
        "methodName": "GetBookList",
        "methodType": "get",
      }, (value) {

         var result = CompanyBookModel.fromJson(value);
         companyModel.value = result;

         companyItem.value.clear();
         for (var i = 0; i < result.companyList!.length; i++) {
           companyItem.value.add(DropdownMenuItem<String>(
             child: Text("${result.companyList![i].fldnmfcomp}"),
             value: "${result.companyList![i].fldnmfcomp}",
           ));
         }
         Get.off(Login());

      });


    } else {
      await RequestManager.getReq(url: "", body: {})
          .then((value) => print(value));

      await RequestManager.getReq(url: "tservermethods1/GetBookList ", body: {})
          .then((value) {
        var result = CompanyBookModel.fromJson(value);
        companyModel.value = result;

        companyItem.value.clear();
        for (var i = 0; i < result.companyList!.length; i++) {
          companyItem.value.add(DropdownMenuItem<String>(
            child: Text("${result.companyList![i].fldnmfcomp}"),
            value: "${result.companyList![i].fldnmfcomp}",
          ));
        }
      }).then((value) {
        Get.off(Login());
      });
    }
  }

  void getBook() {
    bookItems.clear();
    for (var h = 0; h < companyModel.value.companyList!.length; h++) {
      if (companyModel.value.companyList![h].fldnmfcomp ==
          fld_name_company.value) {
        // fld_code_company.value = companyModel.value.companyList![i].fLDCODComp!;

        for (var i = 0; i < companyModel.value.bookList!.length; i++) {
          if (companyModel.value.bookList![i].fLDCODComp ==
              companyModel.value.companyList![h].fLDCODComp!) {
            bookItems.value.add(DropdownMenuItem<String>(
              child: Text("${companyModel.value.bookList![i].fldTifBook}"),
              value: "${companyModel.value.bookList![i].fldTifBook}",
            ));
            showSecondSpinner.value = true;
            // ConstValue.bookId = companyModel.value.bookList![i].fldCOdBook;
            // Utils.bookId=companyModel.value.bookList![i].fldCOdBook;

          }
        }
      }
    }
  }

  @override
  void onInit() {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onInit();
  }

  @override
  void onReady() {
    LocalData.getSharedInstance();
    if (LocalData.getIp() == "" && LocalData.getSerial() == "") {
      Dialogs.showServerSettingDialog(0);
    } else {
      // Future.delayed(const Duration(seconds: 6)).then((value) => Get.off( const Login() ));
      getCompanyBook();
    }
    super.onReady();
  }

  void goNexScreen()  {


  }
  }

