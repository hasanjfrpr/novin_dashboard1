

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class AshkhasCotrolller extends GetxController{


  Rx<PersonListModel> personListModel = PersonListModel().obs;
  RxList<PersonList> personListAhskhas = [PersonList()].obs;
  RxList<PersonList> helpListPerson = [PersonList()].obs;
  late ScrollController scrollController ;
  RxBool showLoading=false.obs;
  int page = 1;




  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() async{

      if(scrollController.offset == scrollController.position.maxScrollExtent){
showLoading.value = true;
        print("resid be tahesh azizam");
        if(LocalData.getConnectionMethode() == "socket"){
          await SocketManager.request({
            "params": {
              "bookid": Utils.bookId
            },
            "username": Utils.userName,
            "password": Utils.passWord,
            "methodName": "GetpersonList",
            "methodType": "post",
            "page":"${page+1}"
          }, (value) {
            PersonListModel result = PersonListModel.fromJson(value);
            personListAhskhas.value.addAll(result.personList!);
            personListAhskhas.refresh();
            update();
            showLoading.value = false;
            print(personListAhskhas.length);
            // if(result.personList!.length > 1 && adad==1){
            //   for(var i=0 ;i<result.personList!.length ; i++){
            //     personList.value.add( new DropdownMenuItem<String>(child: Text(result.personList![i].fldTifLfac.toString()) , value:result.personList![i].fldTifLfac.toString() ,));
            //   }
            // }

          });
        }
      }
    });
    personListAhskhas.addAll(Get.find<MainController>().personListModel.value.personList!);
    helpListPerson.addAll(Get.find<MainController>().personListModel.value.personList!);
    print(personListAhskhas.length);
    super.onInit();
  }



  void getPersonList() async{
    await RequestManager().postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
      'Content-type': 'application/json',
      'authorization':auth()
    }).then((value) {
      var result = PersonListModel.fromJson(value);
      personListModel.value = result;

      print(result);
      Get.back();
    });
  }

  void searachAhskhas(String value){

    List<PersonList> fakeList = <PersonList>[];
print(value);
    if(value == ""){
      fakeList.clear();
      fakeList.addAll(helpListPerson);
      print(fakeList.length);
    }else if(value != ""){
      fakeList.clear();
      helpListPerson.forEach((element) {
        if(element.cfs.toString().contains(value.toLowerCase())){
          fakeList.add(element);
        }
      });
      print(fakeList.length);
    }

    print(fakeList.length);
    personListAhskhas.clear();
    personListAhskhas.value.addAll(fakeList);
    personListAhskhas.refresh();
    update();

  }
}