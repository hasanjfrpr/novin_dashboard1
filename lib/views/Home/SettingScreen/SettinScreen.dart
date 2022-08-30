import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/controllers/setting/SettingController.dart';
import 'package:novin_dashboard1/controllers/splashController/SplashController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
  final SettingController controller = Get.put(SettingController());
  RxBool visible = false.obs;


  @override
  Widget build(BuildContext context) {
    controller.onInit();
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      backgroundColor: Color(AppColor.onPrimaryColor),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                width: wi,
                margin: EdgeInsets.all(wi * 0.05),
                child: Text(
                  AppString.networkSetting,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: wi * 0.035,
                  ),
                )),
            SizedBox(
              height: he * 0.0005,
            ),
            Card(
              child: Container(
                  width: wi,
                  child: Column(
                    children: [
                      Obx(
                      (){ return ListTile(
                          subtitle: Text(Get.find<SplashController>(tag: "SplashController").serverMethodName.value.isEmpty ? LocalData.getConnectionMethode().toString() : LocalData.getConnectionMethode()=="socket"?"${Get.find<SplashController>(tag: "SplashController").serverMethodName.value} : ${LocalData.getSerial()}":"${Get.find<SplashController>(tag: "SplashController").serverMethodName.value} : ${LocalData.getIp()}"),
                            title: Text(
                              AppString.serverSetting,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: wi * 0.035,
                              ),
                            ),
                            onTap: (){
                            Utils.dashBoardReq = true;
                              Dialogs.showServerSettingDialog(1);
                            },

                            trailing: Icon(Icons.arrow_forward_ios));}
                      ),
                      Divider(),
                      // ListTile(
                      //     title: Text(
                      //       AppString.restartServer,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: wi * 0.035,
                      //       ),
                      //     ),
                      //     onTap: (){
                      //       Utils.dashBoardReq = true;
                      //      controller.restart();
                      //     },
                      //     trailing: Icon(CupertinoIcons.restart)),
                      // Divider(),
                      ListTile(
                          title: Text(
                            "خروج از حساب کاربری",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: wi * 0.035,
                            ),
                          ),
                          onTap: (){
                          Get.deleteAll(force: true);
                          Phoenix.rebirth(Get.context!);
                          Utils.dashBoardReq=true;
                          Get.reset();
                          },
                          trailing: Icon(Icons.transit_enterexit ,color: Colors.redAccent,))
                    ],
                  )),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                if(visible.value) visible.value=false;
                else visible.value = true;
              },
              child: Container(
                  width: wi,
                  margin: EdgeInsets.all(wi * 0.03),
                  alignment: Alignment.center,
                  child:  Text(
                      "درباره نرم افزار حسابداری هوشمندنوین",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade400,
                        fontSize: wi * 0.035,
                      ),
                    ),
                  ),
            ),
            Obx(
              (){return Visibility(
                visible: visible.value==true ? true : false,
                child: Container(
                  width: wi,
                  padding: EdgeInsets.symmetric(horizontal: wi*0.04 ),
                  margin: EdgeInsets.symmetric(horizontal: wi*0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(wi*0.02),
                    border:Border.all(color: Color(AppColor.primaryColor) , width: 1.5 , style: BorderStyle.solid)
                  ),
                  child: Column(children: [
                    SizedBox(height: wi*0.04,),
                    Text("گروه تولیدی و صادراتی هوشمند نوین از سال 1370 تاکنون یکی از اولین شرکت‌ها در امر تولید و عرضه نرم افزارهای مالی و حسابداری می‌باشد که منطبق با پیشرفته‌ترین تکنولوژی روز در این حوزه به فعالیت پرداخته است."+"\n"+
                        "این مجموعه با هدف بهره وری و بهینه‌سازی سیستم های مختلف، یکی از برترین تولید کنندگان نرم‌افزار در کشور می‌باشد."+"\n"+""
                        "هوشمند نوین تا به امروز افتخار همکاری با اصناف و مشاغل مختلفی را داشته و کاربران بسیاری در ایران و دیگر کشورهای جهان عضو این خانواده بزرگ هستند. ما این جا هستیم تا با خلق و بکارگیری فناوری های ساده و در عین حال بسیار ظریف، دقیق، برازنده و ارائه خدمات به صورت تمام‌وقت مشتریا‌ن‌مان را راضی نگه داریم."
                      ,style: TextStyle(fontFamily: 'IrSans',fontSize: wi*0.033),),
                   SizedBox(height: 25,),
                    SizedBox(height: 12,),
                    GestureDetector(onTap: ()async{
                    _launchMaps();
                    },child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow()]),child: Image.asset("assets/images/location.png"))),
                    Container(
                        width: wi,
                        margin: EdgeInsets.all(wi * 0.03),
                        alignment: Alignment.center,
                        child: Text(
                          "تهران _ خیابان میرزای شیرازی _ کوچه مقدم _ پلاک "+"۲۸"+"_ ساختمان هوشمند نوین",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: wi * 0.035,
                          ),
                        )),
                    GestureDetector(
                      onTap: (){launch("tel://02154128");},
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        Icon(CupertinoIcons.phone_solid,color: Colors.green),
                        SizedBox(width: 7,),
                        Text(
                          "تماس با ما",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade400,
                            fontSize: wi * 0.035,
                          ),
                        ),


                      ],),
                    ),
                    SizedBox(height: 30,)
                  ],)
                ),
              );}
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

   _launchMaps() async {
     MapsLauncher.launchCoordinates(35.72588616835514, 51.415108823972);
   }
}
