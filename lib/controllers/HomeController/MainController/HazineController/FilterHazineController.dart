

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazKolModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Daramad/DaramadScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Hazine/HazineScreen.dart';

class FilterHazineControler extends GetxController{
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








  void getHazine(String startDate , String endDate) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": "1",
          "startdate": startDate,
          "enddate": endDate
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetTarazAzmayeshiKollist",
        "methodType": "post",
      }, (value) {
        var tarazKol = TarazKolModel.fromJson(value);
        for(var ps in tarazKol.tarazAzmayeshiKolList!){
          if(ps.cfs=="0040"){
            _getHazines(ps.fldcodtac!, ps.fldscrhead! , startDate , endDate);
          }
        }
      });
    }else{
      await RequestManager().postReq(url: "tservermethods1/GetTarazAzmayeshiKollist", body:
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
          if(ps.cfs=="0040"){
            _getHazines(ps.fldcodtac!, ps.fldscrhead! , startDate , endDate);
          }
        }
      });
    }


  }

  void _getHazines(String codeTak , String head , String startDate , String endDate) async{

    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
          "codtac": codeTak,
          "scrhead": head
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetTarazAzmayeshiKol_MoeinList",
        "methodType": "post",
      }, (value) {
        var result = TarazMoeinModel.fromJson(value);
        print("this is taraz : $result" );
        tarazMoeinModel.value = result;
        _addtotalBedBes(result);
        Get.back();
        Get.to(()=>HazineScreen());
      });
    }else{

      await RequestManager().postReq(url: "tservermethods1/GetTarazAzmayeshiKol_MoeinList", body: {
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
        Get.to(()=>HazineScreen());
      });
    }



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