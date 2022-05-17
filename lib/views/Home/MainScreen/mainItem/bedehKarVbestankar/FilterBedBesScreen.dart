
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/FilterBedBesController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/BedehkarVbestanKar.dart';
import 'package:search_choices/search_choices.dart';



class FilterBedBesScreen extends StatelessWidget {
   FilterBedBesScreen({Key? key}) : super(key: key);

   String? personName ;


  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    RxInt radioSelected = 0.obs;
    RxBool besCheck = true.obs;
    RxBool bedCheck = true.obs;
    RxBool biHesabCheck = true.obs;
    FilterBedBesController controller  = Get.put(FilterBedBesController());


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.filter+" "+AppString.bedehkarVbestankar),
      ),
      bottomNavigationBar:  Container(
        margin: EdgeInsets.symmetric(vertical: he * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
              onPressed: ()  {
                PersonListModel filterList = Get.find<MainController>().personListModel.value;
                List<PersonList>? personList=<PersonList>[];
                personList.clear();
                 if(radioSelected.value == 0){
                  personList = filterList.personList;
                }else if(radioSelected.value ==1){

                  for(var i=0 ; i<filterList.personList!.length; i++){
                    if(filterList.personList![i].fldTifLfac == personName){
                      personList.add(filterList.personList![i]);
                    }
                  }

                }else{
                  if(bedCheck.value==true && besCheck.value==true && biHesabCheck.value==true){
                    personList = Get.find<MainController>().personListModel.value.personList;
                  }else if(bedCheck.value==true && besCheck.value==true && biHesabCheck.value==false){
                    for(var ps in filterList.personList!){
                      if(ps.prc!.toLowerCase()!="null" && ps.prc!.toLowerCase()!="0" && ps.prc!.toLowerCase()!=""){
                        personList.add(ps);
                      }
                    }
                  }else if(bedCheck.value==true && besCheck.value==false && biHesabCheck.value==true){
                    for(var ps in filterList.personList!){
                      if(!ps.prc!.toLowerCase().contains("-")){
                        personList.add(ps);
                      }
                    }
                  }else if(bedCheck.value==false && besCheck.value==true && biHesabCheck.value==true){
                    for(var ps in filterList.personList!){
                      if(ps.prc!.toLowerCase().contains("-") || ps.prc!.toLowerCase()=="null" || ps.prc!.toLowerCase()=="0" || ps.prc!.toLowerCase()==""){
                        personList.add(ps);
                      }
                    }
                  }else if(bedCheck.value==false && besCheck.value==false && biHesabCheck.value==false){
                    personList.clear();
                  }else if(bedCheck.value==true && besCheck.value==false && biHesabCheck.value==false){
                    for(var ps in filterList.personList!){
                      if(!ps.prc!.toLowerCase().contains("-") && ps.prc!.toLowerCase() != "null" && ps.prc!.toLowerCase() != "0" && ps.prc!.toLowerCase() != ""){
                        personList.add(ps);
                      }
                    }
                  }else if(bedCheck.value==false && besCheck.value==true && biHesabCheck.value==false){
                    for(var ps in filterList.personList!){
                      if(ps.prc!.toLowerCase().contains("-")){
                        personList.add(ps);
                      }
                    }
                  }else if(bedCheck.value==false && besCheck.value==false && biHesabCheck.value==true){
                    for(var ps in filterList.personList!){
                      if(ps.prc!.toLowerCase()=="null" || ps.prc!.toLowerCase()=="0" || ps.prc!.toLowerCase()==""){
                        personList.add(ps);
                      }
                    }
                }
                }

                print(personList);
                Get.to(BedehkarVbestanKarScreen()  );

              },
              height: he * 0.05,
              minWidth: wi * 0.4,
              splashColor: Color(AppColor.primaryColor),
              color: Color(AppColor.primaryColor),
              padding: EdgeInsets.symmetric(horizontal: wi * 0.1),
              child: Text(
                AppString.filter,
                style: TextStyle(color: Color(AppColor.onPrimaryColor)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(wi * 0.02)),
            ),
            MaterialButton(
              onPressed: () {
               radioSelected.value = 0;

              },
              height: he * 0.05,
              minWidth: wi * 0.4,
              color: Color(AppColor.onPrimaryColor),
              padding: EdgeInsets.symmetric(horizontal: wi * 0.1),
              child: Text(
                AppString.cleanFilter,
                style: TextStyle(color: Color(AppColor.primaryColor)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(wi * 0.02)),
            ),
          ],
        ),
      ),
      body: Container(
          width: wi,
          height: he,
          child: Obx((){
            return  Column(
              children: [
                RadioListTile<int>(value: 0, groupValue: radioSelected.value, onChanged: (value){radioSelected.value = value!;} ,title: Text(AppString.all),),
                RadioListTile<int>(value: 1, groupValue: radioSelected.value, onChanged: (value){radioSelected.value = value!;} , title: Text(AppString.selectCertianPerson),),
                RadioListTile<int>(value: 2, groupValue: radioSelected.value, onChanged: (value){radioSelected.value = value!;} , title: Text(AppString.selectWithMondeHesab),),
                Divider(),
                radioSelected.value == 1 ? _searchSpinnerPerson(wi, he, controller) : radioSelected.value ==2 ? mondeHesab(wi, he, controller,bedCheck,besCheck,biHesabCheck): Text("")








              ],
            );
          }

          ),
        ),

    );
  }
  Widget mondeHesab(double wi , double he , FilterBedBesController controller , RxBool bed , RxBool bes , RxBool bihesab){
    return Container(
      width: wi ,
      margin: EdgeInsets.symmetric(horizontal: wi*0.04),
      padding: EdgeInsets.symmetric(vertical: wi*0.04),
      decoration: BoxDecoration(color: Colors.white ,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(he*0.1 )),
      boxShadow: [BoxShadow(color: Colors.grey , spreadRadius: wi*0.0008, blurRadius: wi*0.02, offset: Offset(1,1) )],
      ),

      child: Column(
        children: [
          ListTile(title: Text("بستانکار"),  leading: Checkbox(value:bes.value , onChanged: (value){ bes.value = value!; } ,activeColor: Color(AppColor.primaryColor),),),
          ListTile(title: Text("بدهکار"),  leading: Checkbox(value:bed.value , onChanged: (value){ bed.value = value!;} ,activeColor: Color(AppColor.primaryColor)),),
          ListTile(title: Text("بی حساب"),  leading: Checkbox(value:bihesab.value , onChanged: (value){ bihesab.value = value!;} ,activeColor: Color(AppColor.primaryColor)),),
        ],
      ),

    );
  }




 
  Widget _searchSpinnerPerson(double wi, double he , FilterBedBesController controller  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: wi * .03),
      padding: EdgeInsets.symmetric(horizontal: wi * .05, vertical: he * 0.01),
      decoration: BoxDecoration(
          border: Border.all(color: Color(AppColor.borderColor), width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: SearchChoices.single(
        items: Get.find<MainController>().personList.value,
        value: "",
        hint: AppString.personsList,
        rightToLeft: true,
        searchHint: null,
        onChanged: (value) {
          personName = value;
        },
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(he*0.3)),
      ),
    );
  }


}
