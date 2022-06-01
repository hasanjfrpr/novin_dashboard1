


import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/AsnadModel/RizAsnadModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/RizAsnadScreen.dart';

class AsnadController extends GetxController{

  Rx<RizAsnadModel> rizAsnad = RizAsnadModel().obs;






  void getRizAsnad(String sanadCode) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "doccode": sanadCode
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "getDocumentDetailsList",
        "methodType": "post",
      }, (value) {
        var result = RizAsnadModel.fromJson(value);
        print(result);
        rizAsnad.value=result;
        Get.back();
        Get.to(RizAsnadScreen());
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/getDocumentDetailsList", body: {
        "params": {
          "bookid": Utils.bookId,
          "doccode": sanadCode
        }
      },header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = RizAsnadModel.fromJson(value);
        print(result);
        rizAsnad.value=result;
        Get.back();
        Get.to(RizAsnadScreen());
      });
    }


  }


}