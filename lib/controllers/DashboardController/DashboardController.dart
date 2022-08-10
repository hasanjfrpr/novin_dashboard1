


import 'dart:ffi';

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/HomeController.dart';
import 'package:novin_dashboard1/model/DashBoard/ChartModel.dart';
import 'package:novin_dashboard1/model/DashBoard/DashBoardModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class DashBoardController extends GetxController{
  RxInt day = Get.find<HomeController>().jalili.value.day.obs;
  RxInt month = Get.find<HomeController>().jalili.value.month.obs;
  RxInt year = Get.find<HomeController>().jalili.value.year.obs;
  RxInt endDay = Get.find<HomeController>().jalili.value.day.obs;
  RxInt endMonth = Get.find<HomeController>().jalili.value.month.obs;
  RxInt endYear = Get.find<HomeController>().jalili.value.year.obs;
  RxInt activeBackGround = 1.obs;

  Rx<DashBoardModel> dashBoardModel = DashBoardModel().obs;
  RxBool loadingDashboard = true.obs;

  RxList<ChartModel> forooshWeek = <ChartModel>[].obs;
  RxList<ChartModel> returnForooshWeek = <ChartModel>[].obs;

  RxString asnadVosol = "".obs;
  RxString hesab_sandoq = "".obs;
  RxString hesab_bank_d = "".obs;
  RxString asnad_pardakhti = "".obs;
  RxString mabla_check = "".obs;
  RxString hesab_bank_p = "".obs;
  RxString foroosh_khadamat = "".obs;
  RxString hazine = "".obs;
  RxString sayer_daramad = "".obs;



  void getDashboard(String startDate , String endDate ) async{
    if(LocalData.getConnectionMethode() == "socket"){
      await SocketManager.request({
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate
        },
        "username": Utils.userName,
        "password": Utils.passWord,
        "methodName": "GetDashBoard",
        "methodType": "post",
      }, (value) {
        var result = DashBoardModel.fromJson(value);
        dashBoardModel.value = result;

        for(var i=0 ; i<dashBoardModel.value.dashboardllist!.length ; i++){
          switch(dashBoardModel.value.dashboardllist![i].fLDSCRHEAD){
            case "5":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                asnadVosol.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                asnadVosol.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }

              break;
            case "1":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_sandoq.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_sandoq.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "2":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_bank_d.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_bank_d.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "4":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                asnad_pardakhti.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                asnad_pardakhti.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "-0":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                mabla_check.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                mabla_check.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "3":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_bank_p.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_bank_p.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "18":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                foroosh_khadamat.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                foroosh_khadamat.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "7":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hazine.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hazine.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "19":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                sayer_daramad.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                sayer_daramad.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
          }
        }

        forooshWeek.clear();
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek1Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek1==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek1!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek2Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek2==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek2!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek3Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek3==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek3!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek4Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek4==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek4!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek5Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek5==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek5!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek6Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek6==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek6!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek7Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek7==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek7!)));

       ///////////////////

        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek1Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek1==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek1!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek2Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek2==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek2!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek3Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek3==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek3!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek4Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek4==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek4!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek5Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek5==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek5!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek6Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek6==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek6!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek7Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek7==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek7!)));
        ///
        print(forooshWeek);
        loadingDashboard.value = false;


      });
    }else{

      await RequestManager().postReq(url: "tservermethods1/GetDashboard", body: {
        "params": {
          "bookid": Utils.bookId,
          "startdate": startDate,
          "enddate": endDate,
        }
      }, header:{
        'Content-type': 'application/json',
        'authorization':""
      }).then((value){
        var result = DashBoardModel.fromJson(value);
        dashBoardModel.value = result;

        for(var i=0 ; i<dashBoardModel.value.dashboardllist!.length ; i++){
          switch(dashBoardModel.value.dashboardllist![i].fLDSCRHEAD){
            case "5":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                asnadVosol.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                asnadVosol.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }

              break;
            case "1":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_sandoq.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_sandoq.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "2":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_bank_d.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_bank_d.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "4":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                asnad_pardakhti.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                asnad_pardakhti.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "-0":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                mabla_check.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                mabla_check.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "3":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hesab_bank_p.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hesab_bank_p.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "18":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                foroosh_khadamat.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                foroosh_khadamat.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "7":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                hazine.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                hazine.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
            case "19":
              if(dashBoardModel.value.dashboardllist![i].sBED.toString()==""||dashBoardModel.value.dashboardllist![i].sBED.toString()=="0"){
                sayer_daramad.value = dashBoardModel.value.dashboardllist![i].sBES.toString();
              }else{
                sayer_daramad.value = dashBoardModel.value.dashboardllist![i].sBED.toString();
              }
              break;
          }
        }

        print(dashBoardModel.value.dayWeek7!.foroshReportChartWeek1Name.toString());

        forooshWeek.clear();
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek1Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek1==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek1!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek2Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek2==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek2!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek3Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek3==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek3!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek4Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek4==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek4!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek5Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek5==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek5!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek6Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek6==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek6!)));
        forooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek7Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.foroshReportChartWeek7==""?"0":dashBoardModel.value.dayWeek7!.foroshReportChartWeek7!)));

        ///////////////////

        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek1Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek1==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek1!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek2Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek2==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek2!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek3Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek3==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek3!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek4Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek4==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek4!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek5Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek5==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek5!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek6Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek6==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek6!)));
        returnForooshWeek.add(ChartModel(lable: dashBoardModel.value.dayWeek7!.foroshReportChartWeek7Name.toString(), value: int.parse(dashBoardModel.value.dayWeek7!.retReportChartWeek7==""?"0":dashBoardModel.value.dayWeek7!.retReportChartWeek7!)));
        ///
        print(forooshWeek);
        loadingDashboard.value = false;


      });
    }
    }


}