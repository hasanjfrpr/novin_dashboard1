

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/FilterTarazController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class TarazScreen extends StatelessWidget {
  const TarazScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    FilterTarazController controller = Get.find<FilterTarazController>();
    TarazController tarazController = Get.put(TarazController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text("تراز دفتر کل"),
        actions: [GestureDetector(onTap: (){_showTotalDialog(wi,he,controller);},child: Icon(CupertinoIcons.doc_text)),SizedBox(width: 16,)],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation==Orientation.portrait? _portraitView(wi , he , controller , tarazController) : _landView(wi , he , controller , tarazController) ),


    );

  }
  Widget _portraitView(double wi , double he , FilterTarazController controller , TarazController tarazController){
    var listTaraz = controller.listTaraz.value;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
         height: he,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(children: [
                  Container(width: wi*0.6 ,height: he*0.05,child: Text("حساب" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                  Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                  Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار(گردش)" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                  Container(width: wi*0.3 ,height: he*0.05,child: Text("بدهکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                  Container(width: wi*0.3 ,height: he*0.05,child: Text("بستانکار" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),


                ],),
              ),
                Expanded(
                  flex: 18,
                  child: Container(
                    width: 6*0.3*wi,
                    height: he,
                    child: ListView.builder(itemBuilder: (context , index){
                      return InkWell(
                        onTap: (){
                          tarazController.getTaraz(convertJtoGDate(
                              controller.year.value, controller.month.value,
                              controller.day.value),
                              convertJtoGDate(
                                  controller.endYear.value, controller.endMonth.value,
                                  controller.endDay.value), listTaraz[index].fldcodtac.toString(), listTaraz[index].fldscrhead.toString(),listTaraz[index].tif!);
                          showLoading(wi, he);
                        },
                        child: Container(
                          color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                          child: Row(children: [
                            Container(width: wi*0.6 ,height: he*0.05,child: Text(listTaraz[index].tif.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.05,child: Text(setFormatNumber(listTaraz[index].sbed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.05,child: Text(setFormatNumber(listTaraz[index].sbes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.05,child: Text(setFormatNumber(listTaraz[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(width: wi*0.3 ,height: he*0.05,child: Text(setFormatNumber(listTaraz[index].bes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                          ],),
                        ),
                      );
                    }, itemCount: listTaraz.length,),
                  ),
                ),







            ],
          ),
        ),
      )
    );

   // return SingleChildScrollView(
   //   scrollDirection: Axis.horizontal,
   //   physics: ScrollPhysics(),
   //   child: Column(
   //     children: [
   //       Container(
   //         color: Colors.blue,
   //         child: Row(children: [
   //           Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //           Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //           Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //           Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //
   //         ],),
   //       ),
   //        ConstrainedBox(
   //             constraints: BoxConstraints(minWidth: wi  , minHeight: he),
   //             child: ListView.builder(physics: NeverScrollableScrollPhysics(),scrollDirection: Axis.vertical,shrinkWrap: true,itemBuilder: (context ,index){return
   //                 Row(children: [
   //                     Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //                     Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //                     Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //                     Container(width: wi*0.4,height: 30,child: Container(child: Text("ldkjfsl")),),
   //
   //                   ],
   //               );
   //               },itemCount: 3,),
   //           ),
   //
   //
   //     ],
   //   ),
   // );

  }

  Widget _landView(double wi , double he , FilterTarazController controller , TarazController tarazController){
    var listTaraz = controller.listTaraz.value;
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
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بدهکار(گردش)",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بستانکار(گردش)",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بدهکار",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بستانکار",style: TextStyle(color: Colors.white),),) , flex: 2,),




              ],),

            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: Get.width,
              height: Get.height*0.85,
              child: ListView.builder(itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              tarazController.getTaraz(convertJtoGDate(
                                  controller.year.value, controller.month.value,
                                  controller.day.value),
                                  convertJtoGDate(
                                      controller.endYear.value, controller.endMonth.value,
                                      controller.endDay.value), listTaraz[index].fldcodtac.toString(), listTaraz[index].fldscrhead.toString(),listTaraz[index].tif!);
                              showLoading(wi, he);
                            },
                            child: Container(
                              height: Get.height*0.1,
                              color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                              child: Row(children: [
                                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(listTaraz[index].tif.toString(), style: TextStyle(color:Colors.black)),) , flex: 3,),
                                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].sbed.toString()), style: TextStyle(color:Colors.black),),) , flex: 2,),
                                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].sbes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),
                                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].bed.toString()), style: TextStyle(color:Colors.black)),) , flex: 2,),
                                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].bes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),

                              ],),
                            ),
                          );
                        }, itemCount: listTaraz.length,),
            ),
          )
        ],
      ),
    );

  }

  void _showTotalDialog(double wi , double he , FilterTarazController fContoller){
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(side:BorderSide(width: 2 , color: Color(AppColor.primaryColor)) ,borderRadius: BorderRadius.only(topRight:Radius.circular(wi*0.08),bottomLeft: Radius.circular(wi*0.08))),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.06) ,boxShadow: [BoxShadow(color: Colors.white54 , blurRadius: 2,spreadRadius: 2)]),
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

}