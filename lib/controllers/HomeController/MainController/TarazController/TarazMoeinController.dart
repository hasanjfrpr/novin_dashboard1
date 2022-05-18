
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKol_lv3_Model.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazKollv3Screen.dart';

class TarazMoienController extends GetxController{
  Rx<TarazKolLv3Model> tarazKolLv3 = TarazKolLv3Model().obs;

  RxDouble s_bed = 0.0.obs;
  RxDouble s_bes = 0.0.obs;
  RxDouble bed = 0.0.obs;
  RxDouble bes = 0.0.obs;

  void _addtotalBedBes(TarazKolLv3Model tarazMoeinModel){
    for(var i =0;i<tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList!.length ; i++){
      s_bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList![i].sbed.toString().replaceAll("-", ""));
      s_bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList![i].sbes.toString().replaceAll("-", ""));
      bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList![i].bed.toString().replaceAll("-", ""));
      bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList![i].bes.toString().replaceAll("-", ""));
      print(s_bes.value);
      print(tarazMoeinModel.tarazAzmayeshiKolMoeinTafsiliList![i].sbed.toString().replaceAll("-", ""));
    }
  }

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
      _addtotalBedBes(tarazKolLv3.value);
      Get.back();
      Get.to(TarazKolLv3Screen(tif:tif));
    } );

  }

}