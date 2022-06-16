
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/FactorForooshController/FactorForooshController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';




class RizFactorScreen extends StatelessWidget {
  const RizFactorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.rizFactors),
        centerTitle: true,
      ),
      body: Container(
        width: wi,
        height: he,
        child: ListView.builder(itemCount:Get.find<FactorForooshController>(tag: "factorForooshController").rizFactorModel.value.factorForooshRizKalaList!.length ,
        itemBuilder: (context , index){
          return _item(wi,he,Get.find<FactorForooshController>(tag: "factorForooshController") ,  index);
        },
        ),
      ),
    );
  }
  Widget _item(double wi , double he , FactorForooshController controller , int index){
    return Container(
      width: wi,
      margin: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: he*0.02),
      decoration:BoxDecoration(
        border: Border(right: BorderSide(
          color: Color(AppColor.primaryColor),
          width: wi*0.02
        )),
        color: Colors.white70.withOpacity(0.4),
        boxShadow: [BoxShadow(color: Colors.black12 , spreadRadius: 2,blurRadius: 2)]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04,vertical: wi*0.02),width: wi , alignment: Alignment.center,child:  Text(controller.rizFactorModel.value.factorForooshRizKalaList![index].fldtiflfac!,overflow: TextOverflow.clip,),),
          Divider(),
          _itemRow(AppString.code, controller.rizFactorModel.value.factorForooshRizKalaList![index].cfs!),
          _itemRow(AppString.count, controller.rizFactorModel.value.factorForooshRizKalaList![index].fldqty1iogds!),
          _itemRow(AppString.fee, setFormatNumber(controller.rizFactorModel.value.factorForooshRizKalaList![index].fldsprciogds!)),
          _itemRow(AppString.discount, setFormatNumber(controller.rizFactorModel.value.factorForooshRizKalaList![index].fLDPrcDISCIOGDS!)),
          _itemRow(AppString.feeAfterDiscount, controller.rizFactorModel.value.factorForooshRizKalaList![index].priceAfterDiscount == null ? "" : setFormatNumber(controller.rizFactorModel.value.factorForooshRizKalaList![index].priceAfterDiscount!)),
          Divider(),
          _itemRow(AppString.price, setFormatNumber(controller.rizFactorModel.value.factorForooshRizKalaList![index].fldtprciogds!)),
        ],
      ),
    );
  }

  Widget _itemRow(String rowName , String value){
    if(value.toLowerCase() == "null") value="----";
    return Container(
      margin: EdgeInsets.symmetric(horizontal:Get.width*0.04, vertical: Get.height*0.005 ),
      child: Row(
        children: [
          Expanded(flex:3,child: Text(rowName+" :  "  , style: TextStyle(fontWeight: FontWeight.bold),)),
          Expanded(flex:4,child: Text(value , style: TextStyle(),overflow: TextOverflow.clip,))
        ],
      ),
    );
  }
}
