

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/TarazMoienScreen.dart';
import 'package:socket_io_client/socket_io_client.dart';

class TarazController extends  GetxController{

  Rx<TarazMoeinModel> tarazMoienModel = TarazMoeinModel().obs;
  RxList<TarazAzmayeshiKolMoeinList> tarazMoienList = [TarazAzmayeshiKolMoeinList()].obs;
bool clickShod = false;
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

    if(LocalData.getConnectionMethode()=="socket"){

      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "codtac": codTac,
          "scrhead": head
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetTarazAzmayeshiKol_MoeinList",
        "methodType": "post",
      }, (value) {
        var result = TarazMoeinModel.fromJson(value);
        print(result);
        tarazMoienModel.value = result;
        tarazMoienList.value=result.tarazAzmayeshiKolMoeinList!;
        _addtotalBedBes(result);
        Get.back();
        Get.to(()=>TarazMoienScreen(tif: tif,));
      });

    }else{

      await RequestManager().postReq(url: "tservermethods1/GetTarazAzmayeshiKol_MoeinList", body:
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
        tarazMoienList.value=result.tarazAzmayeshiKolMoeinList!;
        _addtotalBedBes(result);
        Get.back();
        Get.to(()=>TarazMoienScreen(tif: tif,));
      });
    }




  }
  sortable(String field){
    if(field == "sbed"){
      if(clickShod == false){
        tarazMoienList.value.sort((a,b)=>int.parse(a.sbed!.toLowerCase()=="null" ? "0" : a.sbed!).compareTo(int.parse(b.sbed!.toLowerCase()=="null" ? "0" : b.sbed!)));
        tarazMoienList.refresh();
        update();
        clickShod = true;
      }else{
        tarazMoienList.value.sort((a,b)=>int.parse(b.sbed!.toLowerCase()=="null" ? "0" : b.sbed!).compareTo(int.parse(a.sbed!.toLowerCase()=="null" ? "0" : a.sbed!)));
        tarazMoienList.refresh();
        update();
        clickShod = false;
      }
    }else if(field == "sbes"){
      if(clickShod == false){
        tarazMoienList.value.sort((a,b)=>int.parse(a.sbes!.toLowerCase()=="null" ? "0" : a.sbes!).compareTo(int.parse(b.sbes!.toLowerCase()=="null" ? "0" : b.sbes!)));
        tarazMoienList.refresh();
        update();
        clickShod = true;
      }else{
        tarazMoienList.value.sort((a,b)=>int.parse(b.sbes!.toLowerCase()=="null" ? "0" : b.sbes!).compareTo(int.parse(a.sbes!.toLowerCase()=="null" ? "0" : a.sbes!)));
        tarazMoienList.refresh();
        update();
        clickShod = false;
      }
    }else if(field == "bed"){
      if(clickShod == false){
        tarazMoienList.value.sort((a,b)=>int.parse(a.bed!.toLowerCase()=="null" ? "0" : a.bed!).compareTo(int.parse(b.bed!.toLowerCase()=="null" ? "0" : b.bed!)));
        tarazMoienList.refresh();
        update();
        clickShod = true;
      }else{
        tarazMoienList.value.sort((a,b)=>int.parse(b.bed!.toLowerCase()=="null" ? "0" : b.bed!).compareTo(int.parse(a.bed!.toLowerCase()=="null" ? "0" : a.bed!)));
        tarazMoienList.refresh();
        update();
        clickShod = false;
      }
    }else{
      if(clickShod == false){
        tarazMoienList.value.sort((a,b)=>int.parse(a.bes!.toLowerCase()=="null" ? "0" : a.bes!).compareTo(int.parse(b.bes!.toLowerCase()=="null" ? "0" : b.bes!)));
        tarazMoienList.refresh();
        update();
        clickShod = true;
      }else{
        tarazMoienList.value.sort((a,b)=>int.parse(b.bes!.toLowerCase()=="null" ? "0" : b.bes!).compareTo(int.parse(a.bes!.toLowerCase()=="null" ? "0" : a.bes!)));
        tarazMoienList.refresh();
        update();
        clickShod = false;
      }
    }
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