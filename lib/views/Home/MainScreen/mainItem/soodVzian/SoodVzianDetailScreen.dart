
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/FilterSoodVzianController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/SoodVzianController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/SoodVzianDetailController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/SoodVzianModel/SoodVzianDetailModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class SoodVzianDetailScreen extends StatelessWidget {
  String? title;
   SoodVzianDetailScreen({Key? key , this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    RxInt selectorR = 2000.obs;
    SoodVzianDetailController soodVzianDetailontroller = Get.put(SoodVzianDetailController());



    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: Text("ریز " + title!),
            backgroundColor: Color(AppColor.primaryColor),
          ),
          floatingActionButton: FloatingActionButton(child: Icon(CupertinoIcons.color_filter,color: Color(AppColor.onPrimaryColor),),backgroundColor: Color(AppColor.primaryColor),onPressed: (){showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(wi*0.08) , topRight: Radius.circular(wi*0.08))),context: context, builder: (context){
            return _bottomSheet(wi, he,selectorR);
          });},),
          body: OrientationBuilder(builder:(context , orientation)=> orientation == Orientation.portrait ? _portraitView(wi, he  ,Get.find<SoodVzianController>() ,soodVzianDetailontroller) :
          _landScapeView(wi, he  ,Get.find<SoodVzianController>() ,soodVzianDetailontroller) ),

    );

  }
  Widget _portraitView(double wi , double he  ,SoodVzianController soodVzianController,SoodVzianDetailController detailController){

//var soodZianList = soodVzianController.soodVzianDetailModel.value.soodZianDetailsList!;


    return  Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(flex: 5,child: Container(height: he*0.065,alignment: Alignment.center,color: Colors.blue,child: Text("کد",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
                SizedBox(width: 1,),
                Expanded(flex: 6,child: Container(height: he*0.065,alignment: Alignment.center,color: Colors.blue,child: Text("عنوان",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
                SizedBox(width: 1,),
                Expanded(flex: 4,child: Container(height: he*0.065,alignment: Alignment.center,color: Colors.blue,child: Text("مانده تفصیلی",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
              ],),
            ),
            Expanded(
              flex: 16,
              child: Obx(
                (){return ListView.builder(

                      itemCount: soodVzianController.soodVzianDetailModel_fake.value.length,
                      itemBuilder: (context , index){
                        return  InkWell(
                          onTap: (){
                            if(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9){
                              detailController.getTafziliTafzili(convertJtoGDate(Get.find<FilterSoodVzianControler>().year.value,Get.find<FilterSoodVzianControler>().month.value, Get.find<FilterSoodVzianControler>().day.value),
                                  convertJtoGDate(Get.find<FilterSoodVzianControler>().endYear.value,Get.find<FilterSoodVzianControler>().endMonth.value, Get.find<FilterSoodVzianControler>().endDay.value),
                                  Utils.headSoozVzianDetail.toString(),
                                  soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldCodJac.toString(),
                                  soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldCodLfac.toString(),
                                  soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldTifLfac.toString());
                              showLoading(wi, he);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom:soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.04:0,
                            right: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.015:0,
                            left: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.015:0),
                             // color: index.isEven ? Colors.white70  : Colors.blue.shade50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.08:0),
                              bottomLeft: Radius.circular(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.08:0)),
                              color: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? Colors.white : Colors.grey.shade200,
                              boxShadow: [
                                soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? BoxShadow(color: Colors.grey.shade400,offset: Offset(0,2) , spreadRadius: 1.5,blurRadius: 3)
                                    :BoxShadow()
                              ]
                              ),
                              child: Row(children: [
                                Expanded(flex: 5,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodVzianController.soodVzianDetailModel_fake.value[index].cfs.toString().toLowerCase()=="null"?"---":soodVzianController.soodVzianDetailModel_fake.value[index].cfs.toString(),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12),),)),
                                SizedBox(width:1,),
                                Expanded(flex: 6,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodVzianController.soodVzianDetailModel_fake.value[index].fldTifLfac.toString().toLowerCase()=="null"?"----":soodVzianController.soodVzianDetailModel_fake.value[index].fldTifLfac.toString(),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12)),)),
                                SizedBox(width: 1,),
                                Expanded(flex: 4,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(setFormatNumber(soodVzianController.soodVzianDetailModel_fake.value[index].fldPrcAcc.toString()),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12)),)),
                              ],),
                            ),
                        );

                      },

                  );}
              ),
            ),
          ],

    );
  }

  Widget _landScapeView(double wi , double he  ,SoodVzianController soodVzianController,SoodVzianDetailController detailController){

    return  Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Row(children: [
            Expanded(flex: 5,child: Container(height: he*0.07,alignment: Alignment.center,color: Colors.blue,child: Text("کد",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
            SizedBox(width: 1,),
            Expanded(flex: 6,child: Container(height: he*0.07,alignment: Alignment.center,color: Colors.blue,child: Text("عنوان",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
            SizedBox(width: 1,),
            Expanded(flex: 4,child: Container(height: he*0.07,alignment: Alignment.center,color: Colors.blue,child: Text("مانده تفصیلی",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
          ],),
        ),
        Expanded(
          flex: 14,
          child: Obx(
                  (){return ListView.builder(

                itemCount: soodVzianController.soodVzianDetailModel_fake.value.length,
                itemBuilder: (context , index){
                  return  InkWell(
                    onTap: (){
                      if(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9){
                        detailController.getTafziliTafzili(convertJtoGDate(Get.find<FilterSoodVzianControler>().year.value,Get.find<FilterSoodVzianControler>().month.value, Get.find<FilterSoodVzianControler>().day.value),
                            convertJtoGDate(Get.find<FilterSoodVzianControler>().endYear.value,Get.find<FilterSoodVzianControler>().endMonth.value, Get.find<FilterSoodVzianControler>().endDay.value),
                            Utils.headSoozVzianDetail.toString(),
                            soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldCodJac.toString(),
                            soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldCodLfac.toString(),
                            soodVzianController.soodVzianDetailModel.value.soodZianDetailsList![index].fldTifLfac.toString());
                        showLoading(wi, he);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom:soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.04:0,
                          right: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.015:0,
                          left: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.015:0),
                      // color: index.isEven ? Colors.white70  : Colors.blue.shade50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.08:0),
                              bottomLeft: Radius.circular(soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? wi*0.08:0)),
                          color: soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? Colors.white : Colors.grey.shade200,
                          boxShadow: [
                            soodVzianController.soodVzianDetailModel_fake.value[index].cfs!.length>9? BoxShadow(color: Colors.grey.shade400,offset: Offset(0,2) , spreadRadius: 1.5,blurRadius: 3)
                                :BoxShadow()
                          ]
                      ),
                      child: Row(children: [
                        Expanded(flex: 5,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodVzianController.soodVzianDetailModel_fake.value[index].cfs.toString().toLowerCase()=="null"?"---":soodVzianController.soodVzianDetailModel_fake.value[index].cfs.toString(),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12),),)),
                        SizedBox(width:1,),
                        Expanded(flex: 6,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodVzianController.soodVzianDetailModel_fake.value[index].fldTifLfac.toString().toLowerCase()=="null"?"----":soodVzianController.soodVzianDetailModel_fake.value[index].fldTifLfac.toString(),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12)),)),
                        SizedBox(width: 1,),
                        Expanded(flex: 4,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(setFormatNumber(soodVzianController.soodVzianDetailModel_fake.value[index].fldPrcAcc.toString()),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12)),)),
                      ],),
                    ),
                  );

                },

              );}
          ),
        ),
      ],

    );
  }
  Widget _bottomSheet(double wi , double he , RxInt selectorR ){

    var s_c = Get.find<SoodVzianController>();
    return  Container(
        width: wi,
        child: ListView.builder(itemCount: s_c.title_s_d.length,
        itemBuilder: (context , index){
          return Obx((){
            return Container(
              child:RadioListTile<int>(title: Text(s_c.title_s_d[index].toString()),value: index,onChanged: (value){selectorR.value= value!;
              s_c.getupdateList(s_c.title_s_d[index].toString()).then((value) {
                Get.back();
                Get.to(()=>SoodVzianDetailScreen());
              });
                },groupValue: selectorR.value,)
            );}
          );
        },
        )
      );

  }
}
