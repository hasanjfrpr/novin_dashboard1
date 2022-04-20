import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/MainScreen.dart';
import 'package:novin_dashboard1/views/Home/SettingScreen/SettinScreen.dart';
import 'package:shamsi_date/shamsi_date.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    controller.onInit();

    double wi = Get.width;
    double he = Get.height;
    return  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(he*0.085),
          child:Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: wi,
                  height: he,
                  color: Color(AppColor.primaryColor),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(color: Color(AppColor.onPrimaryColor),boxShadow: [BoxShadow(color: Color(AppColor.onPrimaryColor) , blurRadius: 0 , offset: Offset(0,0) , spreadRadius: 0 )]),
                  width: wi,
                  height: he*0.03,

                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: he*0.045),
                  width: wi*0.2,
                  height: he*0.4,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.1),color: Color(AppColor.primaryColor)),
                  child: Image.asset("assets/images/novin.png" , fit: BoxFit.cover, color: Color(AppColor.onPrimaryColor),),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: wi*0.05 , top: wi*0.05),
                  child: Obx(() {
                    return Text(
                        "${controller.jalili.value.year}/${controller.jalili.value.month}/${controller.jalili
                            .value.day}",
                        style: TextStyle(color: Color(AppColor.onPrimaryColor))
                    );
                  }),

                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(right: wi*0.05 , top: wi*0.05),
                  child: Obx((){return Text("${controller.jalili.value.hour}:${controller.jalili.value.minute}:${controller.jalili.value.second}" , style: TextStyle(color: Color(AppColor.onPrimaryColor)),);}),
                ),
              ),

            ],
          )
        ),
        bottomNavigationBar:CurvedNavigationBar(items: [
            Icon(CupertinoIcons.home , color: Color(AppColor.onPrimaryColor),size: wi*0.08,),
            Icon(CupertinoIcons.settings, color: Color(AppColor.onPrimaryColor) , size: wi*0.08,)
          ],
            backgroundColor: Color(AppColor.onPrimaryColor),
          color: Color(AppColor.primaryColor),
          animationDuration: Duration(milliseconds: 250),
          height: he*.08,
          onTap: (index){
          controller.currentActiveScreen.value = index;
          },

          ),


        body: Obx((){
          return controller.currentActiveScreen==0 ? MainScreen() : SettingScreen();
        }
        ),
    );
  }
}
