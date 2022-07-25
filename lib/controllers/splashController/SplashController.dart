import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/DataAsset/server/socket/SocketReq.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/model/Login/BookCompanyModel/CompanyBookModel.dart';
import 'package:novin_dashboard1/model/MainModel/sliderModel/SliderModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/ConstValue.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/MainScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/FactorForooshScreen.dart';
import 'package:novin_dashboard1/views/login/Login.dart';
import 'package:http/http.dart' as http;
import 'package:novin_dashboard1/views/splashScreen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late Rx<CompanyBookModel> companyModel = CompanyBookModel().obs;
  static bool isRegister = false;
  bool dataReceived = false;
  ImageProvider? backgroundImage;
  RxBool showLoading = false.obs;
  late AnimationController lottieController ;

  RxString serverMethodName = "".obs;
  RxList<DropdownMenuItem> companyItem = [
    DropdownMenuItem(
      child: Text("خالی"),
      value: "خالی",
    )
  ].obs;
  RxList<DropdownMenuItem> bookItems = [
    DropdownMenuItem(
      child: Text("خالی"),
      value: "خالی",
    )
  ].obs;
  RxString fld_name_company = "".obs;
  RxString fld_code_company = "".obs;

  RxBool showSecondSpinner = false.obs;

  void getCompanyBook() async {
    if (LocalData.getConnectionMethode() == "socket") {
      await SocketManager.request({
        "params": {},
        "username": "",
        "password": "",
        "methodName": "GetBookList",
        "methodType": "get",
      }, (value) {
        var result = CompanyBookModel.fromJson(value);
        companyModel.value = result;
        dataReceived = true;
        companyItem.value.clear();
        for (var i = 0; i < result.companyList!.length; i++) {
          companyItem.value.add(DropdownMenuItem<String>(
            child: Text("${result.companyList![i].fldnmfcomp}"),
            value: "${result.companyList![i].fldnmfcomp}",
          ));
        }

        Get.off(()=>const Login(),duration:const Duration(milliseconds: 725));
      });
    } else {
      await RequestManager()
          .getReq(url: "", body: {}).then((value) => print(value));

      await RequestManager()
          .getReq(url: "tservermethods1/GetBookList ", body: {}).then((value) {
        var result = CompanyBookModel.fromJson(value);
        companyModel.value = result;

        companyItem.value.clear();
        for (var i = 0; i < result.companyList!.length; i++) {
          companyItem.value.add(DropdownMenuItem<String>(
            child: Text("${result.companyList![i].fldnmfcomp}"),
            value: "${result.companyList![i].fldnmfcomp}",
          ));
        }
      }).then((value) => Get.off(()=>Login()));
    }
  }

  void getBook() {
    bookItems.clear();
    for (var h = 0; h < companyModel.value.companyList!.length; h++) {
      if (companyModel.value.companyList![h].fldnmfcomp ==
          fld_name_company.value) {
        // fld_code_company.value = companyModel.value.companyList![i].fLDCODComp!;

        for (var i = 0; i < companyModel.value.bookList!.length; i++) {
          if (companyModel.value.bookList![i].fLDCODComp ==
              companyModel.value.companyList![h].fLDCODComp!) {
            bookItems.value.add(DropdownMenuItem<String>(
              child: Text("${companyModel.value.bookList![i].fldTifBook}"),
              value: "${companyModel.value.bookList![i].fldTifBook}",
            ));
            showSecondSpinner.value = true;
            // ConstValue.bookId = companyModel.value.bookList![i].fldCOdBook;
            // Utils.bookId=companyModel.value.bookList![i].fldCOdBook;

          }
        }
      }
    }
  }




  @override
  void onInit() {
    // precacheImage(new AssetImage("assets/images/splash.jpg") , Get.context!);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    lottieController = AnimationController(vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void goNexScreen() async {
    await LocalData.getSharedInstance().then((value) {
      if (LocalData.getIp() == "" && LocalData.getSerial() == "") {
        Dialogs.showServerSettingDialog(0);
      } else {
        serverMethodName.value = LocalData.getConnectionMethode().toString();
        // Future.delayed(const Duration(seconds: 6)).then((value) => Get.off(()=> const Login() ));
        getCompanyBook();
        Future.delayed(Duration(seconds: 13)).then((value) {
          if (dataReceived == false && LocalData.getConnectionMethode()=="socket") {
            Get.dialog(
                AlertDialog(
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                  backgroundColor: Colors.white,
                  content: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                              "اتصال به سرور برقرار نشد لطفا بعد از اطمینان از اتصال به اینترنت یکی از دو گزینه زیر را برای اتصال مجدد انتخاب کنید."),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Divider(),
                        Container(
                          child: ListTile(
                            onTap: (){
                              restart();
                            },
                              title: Text(
                                "شروع مجدد سرور",
                                style: TextStyle(
                                    color: Color(AppColor.primaryColor)),
                              ),
                              leading: Icon(
                                CupertinoIcons.restart,
                                color: Color(AppColor.primaryColor),
                              )),
                        ),
                        Divider(),
                        Container(
                          child: ListTile(
                            onTap: (){
                              Dialogs.showServerSettingDialog(0);
                            },
                              title: Text(
                                "وارد کردن مجدد سریال یا ip ",
                                style: TextStyle(
                                    color: Color(AppColor.primaryColor)),
                              ),
                              leading: Icon(
                                  CupertinoIcons.arrowshape_turn_up_left_2_fill,
                                  color: Color(AppColor.primaryColor))),
                        ),
                      ],
                    ),
                  ),
                ),
                barrierDismissible: true);
          }
        });
      }
    });
  }
  void restart(){
Get.back();
    if(SocketManager.socket.connected){
      if(isRegister){
        SocketManager.socket.emit("message" , "restart");
        _restarting();

      }else{
        SocketManager.socket.emit("register" ,LocalData.getSerial());
        SocketManager.socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            restart();
          }else{
            return {"register" :  "unAccess"};
          }
        });
      }


    }else{
      SocketManager.socket.connect();
      SocketManager.socket.onConnect((data){
        SocketManager.socket.emit("register" ,LocalData.getSerial());
        SocketManager.socket.once("register", (data){
          if(data["status"]){
            isRegister = true;
            restart();
          }else{
            return {"register" :  "unAccess"};
          }
        });
      });
    }

  }
  void _restarting() {
    Future.delayed(Duration(seconds:10) , (){
     Get.deleteAll(force: true);
     Phoenix.rebirth(Get.context!);
     Get.reset();
    },);
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))),
      content: Container(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children:[ Expanded(flex:3,child: Container(child: Text("عملیات شروع مجدد سرور درحال انجام است لطفا شکیبا باشید..."),)), Expanded(child: CircularProgressIndicator(color: Color(AppColor.primaryColor),))]),
          ],
        ),
      ),),barrierDismissible: false,);
  }

}
