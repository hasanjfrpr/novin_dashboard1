

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/TarazController/FilterTarazController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';

class TarazScreen extends StatelessWidget {
  const TarazScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    FilterTarazController controller = Get.find<FilterTarazController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.tarazAzmayeshi),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation==Orientation.portrait? _portraitView(wi , he , controller) : _landView() ),


    );

  }
  Widget _portraitView(double wi , double he , FilterTarazController controller){
    var listTaraz = controller.tarazKolModel.value.tarazAzmayeshiKolList!;
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
                    color: Colors.grey,
                    child: ListView.builder(itemBuilder: (context , index){
                      return Row(children: [
                        Container(width: wi*0.6 ,height: he*0.05,child: Text(listTaraz[index].tif.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.05,child: Text(listTaraz[index].sbed.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.05,child: Text(listTaraz[index].sbes.toString() , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.05,child: Text(listTaraz[index].bed.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                        Divider(color: Colors.black12,),
                        Container(width: wi*0.3 ,height: he*0.05,child: Text(listTaraz[index].bes.toString() , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),

                      ],);
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

  Widget _landView(){
    return Container();
  }

}
