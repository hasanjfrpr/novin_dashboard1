

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
  RxList<TarazAzmayeshiKolList> listTaraz = <TarazAzmayeshiKolList>[].obs;


  RxDouble s_bed = 0.0.obs;
  RxDouble s_bes = 0.0.obs;
  RxDouble bed = 0.0.obs;
  RxDouble bes = 0.0.obs;


  void _addtotalBedBes(TarazKolModel tarazMoeinModel){
    for(var i =0;i<tarazMoeinModel.tarazAzmayeshiKolList!.length ; i++){
      s_bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolList![i].sbed.toString().replaceAll("-", ""));
      s_bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolList![i].sbes.toString().replaceAll("-", ""));
      bed.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolList![i].bed.toString().replaceAll("-", ""));
      bes.value += double.parse(tarazMoeinModel.tarazAzmayeshiKolList![i].bes.toString().replaceAll("-", ""));
      print(s_bes.value);
      print(tarazMoeinModel.tarazAzmayeshiKolList![i].sbed.toString().replaceAll("-", ""));
    }



  }




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
      listTaraz.value.clear();
      listTaraz.value = tarazKolModel.value.tarazAzmayeshiKolList!;
      print(tarazKol);

      if(isChecked.value==true){

        print(listTaraz.value.length);
        _addtotalBedBes(tarazKolModel.value);
        Get.back();
        Get.to(TarazScreen());

      }else{

        for(var i=0;i<listTaraz.value.length ; i++){

          if(listTaraz.value[i].bed=="0" &&
              listTaraz.value[i].bes=="0" &&
              listTaraz.value[i].sbed=="0" &&
              listTaraz.value[i].sbes=="0"){
            listTaraz.value.remove(listTaraz.value[i]);

          }
          if(listTaraz.value[i].bed!.toLowerCase()=="null" &&
              listTaraz.value[i].bes!.toLowerCase()=="null" &&
              listTaraz.value[i].sbed!.toLowerCase()=="null" &&
              listTaraz.value[i].sbes!.toLowerCase()=="null"){
            listTaraz.value.remove(listTaraz.value[i]);

          }


        }
        print(listTaraz.value.length);
        _addtotalBedBes(tarazKolModel.value);
        Get.back();
        Get.to(TarazScreen());

      }

    });

  }

}