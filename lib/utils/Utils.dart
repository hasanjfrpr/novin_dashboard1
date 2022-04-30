
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Utils {
static String? bookId;
static String? userName;
static String? passWord;

}

String auth(){
  return 'Basic ' + base64Encode(utf8.encode('${Utils.userName}:${Utils.passWord}'));
}


String convertJtoGDate(int year , int month , int day){
  Gregorian gregorian = Jalali(year,month,day).toGregorian();
  int Gyear = gregorian.year;
  int Gmonth = gregorian.month;
  int Gday = gregorian.day;

  return "$Gyear/$Gmonth/$Gday";
}

String convertDtoJDate(String gregorianDate){

  List<String> ss = gregorianDate.split("/");
  String year  = ss[0];
  String month = ss[1];
  String day = ss[2];
  Jalali jalali = Gregorian(int.parse(year) , int.parse(month) , int.parse(day)).toJalali();

  String persianDate = "${jalali.year}/${jalali.month}/${jalali.day}";
  print(persianDate);
  return persianDate;
}

String setFormatNumber(String number){
var formatter = NumberFormat('#,###,000');
  return number.toLowerCase()=="null" ? number : formatter.format(int.parse(number));
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
  Get.defaultDialog(barrierDismissible: true,title: "",backgroundColor: Colors.white70,content: Container(
    child: Row(

      children: [

        SizedBox(width: wi*0.04,),
        CircularProgressIndicator(color: Color(AppColor.primaryColor),),
        SizedBox(width: wi*0.06,),
        Text(title+"...")
      ],
    ),
  )
  );
}