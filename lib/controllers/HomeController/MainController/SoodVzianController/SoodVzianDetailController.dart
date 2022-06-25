

import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKolLv4Model.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/SoodVzianTafziliScreen.dart';

class SoodVzianDetailController extends GetxController with GetSingleTickerProviderStateMixin{


  Rx<TarazKolLv4Model> tafziliListModel = TarazKolLv4Model().obs;



  void getTafziliTafzili(String startDate , String endDate , String head , String codJac , String fac , String tif) async{
    if(LocalData.getConnectionMethode()=="socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate":startDate,
          "enddate": endDate,
          "codjac": codJac,
          "scrhead": head,
          "lfac": fac
        },
        "username":Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetTarazAzmayeshiKol_Moein_Tafsili_TafsiliList",
        "methodType": "post",
      }, (value) {
        var result = TarazKolLv4Model.fromJson(value);
        tafziliListModel.value = result;
        Get.back();
        Get.to(()=>SoodVzianTafziliScreen());
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/GetTarazAzmayeshiKol_Moein_Tafsili_TafsiliList", body: {
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "codjac": codJac,
          "scrhead": head,
          "lfac": fac
        }
      },header: {
        'Content-type': 'application/json',
        'authorization':auth()
      }).then((value){
        var result = TarazKolLv4Model.fromJson(value);
        tafziliListModel.value = result;
        Get.back();
        Get.to(()=>SoodVzianTafziliScreen());
      });
    }
  }





  @override
  void onInit() {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }



}