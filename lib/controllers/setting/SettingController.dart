import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';

import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SettingController extends GetxController {

  static bool isRegister = false;
  RxDouble progressValue = 0.0.obs;




@override
  void onInit() {

    super.onInit();
  }


  void restart(){

    if(SocketManager.socket.connected){
      if(isRegister){
        SocketManager.socket.emit("message" , "restart");
       _showDialogRestart();

      }else{
        SocketManager.socket.emit("register" ,LocalData.getSerial());
        SocketManager.socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            restart();
          }else{
            return {"register" :  "unAccess"};
          }
        });
      }


    }else{
      SocketManager.socket.connect();
      SocketManager.socket.onConnect((data){
        SocketManager.socket.emit("register" ,LocalData.getSerial());
        SocketManager.socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            restart();
          }else{
            return {"register" :  "unAccess"};
          }
        });
      });
  }

}
void _showDialogRestart(){
    Future.delayed(Duration(seconds:10) , () => {
      Get.back()
    },);
    for(var i =0.0 ; i<10.0 ; i++){
      progressValue.value = i;
    }
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))),
    content: Container(
      child:Column(
mainAxisSize: MainAxisSize.min,
        children: [
          Row(children:[ Expanded(flex:3,child: Container(child: Text("عملیات شروع مجدد سرور درحال انجام است لطفا شکیبا باشید..."),)), Expanded(child: CircularProgressIndicator(color: Color(AppColor.primaryColor),))]),
        ],
      ),
    ),),barrierDismissible: false,);
}
}

