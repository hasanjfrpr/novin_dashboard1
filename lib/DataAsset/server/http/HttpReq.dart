import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:get/get.dart' ;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestManager {

  //static String? ip =LocalData.getIp();
  final Base_Url = "http://"+LocalData.getIp()!+":13647/daycomputer/nvn5_android/";
  static const Map<String , String > header = {'Content-type': 'application/json'};



   Future<dynamic> postReq(
      {required String? url,
        required Map<String, dynamic>? body , Map<String , String > header = header}) async {
     if(!Utils.isLogin!){
     body!['username']=Utils.userName.toString();
     body['password']=Utils.passWord.toString();}
     header.remove('authorization');

    try {
      var res = await http.post(Uri.parse(Base_Url + url!),
          body: json.encode(body),
          headers: header);
      if (res.statusCode == 200) {
         var result = json.decode(res.body);
         return result;

      } else if (res.statusCode == 403){
        _errorDialog("عدم دسترسی", "اطلاعات وارد شده صحیح نمی باشد.");
        var result = json.decode(res.body);
        return result;
      }

    }
    on SocketException {
      _errorDialog("اشکال در اتصال", " لطفا از اتصال خود به اینترنت و درستی آدرس اطمینان حاصل فرمایید. ");
    } on HttpException {
      _errorDialog("آدرس اشتباه", "آدرس مورد نظر یافت نشد.");
    } on FormatException {
      _errorDialog("فرمت اشتباه", "درخواست با فرمتی اشتباه ارسال شده است.");
    }on TimeoutException{
      _errorDialog("عدم دریافت پاسخ", "داده ای دریافت نشد از اتصال به سرور اطمینان حاصل فرمایید.");
    }
  }

   Future<dynamic> getReq({required String? url, required Map<String, dynamic>? body , Map<String , String > header = header}) async {

      try{
        var res = await http.get(Uri.parse(Base_Url+url!),
            headers: header).timeout(Duration(seconds: 3));
        if (res.statusCode == 200) {
          var result = jsonDecode(res.body) ;
          return result;
        } else {
         //_errorDialog("عدم دریافت", "داده ای دریافت نشد.");
        }
      }on SocketException {
        _errorDialog("اشکال در اتصال", " لطفا از اتصال خود به اینترنت و درستی آدرس اطمینان حاصل فرمایید. ").then((value) {
          Dialogs.showServerSettingDialog(0);
        });

      } on HttpException {
        _errorDialog("آدرس اشتباه", "آدرس مورد نظر یافت نشد.");
      } on FormatException {
        _errorDialog("فرمت اشتباه", "درخواست با فرمتی اشتباه ارسال شده است.");
      }on TimeoutException{
        _errorDialog("عدم دریافت پاسخ ", "داده ای دریافت نشد از اتصال به سرور اطمینان حاصل فرمایید.");
          Dialogs.showServerSettingDialog(0);

      }
    }






}
Future _errorDialog(String title , String message) async{
 await Get.snackbar(title, message ,colorText: Colors.white,
    borderColor: Colors.white , borderRadius: 25 , borderWidth: 1.5,backgroundGradient: LinearGradient(colors: [Colors.lightBlue,Colors.blueGrey,Colors.white],begin: Alignment.topCenter,
      end: Alignment.bottomLeft ,),barBlur:30, );
}