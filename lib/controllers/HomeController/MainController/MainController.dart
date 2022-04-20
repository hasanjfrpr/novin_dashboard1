import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/FilterBedBesController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/MainItemModel.dart';
import 'package:novin_dashboard1/model/MainModel/sliderModel/SliderModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/ashKhasList/AshKhasList.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/FilterBedBesScreen.dart';


class MainController extends GetxController{

  late RxList<SliderModel> imgList =<SliderModel>[].obs;
  Rx<PersonListModel>  personListModel = PersonListModel().obs;
  RxList<DropdownMenuItem> personList = [DropdownMenuItem<String>(child: Text("خالی") , value: "خالی",)].obs;

  List<MainItemModel> mainItemList =[
    MainItemModel(imagePath: "assets/images/order.png", name: AppString.factorFrosh,id: 0),
    MainItemModel(imagePath: "assets/images/balance2.png", name: AppString.tarazAzmayeshi,id: 1),
    MainItemModel(imagePath: "assets/images/document2.png", name: AppString.AsnadList,id: 2),
    MainItemModel(imagePath: "assets/images/profits.png", name: AppString.sodVzian,id: 3),
    MainItemModel(imagePath: "assets/images/persons.png", name:AppString.personsList,id: 4),
    MainItemModel(imagePath: "assets/images/debtor.png", name: AppString.bedehkarVbestankar,id: 5),
    MainItemModel(imagePath: "assets/images/stock.png", name: AppString.mojodiKala,id: 6),
    MainItemModel(imagePath: "assets/images/costs.png", name: AppString.hazineh , id: 7),
    MainItemModel(imagePath: "assets/images/income.png", name: AppString.daramad,id: 8),
  ];




  @override
  void onInit() {

    super.onInit();


  }

  void getPersonList(int adad) async{
    await RequestManager.postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value) {
      var result = PersonListModel.fromJson(value);
      personListModel.value = result;
      print(result);
      if(result.personList!.length > 1 && adad==1){
        for(var i=0 ;i<result.personList!.length ; i++){
          personList.value.add( new DropdownMenuItem<String>(child: Text(result.personList![i].fldTifLfac.toString()) , value:result.personList![i].fldTifLfac.toString() ,));
        }
      }
      Get.back();
     adad==1 ? Get.to(FilterBedBesScreen())  : Get.to(AshKhasListScreen());
    });
  }

  void onIn(){
    _getSliderImg().then((value) => imgList.addAll(value));
  }






  Future<List<SliderModel>> _getSliderImg() async{

    var result = await http.get(Uri.parse("https://www.hnovin.com/app/gallery.php"));
    if(result.statusCode == 200){

      List<dynamic> body = jsonDecode(result.body);
      List<SliderModel> sliderLlist = body.map((e) => SliderModel.fromJson(e)).toList();
      return sliderLlist;
    }else{
      throw Exception("failsssssss");
    }

  }




}