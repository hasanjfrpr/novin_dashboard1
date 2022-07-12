import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/AsnadListController/RizAsnadController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class LogInfoScreen extends StatelessWidget {

  const LogInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    RizAsnadController rizAsnadController = Get.find<RizAsnadController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text("ردپای کاربر"),
      ),
      body: Container(
        width: wi,
        height: he,
        child: Obx(
                (){ return ListView.builder(itemCount: rizAsnadController.logInfoModel.value.logInfoList!.length,
                shrinkWrap: true,
                itemBuilder: (  context ,index ){
                  return Container(
                    width: Get.width,
                    height: 200,
                    child: Column(

                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.01),
                          child:Column(
                            children: [
                              Row(children: [Expanded(child: Text("نام : ")) , Expanded(flex:2,child: Text(rizAsnadController.logInfoModel.value.logInfoList![index].fldNmfUser.toString()))],),
                              SizedBox(height: he*0.02,),
                              Row(children: [Expanded(child: Text("نوع : ")) , Expanded(flex:2,child: Text(rizAsnadController.logInfoModel.value.logInfoList![index].kind.toString()))],),
                              SizedBox(height: he*0.02,),
                              Row(children: [Expanded(child: Text("تاریخ : ")) , Expanded(flex:2,child: Text(convertDtoJDate(rizAsnadController.logInfoModel.value.logInfoList![index].datem.toString())))],),

                            ],
                          ),
                        ),
                        SizedBox(height: he*0.06,),
                        index==rizAsnadController.logInfoModel.value.logInfoList!.length-1? Container() : Container(margin: EdgeInsets.symmetric(horizontal: wi*0.4),child: Divider(color: Color(AppColor.primaryColor), height: 1.5,)),
                        index==rizAsnadController.logInfoModel.value.logInfoList!.length-1 ? Container(): Container(child: Icon(Icons.arrow_downward_outlined,color: Color(AppColor.primaryColor)),)

                      ],
                    ),
                  );
                }
            );}
        ),
      ),
    );
  }
}
