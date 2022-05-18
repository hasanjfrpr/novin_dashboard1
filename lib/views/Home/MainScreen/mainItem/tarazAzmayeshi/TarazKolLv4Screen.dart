

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazKollv3Controller.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazMoeinController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';



class TarazKolLv4Screen extends StatelessWidget {
  String tif;
   TarazKolLv4Screen({Key? key , required this.tif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(" گردش حساب های تفضیلی "+"("+"$tif"+")"),
        backgroundColor: Color(AppColor.primaryColor),

      ),
      body:OrientationBuilder(builder:(context, orientation) => orientation == Orientation.portrait ? _portraitView(wi , he , Get.find<TarazKolLv3Controller>() ) : _landView(wi , he , Get.find<TarazKolLv3Controller>())) ,);

  }
  Widget _portraitView(double wi , double he , TarazKolLv3Controller lv3controller ){
    var listTaraz = lv3controller.tarazKolLv4Model.value.tarazAzmayeshiKolMoeinTafsiliTafsiliList;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: he,
            child: Column(

              children: [
                Expanded(
                  child: Row(children: [
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("شماره سند" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("تاریخ سند" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.6 ,height: he*0.05,child: Text("شرح" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("مانده" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),


                  ],),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    width: 7*0.3*wi,
                    height: he,
                    color: Colors.grey,
                    child: ListView.builder(itemBuilder: (context , index){
                      return Row(children: [
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(listTaraz![index].flddonodoc.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(convertDtoJDate(listTaraz[index].flddodadoc.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(padding: EdgeInsets.all(wi*0.03),width: wi*0.6 ,height: he*0.07,child: Text(listTaraz[index].flddsfacc.toString() , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].sumprc.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                        ],);

                    }, itemCount: listTaraz!.length,),
                  ),
                ),





              ],
            ),
          ),
        )
    );



  }


  Widget _landView(double wi , double he , TarazKolLv3Controller lv3controller){
    var listTaraz = lv3controller.tarazKolLv4Model.value.tarazAzmayeshiKolMoeinTafsiliTafsiliList;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: wi,
            width: he,
            color: Colors.grey,
            child: Column(

              children: [
                Expanded(
                  child: Container(
                    width: 7*0.3*wi,
                    height: he,
                    child: Row(children: [
                      Container(width: wi*0.3 ,height: he*0.05,child: Text("شماره سند" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      Divider(color: Colors.black12,),
                      Container(width: wi*0.3 ,height: he*0.05,child: Text("تاریخ سند" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      Divider(color: Colors.black12,),
                      Container(width: wi*0.6 ,height: he*0.05,child: Text("شرح" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      Divider(color: Colors.black12,),
                      Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      Divider(color: Colors.black12,),
                      Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      Divider(color: Colors.black12,),
                      Container(width: wi*0.3 ,height: he*0.05,child: Text("مانده" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),


                    ],),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    width: 7*0.3*wi,
                    height: he,
                    color: Colors.grey,
                    child: ListView.builder(itemBuilder: (context , index){
                      return Row(children: [
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(listTaraz![index].flddonodoc.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(convertDtoJDate(listTaraz[index].flddodadoc.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.6 ,height: he*0.07,child: Text(listTaraz[index].flddsfacc.toString() , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].sumprc.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                      ],);

                    }, itemCount: listTaraz!.length,),
                  ),
                ),





              ],
            ),
          ),
        )
    );
  }
}
