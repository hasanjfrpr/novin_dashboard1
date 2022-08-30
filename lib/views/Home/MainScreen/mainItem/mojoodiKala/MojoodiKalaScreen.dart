import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MojodiController/FilterMojoodiController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MojodiController/MojoodiKalaController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class MojoodikalaScreen extends StatelessWidget {
  const MojoodikalaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    MojoodiController controller =Get.put(MojoodiController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppString.mojodiKala),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: OrientationBuilder(
          builder: (context, orientation) => orientation==Orientation.portrait? _portraitView(wi , he ,Get.find<FilterMojoodiController>()) : _landView(wi,he,Get.find<FilterMojoodiController>()) ),


    );

  }
  Widget _portraitView(double wi , double he , FilterMojoodiController controller){

    return GestureDetector(
      onTap: (){ FocusManager.instance.primaryFocus!.unfocus(); },
      child: Column(
        children: [
        Expanded(child: _searchBox(wi, he),flex: 2,),
        Expanded(child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.only(bottom: wi*0.04),
                height: he,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(children: [
                        Container(width: wi*0.6 ,height: he*0.065,child: Text("عنوان" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("موجودی" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("معدل فی موجودی" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("مبلغ" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                      ],),
                    ),
                    Expanded(
                      flex: 18,
                      child: Container(
                        width: 5*0.3*wi,
                        height: he,
                        margin: EdgeInsets.only(bottom: wi*0.35),
                        color: Colors.grey,
                        child: Obx((){
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context , index){
                            return Container(
                              color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                              child: Row(children: [
                                Container(padding:EdgeInsets.all(wi*0.02),width: wi*0.6 ,child: Text(controller.mojoodiList.value[index].fldtiflfac.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                                Divider(color: Colors.black12),
                                Container(padding:EdgeInsets.all(wi*0.02),width: wi*0.3 ,child: Text(controller.mojoodiList.value[index].qtymoged.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                                Divider(color: Colors.black12,),
                                Container(padding:EdgeInsets.all(wi*0.02),width: wi*0.3 ,child: Text(setFormatNumber(controller.mojoodiList.value[index].avmoged.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),
                                Divider(color: Colors.black12,),
                                Container(padding:EdgeInsets.all(wi*0.02),width: wi*0.3 ,child: Text(setFormatNumber(controller.mojoodiList.value[index].prcmoged.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black12))),),


                              ],),
                            );

                          }, itemCount: controller.mojoodiList.value.length,);}
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            )
        ),flex: 25,)
        ],
      ),
    );


  }

  Widget _searchBox(double wi, double he) {
    return Container(
      width: wi,
      height: he * 0.08,
      margin: EdgeInsets.symmetric( horizontal: wi*0.04,vertical: he * 0.004),
      child: TextField(

        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: "جستجو بر اساس عنوان",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
        ),
        onChanged:(value){  Get.find<FilterMojoodiController>().searchMojoodi(value);} ,
      ),
    );
  }

  Widget _landView(double wi , double he , FilterMojoodiController controller ){
    var listTaraz = controller.mojoodiList;
    return GestureDetector(
      onTap: (){ FocusManager.instance.primaryFocus!.unfocus(); },
      child: Column(
        children: [
          Expanded(child: _searchBox(Get.width, Get.height),flex: 6,),
          Expanded(child:  Container(
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
                      Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("عنوان",style: TextStyle(color: Colors.white),),) , flex: 3,),
                      Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("موجودی",style: TextStyle(color: Colors.white),),) , flex: 2,),
                      Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("معدل فی موجودی",style: TextStyle(color: Colors.white),),) , flex: 2,),
                      Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("مبلغ",style: TextStyle(color: Colors.white),),) , flex: 2,),




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
                        return  Container(

                          color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                          child: Row(children: [
                            Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(listTaraz.value[index].fldtiflfac.toString(), style: TextStyle(color:Colors.black)),) , flex: 3,),
                            Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].qtymoged.toString()), style: TextStyle(color:Colors.black),),) , flex: 2,),
                            Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].avmoged.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),
                            Expanded(child: Container(padding: EdgeInsets.all(wi*0.02),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz.value[index].prcmoged.toString()), style: TextStyle(color:Colors.black)),) , flex: 2,),

                          ],),
                        );
                      }, itemCount: listTaraz.length,);}
                    ),
                  ),
                )
              ],
            ),
          ),flex: 25,)
        ],
      ),
    );



  }
}
