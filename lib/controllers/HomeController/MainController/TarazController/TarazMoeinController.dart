




import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKol_lv3_Model.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazKollv3Screen.dart';

class TarazMoienController extends GetxController{
  Rx<TarazKolLv3Model> tarazKolLv3 = TarazKolLv3Model().obs;



  void getTarazKolLv3(String startDate , String endDate , String codjac , String head , String tif) async{
    await RequestManager.postReq(url: "tservermethods1/GetTarazAzmayeshiKol_Moein_TafsiliList", body:
    {
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate,
        "codjac": codjac,
        "scrhead": head
      }
    },header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value){

      tarazKolLv3.value = TarazKolLv3Model.fromJson(value);
      Get.back();
      Get.to(TarazKolLv3Screen(tif:tif));
    } );

  }

}