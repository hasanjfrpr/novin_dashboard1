import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/setting/SettingController.dart';
import 'package:novin_dashboard1/controllers/splashController/SplashController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/views/Home/HomeScreen.dart';
import 'package:novin_dashboard1/views/Home/SettingScreen/SettinScreen.dart';
import 'package:novin_dashboard1/views/splashScreen/SplashScreen.dart';

class Dialogs {
  static late var focusNode1 = FocusNode();
  static late var focusNode2 = FocusNode();
  static late var focusNode3 = FocusNode();
  static TextEditingController controllerIpTF = TextEditingController();
  static TextEditingController contollerSocket1 = TextEditingController();
  static TextEditingController contollerSocket2 = TextEditingController();
  static TextEditingController contollerSocket3 = TextEditingController();

  static RxInt selected = 0.obs;
  static void showServerSettingDialog(int state ) {
    double wi = Get.width;
    double he = Get.height;
    if(!LocalData.getIp()!.isEmpty){
    controllerIpTF.text = LocalData.getIp().toString() ;}
    if(!LocalData.getSerial()!.isEmpty){
    contollerSocket1.text = LocalData.getSerial()!.substring(0,3);
    contollerSocket2.text=LocalData.getSerial()!.substring(3,5);
    contollerSocket3.text=LocalData.getSerial()!.substring(5,8);}

    Get.defaultDialog(
        title: "",
        barrierDismissible: false,
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: wi * 0.03),
                width: wi,
                child: Text(
                  AppString.selectConnectionType,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: wi * 0.04),
                ),
              ),
              SizedBox(
                height: he * 0.003,
              ),
              Obx(() {
                return RadioListTile<int>(
                    selectedTileColor: Color(AppColor.primaryColor),
                    activeColor: Color(AppColor.primaryColor),
                    title: Text(AppString.socket),
                    value: 1,
                    groupValue: selected.value,
                    onChanged: (value) {
                      selected.value = value!;
                    });
              }),
              Obx(() {
                return Visibility(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 375),
                    width: wi,
                    child: Column(children: [
                      Text(AppString.enterSerialNumber),
                      SizedBox(
                        height: he * 0.001,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: focusNode3,
                              controller: contollerSocket3,
                              keyboardType:TextInputType.number ,
                              onChanged: (value) {},
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(wi * 0.03))),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 2) {
                                  focusNode3.requestFocus();
                                }
                              },
                              focusNode: focusNode2,
                              controller: contollerSocket2,
                              keyboardType:TextInputType.number ,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(wi * 0.03))),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 3) {
                                  focusNode2.requestFocus();
                                }
                              },

                              focusNode: focusNode1,
                              keyboardType:TextInputType.number ,
                              controller: contollerSocket1,
                              autofocus: true,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(wi * 0.03))),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                    ]),
                  ),
                  visible: selected.value == 1 ? true : false,
                );
              }),
              Obx(() {
                return RadioListTile<int>(
                    selectedTileColor: Color(AppColor.primaryColor),
                    activeColor: Color(AppColor.primaryColor),
                    title: Text(AppString.localIp),
                    value: 2,
                    groupValue: selected.value,
                    onChanged: (value) {
                      selected.value = value!;
                    });
              }),
              Obx(() {
                return Visibility(
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 3754),
                      width: wi,
                      height: he * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Expanded(
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //         filled: true,
                          //         border: OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.circular(wi * 0.03)),
                          //         hintText: "port",
                          //         hintTextDirection: TextDirection.ltr),
                          //     keyboardType: TextInputType.number,
                          //     textDirection: TextDirection.ltr,
                          //   ),
                          //   flex: 2,
                          // ),
                          Expanded(
                            child: TextField(

                              autofocus: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(wi * 0.03)),
                                  hintText: LocalData.getIp() == "" ? "ip" : LocalData.getIp(),

                                  hintTextDirection: TextDirection.ltr),
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.ltr,
                              controller: controllerIpTF,

                            ),
                            flex: 5,
                          ),
                        ],
                      )),
                  visible: selected.value == 2 ? true : false,
                );
              }),
              Row(
                children: [
                  TextButton(
                      onPressed: () async {
                        // if(controllerIpTF.text.isNotEmpty || contollerSocket1.text.isNotEmpty){
                        // await LocalData.setIp(controllerIpTF.text);
                        // await LocalData.setSerialSocket(contollerSocket1.text+contollerSocket2.text+contollerSocket3.text);
                        // await LocalData.setConnectMethode(
                        //     selected.value == 1 ? "socket" : "ip");
                        // if(state == 1 ){
                        //   Get.back();
                        // }else {
                        //   Get.offAll(SplashScreen());
                        // }
                        // }
                        // else{
                        //   Get.snackbar("خطای دسترسی", "لطفا یک دسترسی را انتخاب کنید.",backgroundColor: Colors.redAccent,duration: Duration(seconds: 3),
                        //   snackPosition: SnackPosition.BOTTOM , colorText: Colors.white,borderRadius:15 , borderWidth: 1.5,borderColor: Colors.white,
                        //   margin: EdgeInsets.symmetric(horizontal: wi*0.08 , vertical: wi*0.04));
                        // }
                        if(selected.value != 1 && selected.value != 2){
                          Get.snackbar("خطای دسترسی", "لطفا یک دسترسی را انتخاب کنید.",backgroundColor: Colors.redAccent,duration: Duration(seconds: 3),
                              snackPosition: SnackPosition.BOTTOM , colorText: Colors.white,borderRadius:15 , borderWidth: 2,borderColor: Colors.white,
                              margin: EdgeInsets.symmetric(horizontal: wi*0.08 , vertical: wi*0.04));
                        }else{
                          if(selected.value ==1){
                            if(contollerSocket1.text.isEmpty || contollerSocket2.text.isEmpty || contollerSocket3.text.isEmpty){
                              Get.snackbar("خطا", "تمامی فیلد های سریال باید وارد شود.",backgroundColor: Colors.redAccent,duration: Duration(seconds: 3),
                                  snackPosition: SnackPosition.BOTTOM , colorText: Colors.white,borderRadius:15 , borderWidth: 1.5,borderColor: Colors.white,
                                  margin: EdgeInsets.symmetric(horizontal: wi*0.08 , vertical: wi*0.04));
                            }else{
                              await LocalData.setSerialSocket(contollerSocket1.text+contollerSocket2.text+contollerSocket3.text);
                              await LocalData.setConnectMethode("socket");
                              Get.find<SplashController>(tag: "SplashController").serverMethodName.value = "دسترسی راه دور";
                               //Get.offAll(SplashScreen());
                              SocketManager.isRegister = false;
                              await Get.deleteAll(force: true);

                              ///You can use normal context here within widget.
                              Phoenix.rebirth(Get.context!);
                              Get.reset();


                            }
                          }else if(selected.value ==2){
                            if(controllerIpTF.text.isEmpty){
                              Get.snackbar("خطای ", "ip وارد نشده است.",backgroundColor: Colors.redAccent,duration: Duration(seconds: 3),
                                  snackPosition: SnackPosition.BOTTOM , colorText: Colors.white,borderRadius:15 , borderWidth: 1.5,borderColor: Colors.white,
                                  margin: EdgeInsets.symmetric(horizontal: wi*0.08 , vertical: wi*0.04));
                            }else{
                              await LocalData.setIp(controllerIpTF.text);
                              await LocalData.setConnectMethode("ip");
                              Get.find<SplashController>(tag: "SplashController").serverMethodName.value = "دسترسی محلی";
                               // Get.offAll(SplashScreen());

                              SocketManager.isRegister = false;
                              await Get.deleteAll(force: true);

                              ///You can use normal context here within widget.
                              Phoenix.rebirth(Get.context!);
                              Get.reset();

                            }
                          }
                        }
                      },

                      child: Text(AppString.ok)),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(AppString.cancel)),
                ],
              )
            ],
          ),
        ));
  }



}
