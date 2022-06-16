import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AsnadListController/AsnadController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class RizAsnadScreen extends StatelessWidget {
  const RizAsnadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    AsnadController asnadController = Get.find<AsnadController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.rizSanad),
      ),
      body: Container(
        width: wi,
        height: he,
        margin:
            EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.01),
        child: ListView.builder(
            itemCount: asnadController.rizAsnad.value.documentDetailsList!.length,
            itemBuilder: (context, index) {
              return _itemSanad(wi, he, index, asnadController);
            }),
      ),
    );
  }


  Widget _itemSanad(double wi , double he, int index , AsnadController fController ){
    return Container(
      width: wi,
      margin: EdgeInsets.only(bottom: he*0.015 , right: wi*0.02 , left: wi*0.02),
      decoration: BoxDecoration(color: Colors.white70.withOpacity(0.25),
          boxShadow: [BoxShadow(color: Colors.grey.shade300,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(2, 2))],
          border:Border(right: BorderSide(color: Color(AppColor.primaryColor) , width: wi*0.02))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04,vertical: wi*0.02),width: wi , alignment: Alignment.center,child:  Text(fController.rizAsnad.value.documentDetailsList![index].fldTifLfac.toString(),overflow: TextOverflow.clip,),),
          Divider(),
          _itemRow(AppString.code, fController.rizAsnad.value.documentDetailsList![index].cfs.toString()),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.bedehkar, setFormatNumber(fController.rizAsnad.value.documentDetailsList![index].bed.toString()),bed: 1),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.bestanKar, setFormatNumber(fController.rizAsnad.value.documentDetailsList![index].bes.toString()),bed: 2),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.description, fController.rizAsnad.value.documentDetailsList![index].fldDsfAcc.toString()),
          SizedBox(height: he*0.006,),



        ],
      ),
    );
  }
  Widget _itemRow(String rowName , String value , {int bed = 0}){
    if(value.toLowerCase() == "null") value="----";
    return Container(
      margin: EdgeInsets.symmetric(horizontal:Get.width*0.04, vertical: Get.height*0.005 ),
      child: Row(
        children: [
          Expanded(flex:1,child: Text(rowName+" :  "  , style: TextStyle(fontWeight: FontWeight.bold),)),
          Expanded(flex:3,child: Text(value , style: TextStyle(color: bed==1 ? Colors.red.withOpacity(0.7) :  bed==2 ? Colors.green.withOpacity(0.7) : Colors.black87),overflow: TextOverflow.clip,) )
        ],
      ),
    );
  }
}
