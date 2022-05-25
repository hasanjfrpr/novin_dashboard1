import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/FilterTarazController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/TarazMoeinController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class TarazMoienScreen extends StatelessWidget {
  String tif;
   TarazMoienScreen({Key? key,required this.tif}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double wi = Get.width;
    double he = Get.height;
    TarazController controller = Get.find<TarazController>();
    FilterTarazController controllerTa = Get.find<FilterTarazController>();
     TarazMoienController mcontroller = Get.put(TarazMoienController());

    return Scaffold(
      appBar: AppBar(
        title: Text(" تراز دفتر معین "+"("+"$tif"+")"),
        backgroundColor: Color(AppColor.primaryColor),
        actions: [GestureDetector(onTap: (){_showTotalDialog(wi,he,controller);},child: Icon(CupertinoIcons.doc_text)),SizedBox(width: 16,)],
      ),
      body: OrientationBuilder(builder:(context, orientation) => orientation == Orientation.portrait ? _portraitView(wi , he  ,controller,controllerTa ,mcontroller) : _landView(wi , he  ,controller,controllerTa ,mcontroller)) ,);

  }
  Widget _portraitView(double wi , double he , TarazController controller , FilterTarazController controllers , TarazMoienController moienController){
    var listTaraz = controller.tarazMoienList;
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
                    child: Obx((){
                      return ListView.builder(itemBuilder: (context , index){
                        return InkWell(
                          onTap: (){
                            moienController.getTarazKolLv3(convertJtoGDate(
                                controllers.year.value, controllers.month.value,
                                controllers.day.value),
                                convertJtoGDate(
                                    controllers.endYear.value, controllers.endMonth.value,
                                    controllers.endDay.value), listTaraz.value[index].fldcodjac.toString(), listTaraz.value[index].fldscrhead.toString(),listTaraz.value[index].tif!);
                            showLoading(wi, he);
                          },
                          child: Container(
                            color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                            child: Row(children: [
                              Container(padding: EdgeInsets.symmetric(vertical: wi*0.04),width: wi*0.6 ,child: Text(listTaraz.value[index].tif.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                              Divider(color: Colors.black12,),
                              Container(padding: EdgeInsets.symmetric(vertical: wi*0.04),width: wi*0.3 ,child: Text(setFormatNumber(listTaraz.value[index].sbed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                              Divider(color: Colors.black12,),
                              Container(padding: EdgeInsets.symmetric(vertical: wi*0.04),width: wi*0.3 ,child: Text(setFormatNumber(listTaraz.value[index].sbes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                              Divider(color: Colors.black12,),
                              Container(padding: EdgeInsets.symmetric(vertical: wi*0.04),width: wi*0.3 ,child: Text(setFormatNumber(listTaraz.value[index].bed.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                              Divider(color: Colors.black12,),
                              Container(padding: EdgeInsets.symmetric(vertical: wi*0.04),width: wi*0.3 ,child: Text(setFormatNumber(listTaraz.value[index].bes.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),

                            ],),
                          ),
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
  void _showTotalDialog(double wi , double he , TarazController fContoller){
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(side:BorderSide(width: 2 , color: Color(AppColor.primaryColor)) ,borderRadius: BorderRadius.only(topRight:Radius.circular(wi*0.08),bottomLeft: Radius.circular(wi*0.08))),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.06) ,boxShadow: [BoxShadow(color: Colors.white54 , blurRadius: 2,spreadRadius: 2)]),
        width: wi,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Text("مجموع بدهکار(گردش) :" , style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.s_bed.value.toString()) , style: TextStyle(color: Colors.green , fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بستانکار(گردش) :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.s_bes.value.toString()), style: TextStyle(color: Colors.redAccent, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text(" مجموع بدهکار :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.bed.value.toString()), style: TextStyle(color: Colors.green, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بستانکار :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.bes.value.toString()), style: TextStyle(color: Colors.redAccent, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
          ],
        ),
      ),
    ));
  }

  Widget _landView(double wi , double he , TarazController controller , FilterTarazController controllers , TarazMoienController moienController){
    var listTaraz = controller.tarazMoienList;

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
                      moienController.getTarazKolLv3(convertJtoGDate(
                          controllers.year.value, controllers.month.value,
                          controllers.day.value),
                          convertJtoGDate(
                              controllers.endYear.value, controllers.endMonth.value,
                              controllers.endDay.value), listTaraz.value[index].fldcodjac.toString(), listTaraz.value[index].fldscrhead.toString(),listTaraz.value[index].tif!);
                      showLoading(wi, he);
                    },
                    child: Container(
                      color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                      child: Row(children: [
                        Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(listTaraz.value[index].tif.toString(), style: TextStyle(color:Colors.black),),) , flex: 3,),
                        Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].sbed.toString()), style: TextStyle(color:Colors.black),),) , flex: 2,),
                        Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].sbes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),
                        Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].bed.toString()), style: TextStyle(color:Colors.black)),) , flex: 2,),
                        Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].bes.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),

                      ],),
                    ),
                  );
                }, itemCount: listTaraz.value.length,);}
              ),
            ),
          )
        ],
      ),
    );
  }
}

