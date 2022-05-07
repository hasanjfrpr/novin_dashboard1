

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/FilterTarazController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazKollv3Controller.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazMoeinController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class TarazKolLv3Screen extends StatelessWidget {
  String tif;
   TarazKolLv3Screen({Key? key , required this.tif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;

    TarazKolLv3Controller lv3controller = Get.put(TarazKolLv3Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text(" تراز دفتر تفضیلی "+"("+"$tif"+")"),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body:OrientationBuilder(builder:(context, orientation) => orientation == Orientation.portrait ? _portraitView(wi , he  ,Get.find<TarazMoienController>(),Get.find<FilterTarazController>() , lv3controller ) : _landView()) ,);

  }
  Widget _portraitView(double wi , double he , TarazMoienController controller , FilterTarazController controllers , TarazKolLv3Controller lv3controller ){
    var listTaraz = controller.tarazKolLv3.value.tarazAzmayeshiKolMoeinTafsiliList!;
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
                    Container(width: wi*0.6 ,height: he*0.05,child: Text("حساب" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),


                  ],),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    width: 6*0.3*wi,
                    height: he,
                    color: Colors.grey,
                    child: ListView.builder(itemBuilder: (context , index){
                      return InkWell(
                        onTap: (){
                          lv3controller.getTarazKolLv4(convertJtoGDate(
                              controllers.year.value, controllers.month.value,
                              controllers.day.value),
                              convertJtoGDate(
                                  controllers.endYear.value, controllers.endMonth.value,
                                  controllers.endDay.value), listTaraz[index].fldscrhead! , listTaraz[index].fldparentid! , listTaraz[index].fldcodlfac!,
                          listTaraz[index].tif!);
                          showLoading(wi, he);
                        },
                        child: Row(children: [
                          Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04,vertical: wi*0.03),width: wi*0.6 ,height: he*0.07,child: Text(listTaraz[index].tif.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].sbed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].sbes.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                          Divider(color: Colors.black12,),
                          Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz[index].bes.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                        ],),
                      );
                    }, itemCount: listTaraz.length,),
                  ),
                ),




              ],
            ),
          ),
        )
    );



  }

  Widget _landView(){
    return Container();
  }
}
