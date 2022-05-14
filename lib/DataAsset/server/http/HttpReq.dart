import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:get/get.dart' ;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestManager {

  static String? ip =LocalData.getIp();
  static final Base_Url = "http://"+ip!+":13647/daycomputer/nvn5_android/";
  static const Map<String , String > header = {'Content-type': 'application/json'};



  static Future<dynamic> postReq(
      {required String? url,
        required Map<String, dynamic>? body , Map<String , String > header = header}) async {
    try {
      var res = await http.post(Uri.parse(Base_Url + url!),
          body: json.encode(body!),
          headers: header);
      if (res.statusCode == 200) {
         var result = json.decode(res.body);
        print("200 shode ha");
         return result;

      } else if (res.statusCode == 403){
        print("error is acure  ");
        var result = json.decode(res.body);
        return result;
      }

    }
    on SocketException {
      Get.snackbar("error", "Internet  eeeeee");
      print("internet eeeee");
    } on HttpException {
      Get.snackbar("error", "not find  eeeeee");
    } on FormatException {
      Get.snackbar("error", "format  eeeeee");
    }on TimeoutException{
      Get.snackbar("timeOut", "can't get response");
    }
  }

  static Future<dynamic> getReq({required String? url, required Map<String, dynamic>? body , Map<String , String > header = header}) async {
    try{
      var res = await http.get(Uri.parse(Base_Url+url!),
          headers: header).timeout(Duration(seconds: 3));
      if (res.statusCode == 200) {
        var result = jsonDecode(res.body) ;
        return result;
      } else {
        Get.snackbar("connection","connection faild");
      }
    }on SocketException {
      Get.snackbar("error", "Internet  eeeeee");
    } on HttpException {
      Get.snackbar("error", "not find  eeeeee");
    } on FormatException {
      Get.snackbar("error", "format  eeeeee");
    }on TimeoutException{
      Get.snackbar("timeOut", "can't get response");
    }
  }



}
