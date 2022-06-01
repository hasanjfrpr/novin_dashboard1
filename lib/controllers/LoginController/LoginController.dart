import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/Login/BookCompanyModel/CompanyBookModel.dart';
import 'package:novin_dashboard1/model/Login/signIn/SignInModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

import 'package:novin_dashboard1/views/Home/HomeScreen.dart';
import 'package:progress_state_button/progress_button.dart';

import '../splashController/SplashController.dart';

class LoginController extends GetxController {

  Rx<ButtonState> buttonStateLogin = ButtonState.idle.obs;
  Rx<SignInModel> loginModelObs = SignInModel().obs;
  var userNameControllerTF = TextEditingController();
  var passwordControllerTF = TextEditingController();


  void login(String bookId , String username , String password) async {


    if (LocalData.getConnectionMethode() == "socket") {
      await SocketManager.request({
        "params": {
          "bookid": bookId
        },
        "username": username,
        "password": password,
        "methodName": "Login",
        "methodType": "post",

      }, (value) {
        if (value['Result']['Success'].toString().toLowerCase() == "true") {
          buttonStateLogin.value = ButtonState.success;
          Utils.userName = username;
          Utils.passWord = password;

          loginModelObs.value = SignInModel.fromJson(value);
          Future.delayed(Duration(milliseconds: 850), () {
            Get.off(HomeScreen() ,duration: Duration(milliseconds: 2000));
          });
        } else {
          buttonStateLogin.value = ButtonState.fail;
        }

      });
    } else {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      await RequestManager().postReq(url: "tservermethods1/Login", body: {
        "params": {"bookid": '$bookId'}
      }, header: {
        'Content-type': 'application/json',
        'authorization': basicAuth
      }).then((value) {


        if (value['Result']['Success'].toString().toLowerCase() == "true") {
          buttonStateLogin.value = ButtonState.success;
          Utils.userName = username;
          Utils.passWord = password;

          loginModelObs.value = SignInModel.fromJson(value);
          Future.delayed(Duration(milliseconds: 850), () {
            Get.off(HomeScreen(),duration: Duration(milliseconds: 2000));
          });
        } else {
          buttonStateLogin.value = ButtonState.fail;
        }
      }).catchError(() {

      });
    }
  }


  String getbookId(String fld_name) {
    String bookId = "0";
    for(BookList bookList in Get
        .find<SplashController>(tag: "SplashController")
        .companyModel.value.bookList!){
      if(fld_name == bookList.fldTifBook){
        bookId = bookList.fldCOdBook!;
      }
    }
    return bookId;

  }




  @override
  void dispose() {
    userNameControllerTF.dispose();
    passwordControllerTF.dispose();
    super.dispose();
  }
}
