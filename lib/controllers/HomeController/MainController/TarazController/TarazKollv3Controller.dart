

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKolLv4Model.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazKolLv4Screen.dart';
import 'package:socket_io_client/socket_io_client.dart';

class TarazKolLv3Controller extends GetxController{
  Rx<TarazKolLv4Model> tarazKolLv4Model = TarazKolLv4Model().obs;


  void getTarazKolLv4(String startDate , String endDate , String head , String codJac , String fac , String tif) async{

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
        tarazKolLv4Model.value = TarazKolLv4Model.fromJson(value);
        print(tarazKolLv4Model.value.tarazAzmayeshiKolMoeinTafsiliTafsiliList!.length);
        Get.back();
        Get.to(TarazKolLv4Screen(tif:tif));
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/ GetTarazAzmayeshiKol_Moein_Tafsili_TafsiliList", body: {
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
        tarazKolLv4Model.value = TarazKolLv4Model.fromJson(value);
        print(tarazKolLv4Model.value.tarazAzmayeshiKolMoeinTafsiliTafsiliList!.length);
        Get.back();
        Get.to(TarazKolLv4Screen(tif:tif));
      });
    }



  }
}