import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AshkhasController/AshkhasController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AshKhasListScreen extends StatelessWidget {
  const AshKhasListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    MainController controller = Get.find<MainController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.personsList),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: controller.personListModel.value.personList!.isEmpty
          ? emptyScreen(wi, he)
          : Container(
        width: wi,
        height: he,
        child: Column(
          children: [
            Expanded(child: _searchBox(wi, he, controller)),
            Expanded(
                flex: 11,
                child: Container(
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.personListModel.value.personList?.length,
                        itemBuilder: (context, int index) {
                          return _items(wi, he, index, controller);
                        });

                  }
                  ),
                )),
          ],
        )
      ),
    );
  }
  Widget _searchBox(double wi, double he, MainController controller) {
    return Container(
      width: wi,
      height: he * 0.05,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.004),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: AppString.searchFactorF,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
        ),
        onChanged:(value){} ,
      ),
    );
  }

  Widget _items(double wi, double he, int index , MainController controller) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      width: wi,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(2, 2))
      ],
          color: Colors.white70.withOpacity(0.25),
          border: Border(right: BorderSide(color:  Color(AppColor.primaryColor),width: wi*0.0145))
      ),
      margin: EdgeInsets.only(bottom: he * 0.02 , left: wi*0.04,right: wi*0.04),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(controller.personListModel.value
                .personList?[index].fldTifLfac!.toLowerCase()=="null" ? "فاقد نام" : "${controller.personListModel.value
                .personList?[index].fldTifLfac}"),
            iconColor: Color(AppColor.primaryColor),
            children: [
              _itemRow(AppString.personName, controller.personListModel.value.personList![index].fldNmmfPer.toString()),
              InkWell(onTap: (){ if(controller.personListModel.value.personList![index].fldphn1per.toString().toLowerCase() != "null") UrlLauncher.launch("tel://${controller.personListModel.value.personList![index].fldphn1per}");},child: _itemRow(AppString.phoneNumber1, controller.personListModel.value.personList![index].fldphn1per.toString() ,isPhoneNumber:true)),
              InkWell(onTap: (){if(controller.personListModel.value.personList![index].fldphn2per.toString().toLowerCase() != "null") UrlLauncher.launch("tel://${controller.personListModel.value.personList![index].fldphn2per}");},child: _itemRow(AppString.phoneNumber2, controller.personListModel.value.personList![index].fldphn2per.toString(),isPhoneNumber:true)),
              _itemRow(AppString.address, controller.personListModel.value.personList![index].fldadfper.toString()),

            ],
          ),
          _itemRow(AppString.codehesab,controller.personListModel.value.personList![index].cfs.toString() ),




        ],
      ),
    );
  }

  Widget _itemRow(String rowName , String value , {bool isPhoneNumber=false}){
    if(value.toLowerCase() == "null") value="----";

    return Container(
      margin: EdgeInsets.symmetric(horizontal:Get.width*0.04, vertical: Get.height*0.005 ),
      child: Row(
        children: [
          Expanded(flex:1,child: Text(rowName+" :  "  , style: TextStyle(fontWeight: FontWeight.bold),)),
          Expanded(flex:3,child: Text(value , style: TextStyle(color: isPhoneNumber ? Colors.blue : Colors.black87),overflow: TextOverflow.clip,))
        ],
      ),
    );
  }
}
