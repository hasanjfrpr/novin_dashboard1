import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

class SocketManager {

  static late Io.Socket socket =
  Io.io("http://141.11.42.55:3000", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  static bool isRegister = false;
  //
  // {
  // "Status": "False",
  // "methodName": "GetDocumentList",
  // "id": "3670",
  // "Result": {
  // "Success": "False",
  // "LogStr": "TooLargeData"
  // }
  // }
  static Future<dynamic>  request(Map<String,dynamic> json ,ValueChanged<dynamic> s) async{


    if(socket.connected){
      if(isRegister){
        Random random = Random();
         int generateId = 1000+random.nextInt(8999);
         json['id'] = "$generateId";
        socket.emit("message" , json);
        socket.once("message" , (data){
          if(data['id']==generateId.toString()){
            // if(data['Result']['Success'].toString().toLowerCase()=="false" && data['Result']['LogStr'].toString()=="TooLargeData" ){
            //   Get.back();
            //   _showDialogTooMuchData();
            // }else{
            //
            // }
            s(data);

          }

        });

      }else{
        print(" serial in socketManager is  : "+LocalData.getSerial().toString());
        socket.emit("register" ,LocalData.getSerial());
        socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            request(json  , s);
          }else{
            return {"register" :  "unAccess"};
          }
        });
      }


    }else{
      socket.connect();
      socket.onConnect((data){
        socket.emit("register" ,LocalData.getSerial());
        socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            request(json,s);
          }else{
            return {"register" :  "unAccess"};
          }
        });
      });


    }














//
//
//
//
//     if(socket.connected){
//
//       if(isRegister){
//
//         socket.emit("message" , json );
//         socket.once("message", (data) {
//           var res = jsonDecode(data);
//           return res;
//         });
//
//       }else{
//         socket.emit("register" , "31575000");
//         socket.once("register", (data){
//           var res = jsonDecode(data);
//           if(res["status"] == true){
//             isRegister = true;
//             request(json);
//           }else{
//           return {};
//           }
//         });
//       }
//
//
//
//
//     } else{
//       socket.connect();
//       socket.onConnect((data) {
//         socket.emit("register" , "31575000");
//         socket.once("register", (datas){
//           var res = jsonDecode(datas);
//           if(res["status"] == true){
//             isRegister = true;
//             request(json);
//           }else{
//             return {};
//           }
//         });
//       });
//
//
//
//
//
//     }
//
// return {};

  }

  static void _showDialogTooMuchData(){
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      title:Row(children: [
        Icon(CupertinoIcons.arrow_down_doc , color: Colors.redAccent,),
        SizedBox(width: 6,),
        Text("محدودیت ارسال داده")
      ],) ,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Colors.black,),
          SizedBox(height: 4,),
          Container(

            child: Text("داده های دریافتی در این بازه زمانی انتخاب شده بسیار زیاد است, لطفا بازه زمانی کمتری را انتخاب فرمایید یا برای مشاهده اطلاعات در همین بازه زمانی از دسترسی محلی استفاده نماید."),
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      actionsAlignment: MainAxisAlignment.start,
      actions: [
        TextButton(onPressed: (){Dialogs.showServerSettingDialog(1);}, child: Text("انتخاب دسترسی محلی")),
        TextButton(onPressed: (){Get.back();}, child: Text("بستن") ),


      ],
    ),barrierDismissible: false);
  }
}


