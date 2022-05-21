

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/FilterTarazController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazKollv3Controller.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazMoeinController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class TarazKolLv3Screen extends StatelessWidget {
  String tif;
   TarazKolLv3Screen({Key? key , required this.tif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;

    TarazKolLv3Controller lv3controller = Get.put(TarazKolLv3Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text(" تراز دفتر تفضیلی "+"("+"$tif"+")"),
        backgroundColor: Color(AppColor.primaryColor),
        actions: [GestureDetector(onTap: (){_showTotalDialog(wi,he,Get.find<TarazMoienController>());},child: Icon(CupertinoIcons.doc_text)),SizedBox(width: 16,)],
      ),
      body:OrientationBuilder(builder:(context, orientation) => orientation == Orientation.portrait ? _portraitView(wi , he  ,Get.find<TarazMoienController>(),Get.find<FilterTarazController>() , lv3controller ) : _landView(wi , he  ,Get.find<TarazMoienController>(),Get.find<FilterTarazController>() , lv3controller)) ,);

  }
  Widget _portraitView(double wi , double he , TarazMoienController controller , FilterTarazController controllers , TarazKolLv3Controller lv3controller ){
    var listTaraz = controller.tarazKolLv3List;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: he,
            child: Column(

              children: [
                Expanded(
                  child: Row(children: [
                    Container(width: wi*0.6 ,height: he*0.05,child: Text("حساب" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                    InkWell(onTap: (){controller.sortable("sbed");},child: Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),)),
                    InkWell(onTap: (){controller.sortable("sbes");},child: Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),)),
                    InkWell(onTap: (){controller.sortable("bed");},child: Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),)),
                    InkWell(onTap: (){controller.sortable("bes");},child: Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),)),


                  ],),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    width: 6*0.3*wi,
                    height: he,
                    color: Colors.grey,
                    child: Obx((){
                      return ListView.builder(itemBuilder: (context , index){
                        return InkWell(
                          onTap: (){
                            lv3controller.getTarazKolLv4(convertJtoGDate(
                                controllers.year.value, controllers.month.value,
                                controllers.day.value),
                                convertJtoGDate(
                                    controllers.endYear.value, controllers.endMonth.value,
                                    controllers.endDay.value), listTaraz.value[index].fldscrhead! , listTaraz.value[index].fldparentid! , listTaraz.value[index].fldcodlfac!,
                            listTaraz[index].tif!);
                            showLoading(wi, he);
                          },
                          child: Row(children: [
                            Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04,vertical: wi*0.03),width: wi*0.6 ,height: he*0.07,child: Text(listTaraz[index].tif.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz.value[index].sbed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz.value[index].sbes.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz.value[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.07,child: Text(setFormatNumber(listTaraz.value[index].bes.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                          ],),
                        );
                      }, itemCount: listTaraz.value.length,);}
                    ),
                  ),
                ),




              ],
            ),
          ),
        )
    );



  }
  void _showTotalDialog(double wi , double he , TarazMoienController fContoller){
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(side:BorderSide(width: 2 , color: Color(AppColor.primaryColor)) ,borderRadius: BorderRadius.only(topRight:Radius.circular(wi*0.08),bottomLeft: Radius.circular(wi*0.08))),
      content: Container(
        decoration: BoxDecoration(),
        width: wi,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Text("مجموع بدهکار(گردش) :"),title:Text(setFormatNumber(fContoller.s_bed.toString()) , style: TextStyle(color: Colors.green),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بدهکار(گردش) :"),title:Text(setFormatNumber(fContoller.s_bes.toString()), style: TextStyle(color: Colors.redAccent),) ,),
            Divider(height: 4,),
            ListTile(leading: Text(" مجموع بدهکار :"),title:Text(setFormatNumber(fContoller.bed.toString()), style: TextStyle(color: Colors.green),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بستانکار :"),title:Text(setFormatNumber(fContoller.bes.toString()), style: TextStyle(color: Colors.redAccent),) ,),
          ],
        ),
      ),
    ));
  }

  Widget _landView(double wi , double he , TarazMoienController controller , FilterTarazController controllers , TarazKolLv3Controller lv3controller){
    var listTaraz = controller.tarazKolLv3List;

    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height*.15,
              color: Colors.blue,
              child: Row(children: [
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("حساب",style: TextStyle(color: Colors.white),),) , flex: 3,),
                 Expanded(child: InkWell(onTap: (){controller.sortable("sbed");},child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بدهکار(گردش)",style: TextStyle(color: Colors.white),),)) , flex: 2,),
                 Expanded(child: InkWell(onTap: (){controller.sortable("sbes");},child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بستانکار(گردش)",style: TextStyle(color: Colors.white),),)) , flex: 2,),
                 Expanded(child: InkWell(onTap: (){controller.sortable("bed");},child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بدهکار",style: TextStyle(color: Colors.white),),)) , flex: 2,),
                 Expanded(child: InkWell(onTap: (){controller.sortable("bes");},child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بستانکار",style: TextStyle(color: Colors.white),),)) , flex: 2,),

              ],),

            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: Get.width,
              height: Get.height*0.85,
              child: Obx((){
                return ListView.builder(itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      lv3controller.getTarazKolLv4(convertJtoGDate(
                          controllers.year.value, controllers.month.value,
                          controllers.day.value),
                          convertJtoGDate(
                              controllers.endYear.value, controllers.endMonth.value,
                              controllers.endDay.value), listTaraz[index].fldscrhead! , listTaraz[index].fldparentid! , listTaraz[index].fldcodlfac!,
                          listTaraz[index].tif!);
                      showLoading(wi, he);
                    },
                    child: Container(
                      height: Get.height*0.1,
                      color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                      child: Row(children: [
                        Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(listTaraz.value[index].tif.toString(), style: TextStyle(color:Colors.black),),) , flex: 3,),
                        Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].sbed.toString()), style: TextStyle(color:Colors.black),),) , flex: 2,),
                        Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].sbes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),
                        Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].bed.toString()), style: TextStyle(color:Colors.black)),) , flex: 2,),
                        Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].bes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),

                      ],),
                    ),
                  );
                }, itemCount: listTaraz.length,);}
              ),
            ),
          )
        ],
      ),
    );
  }
}
