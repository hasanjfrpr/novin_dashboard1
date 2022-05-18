

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazMoienScreen.dart';

class TarazController extends  GetxController{

  Rx<TarazMoeinModel> tarazMoienModel = TarazMoeinModel().obs;

  RxDouble s_bed = 0.0.obs;
  RxDouble s_bes = 0.0.obs;
  RxDouble bed = 0.0.obs;
  RxDouble bes = 0.0.obs;

  void _addtotalBedBes(TarazMoeinModel tarazMoeinModel){
    for(var i =0;i<tarazMoeinModel.tarazAzmayeshiKolMoeinList!.length ; i++){
      s_bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].sbed.toString().replaceAll("-", ""));
      s_bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].sbes.toString().replaceAll("-", ""));
      bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].bed.toString().replaceAll("-", ""));
      bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].bes.toString().replaceAll("-", ""));
      print(s_bes.value);
      print(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].sbed.toString().replaceAll("-", ""));
    }
  }

  void getTaraz(String startDate , String endDate , String codTac , String head , String tif) async{
    await RequestManager.postReq(url: "tservermethods1/GetTarazAzmayeshiKol_MoeinList", body:
    {
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate,
        "codtac": codTac,
        "scrhead": head
      }
    },
        header: {
          'Content-type': 'application/json',
          'authorization':auth()
        }
    ).then((value) {
      var result = TarazMoeinModel.fromJson(value);
      print(result);
      tarazMoienModel.value = result;
      _addtotalBedBes(result);
      Get.back();
      Get.to(TarazMoienScreen(tif: tif,));
    });



  }

  @override
  void onInit() {
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
     DeviceOrientation.landscapeRight,
     DeviceOrientation.landscapeLeft,
   ]);
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]);
    super.onClose();
  }

}