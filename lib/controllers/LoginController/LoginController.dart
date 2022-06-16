import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
  RxBool keyboardIsOpen = false.obs;


  void login(String bookId , String username , String password) async {

    print("slamati to mashti : "+username + password );

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
          LocalData.setUsername(username);
          LocalData.setPassword(password);
          LocalData.setBookId(bookId);
          Utils.bookId = bookId;
          loginModelObs.value = SignInModel.fromJson(value);
          Future.delayed(Duration(milliseconds: 850), () {
            Get.off(HomeScreen() ,duration: Duration(milliseconds: 2000));
          });
        } else {
          buttonStateLogin.value = ButtonState.fail;
        }

      });
    } else {

      await RequestManager().postReq(url: "tservermethods1/Login", body: {
        "params": {"bookid": '$bookId'},
        "username":username,
        "password":password
      }, header: {
        'Content-type': 'application/json',
      }).then((value) {

        if (value['Result']['Success'].toString().toLowerCase() == "true") {
          buttonStateLogin.value = ButtonState.success;
          Utils.userName = username;
          Utils.passWord = password;
          LocalData.setUsername(username);
          LocalData.setPassword(password);
          LocalData.setBookId(bookId);
          Utils.bookId = bookId;
          Utils.isLogin = false;
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
  void onInit() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      keyboardIsOpen.value = visible;
    });
    super.onInit();
  }



  @override
  void dispose() {
    userNameControllerTF.dispose();
    passwordControllerTF.dispose();
    super.dispose();
  }
}
