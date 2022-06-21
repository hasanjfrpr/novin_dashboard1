
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AsnadListController/AsnadController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AsnadListController/FilterAsnadListController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/RizAsnadScreen.dart';


class AsnadListScreen extends StatelessWidget {
  const AsnadListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi  = Get.width;
    double he  = Get.height;
    FilterAsnadController fController = Get.find<FilterAsnadController>();
    AsnadController asnadController = Get.put(AsnadController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppString.AsnadList),
        backgroundColor: Color(AppColor.primaryColor),
      ),

      body:fController.documentList.isEmpty ? emptyScreen(wi, he):  Container(
        width: wi,
        height: he,
        child: Column(
          children: [
            Expanded(child: _searchBox(wi, he,fController)),
             Expanded(
                  flex: 11,
                  child: Container(
                      child: Obx(
                        (){return ListView.builder(
                          controller: fController.scrollController,
                          itemCount: fController.documentList.value.length,
                          itemBuilder: (context, index) {
                            return _itemSanad(wi, he, index, fController);
                          },
                        );}
                      )
                  )),
            Obx(() {
              return fController.showLoading.value == true
                  ? Padding(
                  padding: EdgeInsets.only(top: 8 , bottom: 8),
                  child: CircularProgressIndicator(
                    color: Color(
                      AppColor.primaryColor,
                    ),
                  ))
                  : Container();
            })
          ],
        ),

      ),
    );
  }

  Widget _searchBox(double wi, double he ,FilterAsnadController fController) {
    return Container(
      width: wi,
      height: he * 0.05,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.004),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: AppString.shomareSanad,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
        ),
        onChanged:(value){fController.searchAsnad(value);} ,
      ),
    );
  }

  Widget _itemSanad(double wi , double he, int index , FilterAsnadController fController ){
    return Container(
      width: wi,
      margin: EdgeInsets.only(bottom: he*0.02 , right: wi*0.03 , left: wi*0.03),
      decoration: BoxDecoration(color: Colors.white70.withOpacity(0.25),
        boxShadow: [BoxShadow(color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(2, 2))],
        border:Border(right: BorderSide(color: Color(AppColor.primaryColor) , width: wi*0.02))
      ),
      child: Column(
        children: [
          _itemRow(AppString.shomareSanad, fController.documentList.value[index].fldCodDoc.toString()),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.date,convertDtoJDate(fController.documentList.value[index].flddodadoc.toString())),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.price,setFormatNumber(fController.documentList.value[index].fldamoudoc.toString())),
          SizedBox(height: he*0.006,),
          _itemRow(AppString.description,fController.documentList.value[index].flddsfdoc.toString()),
          Divider(),
          InkWell(
            onTap: (){
              AsnadController controller = Get.put(AsnadController());
              controller.getRizAsnad(fController.documentList.value[index].fldCodDoc.toString());
              showLoading(wi,he);
            },
            child: Container(
              color: Colors.grey.withOpacity(0.15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.increase_indent , color: Color(AppColor.primaryColor)),
                  SizedBox(width: wi*0.02,),
                  Text(AppString.rizSanad , style: TextStyle(color:  Color(AppColor.primaryColor) ))


                ],
              ),
            ),
          )
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
          Expanded(flex:1,child: Text(rowName+" :  "  , style: TextStyle(fontWeight: FontWeight.bold),)),
          Expanded(flex:3,child: Text(value , style: TextStyle(),overflow: TextOverflow.clip,) )
        ],
      ),
    );
  }
}
