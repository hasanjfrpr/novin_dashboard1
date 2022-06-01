
import 'dart:io';

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKol_lv3_Model.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazKollv3Screen.dart';

class TarazMoienController extends GetxController{
  Rx<TarazKolLv3Model> tarazKolLv3 = TarazKolLv3Model().obs;
  RxList<TarazAzmayeshiKolMoeinTafsiliList> tarazKolLv3List = <TarazAzmayeshiKolMoeinTafsiliList>[].obs;
bool clickShod = false;
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
  sortable(String field){
    if(field == "sbed"){
      if(clickShod == false){
        tarazKolLv3List.value.sort((a,b)=>int.parse(a.sbed!.toLowerCase()=="null" ? "0" : a.sbed!).compareTo(int.parse(b.sbed!.toLowerCase()=="null" ? "0" : b.sbed!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = true;
      }else{
        tarazKolLv3List.value.sort((a,b)=>int.parse(b.sbed!.toLowerCase()=="null" ? "0" : b.sbed!).compareTo(int.parse(a.sbed!.toLowerCase()=="null" ? "0" : a.sbed!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = false;
      }
    }else if(field == "sbes"){
      if(clickShod == false){
        tarazKolLv3List.value.sort((a,b)=>int.parse(a.sbes!.toLowerCase()=="null" ? "0" : a.sbes!).compareTo(int.parse(b.sbes!.toLowerCase()=="null" ? "0" : b.sbes!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = true;
      }else{
        tarazKolLv3List.value.sort((a,b)=>int.parse(b.sbes!.toLowerCase()=="null" ? "0" : b.sbes!).compareTo(int.parse(a.sbes!.toLowerCase()=="null" ? "0" : a.sbes!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = false;
      }
    }else if(field == "bed"){
      if(clickShod == false){
        tarazKolLv3List.value.sort((a,b)=>int.parse(a.bed!.toLowerCase()=="null" ? "0" : a.bed!).compareTo(int.parse(b.bed!.toLowerCase()=="null" ? "0" : b.bed!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = true;
      }else{
        tarazKolLv3List.value.sort((a,b)=>int.parse(b.bed!.toLowerCase()=="null" ? "0" : b.bed!).compareTo(int.parse(a.bed!.toLowerCase()=="null" ? "0" : a.bed!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = false;
      }
    }else{
      if(clickShod == false){
        tarazKolLv3List.value.sort((a,b)=>int.parse(a.bes!.toLowerCase()=="null" ? "0" : a.bes!).compareTo(int.parse(b.bes!.toLowerCase()=="null" ? "0" : b.bes!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = true;
      }else{
        tarazKolLv3List.value.sort((a,b)=>int.parse(b.bes!.toLowerCase()=="null" ? "0" : b.bes!).compareTo(int.parse(a.bes!.toLowerCase()=="null" ? "0" : a.bes!)));
        tarazKolLv3List.refresh();
        update();
        clickShod = false;
      }
    }
  }

  void getTarazKolLv3(String startDate , String endDate , String codjac , String head , String tif) async{


    if(LocalData.getConnectionMethode()=="socket"){

      await SocketManager.request( {
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "codjac": codjac,
          "scrhead": head
        },
        "username": Utils.userName,
        "password": Utils.userName,
        "methodName": "GetTarazAzmayeshiKol_Moein_TafsiliList",
        "methodType": "post",
      }, (value) {
        var result = TarazKolLv3Model.fromJson(value);
        tarazKolLv3.value = result;
        tarazKolLv3List.value = result.tarazAzmayeshiKolMoeinTafsiliList!;
        _addtotalBedBes(tarazKolLv3.value);
        Get.back();
        Get.to(TarazKolLv3Screen(tif:tif));
      });

    }else{

      await RequestManager().postReq(url: "tservermethods1/GetTarazAzmayeshiKol_Moein_TafsiliList", body:
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

        var result = TarazKolLv3Model.fromJson(value);
        tarazKolLv3.value = result;
        tarazKolLv3List.value = result.tarazAzmayeshiKolMoeinTafsiliList!;
        _addtotalBedBes(tarazKolLv3.value);
        Get.back();
        Get.to(TarazKolLv3Screen(tif:tif));
      } );

    }

  }

}