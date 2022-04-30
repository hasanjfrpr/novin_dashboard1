

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKolModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Daramad/DaramadScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Hazine/HazineScreen.dart';

class FilterDaramadControler extends GetxController{
  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;


  Rx<TarazMoeinModel> tarazMoeinModel = TarazMoeinModel().obs;

  RxDouble s_bed = 0.0.obs;
  RxDouble s_bes = 0.0.obs;
  RxDouble bed = 0.0.obs;
  RxDouble bes = 0.0.obs;








  void getDaramad(String startDate , String endDate) async{

    await RequestManager.postReq(url: "tservermethods1/GetTarazAzmayeshiKollist", body:
    {
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate
      }
    },
        header: {
          'Content-type': 'application/json',
          'authorization':auth()
        }
    ).then((value) {
      var tarazKol = TarazKolModel.fromJson(value);
      for(var ps in tarazKol.tarazAzmayeshiKolList!){
        if(ps.cfs=="0050"){
          _getDaramads(ps.fldcodtac!, ps.fldscrhead! , startDate , endDate);
        }
      }
    });

  }

  void _getDaramads(String codeTak , String head , String startDate , String endDate) async{
    await RequestManager.postReq(url: "tservermethods1/GetTarazAzmayeshiKol_MoeinList", body: {
      "params": {
        "bookid": Utils.bookId,
        "startdate": startDate,
        "enddate": endDate,
        "codtac": codeTak,
        "scrhead":head
      }
    }, header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value){
      var result = TarazMoeinModel.fromJson(value);
      print("this is taraz : $result" );
      tarazMoeinModel.value = result;
      _addtotalBedBes(result);
      Get.back();
      Get.to(DaramadScreen());
    });


  }
  void _addtotalBedBes(TarazMoeinModel tarazMoeinModel){
    for(var i =0;i<tarazMoeinModel.tarazAzmayeshiKolMoeinList!.length ; i++){
      s_bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].sbed.toString().replaceAll("-", ""));
      s_bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].sbes.toString().replaceAll("-", ""));
      bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].bed.toString().replaceAll("-", ""));
      bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolMoeinList![i].bes.toString().replaceAll("-", ""));
    }



  }

}