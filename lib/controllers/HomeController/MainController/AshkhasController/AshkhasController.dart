

import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class AshkhasCotrolller extends GetxController{


  Rx<PersonListModel> personListModel = PersonListModel().obs;
  RxList<PersonList> personListAhskhas = [PersonList()].obs;
  RxList<PersonList> helpListPerson = [PersonList()].obs;




  @override
  void onInit() {
    personListAhskhas.addAll(Get.find<MainController>().personListModel.value.personList!);
    helpListPerson.addAll(Get.find<MainController>().personListModel.value.personList!);
    print(personListAhskhas.length);
    super.onInit();
  }



  void getPersonList() async{
    await RequestManager.postReq(url: "tservermethods1/GetpersonList", body: { "params": {"bookid": '${Utils.bookId}'}} , header: {
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