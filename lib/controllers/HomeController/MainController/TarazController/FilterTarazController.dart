

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKolModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Daramad/DaramadScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Hazine/HazineScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazScreen.dart';

class FilterTarazController extends GetxController{
  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;

  RxBool isChecked = true.obs;


  Rx<TarazKolModel> tarazKolModel = TarazKolModel().obs;


  RxDouble s_bed = 0.0.obs;
  RxDouble s_bes = 0.0.obs;
  RxDouble bed = 0.0.obs;
  RxDouble bes = 0.0.obs;






  void getTaraz(String startDate , String endDate) async{
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
      tarazKolModel.value = tarazKol;
      print(tarazKol);

      if(isChecked.value){

        print(tarazKolModel.value.tarazAzmayeshiKolList!);
        Get.back();
        Get.to(TarazScreen());

      }else{

        for(var i=0;i<tarazKolModel.value.tarazAzmayeshiKolList!.length ; i++){

          if(tarazKolModel.value.tarazAzmayeshiKolList![i].bed=="0" && tarazKolModel.value.tarazAzmayeshiKolList![i].bes=="0" && tarazKolModel.value.tarazAzmayeshiKolList![i].sbed=="0" && tarazKolModel.value.tarazAzmayeshiKolList![i].sbes=="0"){
            tarazKolModel.value.tarazAzmayeshiKolList!.remove(tarazKolModel.value.tarazAzmayeshiKolList![i]);
          }


        }
        print(tarazKolModel.value.tarazAzmayeshiKolList!);
        Get.back();
        Get.to(TarazScreen());

      }

    });

  }

}