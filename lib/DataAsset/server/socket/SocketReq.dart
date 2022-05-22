import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

class SocketManager {

  static late Io.Socket socket =
  Io.io("http://141.11.42.55:3000", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  static bool isRegister = false;




  static Future<dynamic>  request(Map<String,dynamic> json ,ValueChanged<dynamic> s) async{


    if(socket.connected){
      if(isRegister){
        Random random = Random();
         int generateId = 1000+random.nextInt(8999);
         json['id'] = "$generateId";
        socket.emit("message" , json);
        socket.once("message" , (data){
          if(data['id']==generateId.toString())
          s(data);
        });

      }else{
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
}


