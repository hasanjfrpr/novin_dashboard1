
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Utils {
static String? bookId;
static String? headSoozVzianDetail;
static String? userName;
static String? passWord;
static bool? isLogin=true;

}

String auth(){
  return 'Basic ' + base64Encode(utf8.encode('${Utils.userName}:${Utils.passWord}'));
}
  String faToEnConvert(String a) {
  return a
      .replaceAll("۱", "1")
      .replaceAll("۲", "2")
      .replaceAll("۳", "3")
      .replaceAll("۴", "4")
      .replaceAll("۵", "5")
      .replaceAll("۶", "6")
      .replaceAll("۷", "7")
      .replaceAll("۸", "8")
      .replaceAll("۹", "9")
      .replaceAll("۰", "0");
}


String convertJtoGDate(int year , int month , int day){
  Gregorian gregorian = Jalali(year,month,day).toGregorian();
  int Gyear = gregorian.year;
  int Gmonth = gregorian.month;
  int Gday = gregorian.day;

  return "$Gyear/$Gmonth/$Gday";
}


void restartApp(BuildContext context) {
  // if (Platform.isAndroid) {
  //   Restart.restartApp();
  // } else {
    Phoenix.rebirth(context);

}



String convertDtoJDate(String gregorianDate){

  List<String> ss = gregorianDate.split("/");
  String year  = ss[0];
  String month = ss[1];
  String day = ss[2];
  Jalali jalali = Gregorian(int.parse(year) , int.parse(month) , int.parse(day)).toJalali();

  String persianDate = "${jalali.year}/${jalali.month}/${jalali.day}";
  return persianDate;
}

String setFormatNumber(String number){

var formatter =number.contains(".") ?  NumberFormat("#,##0.0") :  NumberFormat("##,###,000");
  return number.toLowerCase()=="null" || number.toLowerCase().toString()=="" ? "0" : number.toLowerCase()=="0" ? "0" :formatter.format(double.parse(number));
}
Widget emptyScreen(double wi , double he){
  return Center(child: Container(
    margin: EdgeInsets.symmetric(horizontal: wi*0.08),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Image.asset("assets/images/empty.png",color: Colors.black.withOpacity(0.5),),width: wi*0.2, height: he*0.1,),
        SizedBox(height: he*0.002,),
        Text("نتیجه ای یافت نشد" , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: wi*0.06),),
        Text("با تغیر فیلترها مجددا تلاش کنید"),
      ],
    ),
  ),);
}

void showLoading(double wi , double he,{String title ="درحال بررسی درخواست" }){

  Get.dialog( AlertDialog(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(wi*0.05)),content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title+"..."),
        SizedBox(height: he*0.01,),
        CircularProgressIndicator(color: Color(AppColor.primaryColor),),

      ],
    ),), barrierDismissible: true ,useSafeArea: true);


}