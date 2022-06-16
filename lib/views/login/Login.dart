import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novin_dashboard1/DataAsset/local/LocalData.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/controllers/LoginController/LoginController.dart';
import 'package:novin_dashboard1/controllers/splashController/SplashController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/HomeScreen.dart';
import 'package:novin_dashboard1/views/splashScreen/SplashScreen.dart';
import 'package:search_choices/search_choices.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';



String? bookNameId;
String? userName;
String? password;


class Login extends StatelessWidget {
   const Login({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    GlobalKey<FormState> _loginFormKey = GlobalKey();

    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
          body:   Container(
                width: wi,
                height: he,
                color: Color(AppColor.primaryColor),
                // decoration: BoxDecoration(
                //   image: DecorationImage(image: AssetImage("assets/images/bbb.jpg"),fit: BoxFit.cover)
                // ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: wi * .3,
                          height: wi*.3,

                          margin: EdgeInsets.only(top: he * .06,bottom: he*0.02),
                          child: Hero(
                              tag: "logoHero",
                              child: Image.asset(
                                "assets/images/novin.png",
                                color: Color(AppColor.onPrimaryColor),
                                fit: BoxFit.contain,
                              )),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: wi,
                        height: he * 0.6,
                        color: Color(AppColor.onPrimaryColor),
                      ),
                    ),
                    Align(alignment: Alignment.bottomCenter ,child:
                      Obx(
                        (){ return loginController.keyboardIsOpen.value ? Text("") : Column(mainAxisSize: MainAxisSize.min,children: [
                          Text("نوع دسترسی " , style: TextStyle(fontSize: 14 , color: Colors.grey),),
                          Text(   Get.find<SplashController>(tag: "SplashController").serverMethodName.value.isEmpty ? LocalData.getConnectionMethode().toString() : LocalData.getConnectionMethode()=="socket"?"${Get.find<SplashController>(tag: "SplashController").serverMethodName.value} : ${LocalData.getSerial()}":"${Get.find<SplashController>(tag: "SplashController").serverMethodName.value} : ${LocalData.getIp()}",style: TextStyle(color: Colors.grey),),
                          SizedBox(height: he*0.03,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: he*0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child:
                                InkWell(splashColor: Color(AppColor.primaryColor),onTap: (){Dialogs.showServerSettingDialog(1);},child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Icon(CupertinoIcons.settings_solid , color: Color(AppColor.primaryColor),),SizedBox(width: wi*0.015,) , Text("تنظیمات سرور",style: TextStyle(fontWeight: FontWeight.bold),)],)),
                                ),
                                Expanded(child:InkWell(onTap: (){
                                  authenticateWithBiometrics().then((value) {
                                    if(value){
                                      if(LocalData.getUsername()=="" || LocalData.getPassword() =="" || LocalData.getBookId() == ""){
                                        Get.snackbar(" خطا ورود",
                                            "برای استفاده از ورود بیومتریک باید حداقل یکبار وارد برنامه شده باشید.",
                                            borderRadius: 15,
                                            backgroundColor: Colors.redAccent,
                                            borderWidth: 1.5,
                                            borderColor: Colors.white,
                                            snackPosition: SnackPosition.BOTTOM,
                                            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                                            colorText: Colors.white);
                                      }else{
                                        print(LocalData.getBookId().toString()+ LocalData.getUsername().toString()+LocalData.getPassword().toString());
                                        loginController.login(LocalData.getBookId().toString(), LocalData.getUsername().toString(), LocalData.getPassword().toString());
                                      }
                                    }else{
                                      // Get.snackbar(" خطا شناسایی اثر انگشت",
                                      //     "لطفا ابتدا اثر انگشت خود را در تظیمات دستگاه خود ثبت کنید.",
                                      //     borderRadius: 15,
                                      //     backgroundColor: Colors.redAccent,
                                      //     borderWidth: 1.5,
                                      //     borderColor: Colors.white,
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                                      //     colorText: Colors.white);
                                    }
                                  });
                                },child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [Icon(Icons.fingerprint , color: Color(AppColor.primaryColor),),SizedBox(width: wi*0.015,) , Text("ورود بیومتریک",style: TextStyle(fontWeight: FontWeight.bold),)],)),
                                )
                              ],
                            ),
                          )
                        ],);}
                      )
                      ) ,
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: wi * 0.85,
                          height: he * .55,
                          margin: EdgeInsets.only(top: he * .007),
                          decoration: BoxDecoration(
                              color: Color(AppColor.onPrimaryColor),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 4,
                                    blurRadius: 2,
                                    offset: Offset(2, 2))
                              ]),
                          child: Obx(() {
                            return _forms(
                                wi,
                                he,
                                Get
                                    .find<SplashController>(tag: "SplashController")
                                    .companyItem
                                    .value,
                                Get
                                    .find<SplashController>(tag: "SplashController")
                                    .bookItems
                                    .value,
                                _loginFormKey,
                                loginController);
                          }),
                        )),

                  ],
                ),
              ),

    );
  }
    Future<bool> authenticateWithBiometrics() async {
    LocalAuthentication localAuthentication = LocalAuthentication();
   bool isBiometricSupported = await localAuthentication.isDeviceSupported();
   bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;


   bool isAuthenticated = false;
try{
      if (isBiometricSupported && canCheckBiometrics) {
        isAuthenticated = await localAuthentication.authenticate(
           authMessages:  const <AuthMessages>[
              AndroidAuthMessages(
                signInTitle: 'درخواست ورود با اثر انگشت',
                cancelButton: 'نه, متشکرم',
                  biometricHint: ""
              ),
              IOSAuthMessages(
                cancelButton: 'نه متشکرم ',
              ),
            ],
            localizedReason: 'ورود توسط اثر انگشت با آخرین اطلاعات ثبت شده',
            options: const AuthenticationOptions(
                useErrorDialogs: false, biometricOnly: true, stickyAuth: true)
        );
      }
    } on PlatformException catch (e) {
  print(e.code);
  if (e.code == auth_error.notEnrolled) {
    // Add handling of no hardware here.
    Get.snackbar(" خطا شناسایی اثر انگشت",
        "لطفا ابتدا اثر انگشت خود را در تظیمات دستگاه خود ثبت کنید.",
        borderRadius: 15,
        backgroundColor: Colors.redAccent,
        borderWidth: 1.5,
        borderColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        colorText: Colors.white);
  } else if (e.code == auth_error.lockedOut ||
      e.code == auth_error.permanentlyLockedOut) {
    Get.snackbar(" خطا شناسایی اثر انگشت",
        "اثرانگشت نامعتبری به تعداد بالا وارد شده است لطفا مدت زمانی صبر کنید و مجدد تلاش کنید",
        borderRadius: 15,
        backgroundColor: Colors.redAccent,
        borderWidth: 1.5,
        borderColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        colorText: Colors.white);
  }

      }

   return isAuthenticated;
   }


}

Widget _forms(double wi, double he, var companyName, var bookName,GlobalKey<FormState> formkey,
    LoginController controller) {

  return Form(
    key: formkey,
    child: ListView(
      children: [
         Container(
            margin: EdgeInsets.symmetric(horizontal: wi * .03),
            child: TextFormField(
              onTap: (){controller.keyboardIsOpen.value = true;},
              controller: controller.userNameControllerTF,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  labelStyle: TextStyle(),
                  prefixIcon: Icon(CupertinoIcons.person),
                  labelText: AppString.userName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Color(AppColor.borderColor), width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Color(AppColor.primaryColor), width: 1.5),
                      gapPadding: 6)),
              validator: (value) {
                if(value!.isEmpty) return AppString.emptyField;
              },
            ),
          ),

        SizedBox(
          height: he * .02,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: wi * .03),
          child: TextFormField(
            onTap: (){controller.keyboardIsOpen.value = true;},
            obscureText: true,
            controller: controller.passwordControllerTF,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(),
                prefixIcon: Icon(Icons.lock_open_sharp),
                labelText: AppString.password,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Color(AppColor.borderColor), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Color(AppColor.primaryColor), width: 1.5),
                    gapPadding: 6)),
            validator: (value) {
              if(value!.isEmpty) return AppString.emptyField;
             },
          ),
        ),
        SizedBox(
          height: Get.height * .02,
        ),
        _searchSpinner(wi, he, companyName, controller),
        SizedBox(
          height: Get.height * .02,
        ),
        Obx(() {
          return Get.find<SplashController>(tag: "SplashController").showSecondSpinner.value
              ? _searchSpinnerBook(wi, he, bookName)
              : Text('');
        }),
        SizedBox(
          height: he * .05,
        ),
        Container(
            margin: EdgeInsets.only(
                left: Get.width * .12, right: Get.width * .06 , bottom: Get.height*0.05),
            child: Obx(
                  () {
                return ProgressButton.icon(iconedButtons: {
                  ButtonState.idle:
                  IconedButton(
                      text: AppString.login,
                      icon:Icon(Icons.login , color: Color(AppColor.onPrimaryColor),),
                      color: Color(AppColor.primaryColor)),
                  ButtonState.loading:
                  IconedButton(
                      text: AppString.loading,
                      color: Color(AppColor.primaryColor)),
                  ButtonState.fail:
                  IconedButton(
                      text: AppString.fail,
                      icon: Icon(Icons.cancel, color: Colors.white),
                      color: Colors.red.shade300),
                  ButtonState.success:
                  IconedButton(
                      text: AppString.success,
                      icon: Icon(Icons.check_circle, color: Colors.white,),
                      color: Colors.green.shade400)
                },
                    onPressed: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  controller.keyboardIsOpen.value = false;
                  if(formkey.currentState!.validate()) {
                    print(controller.userNameControllerTF.text +"   "+ controller.passwordControllerTF.text);
                    controller.buttonStateLogin.value = ButtonState.loading;
                    controller.login(
                        controller.getbookId(bookNameId.toString())
                        , faToEnConvert(controller.userNameControllerTF.text),
                        faToEnConvert(controller.passwordControllerTF.text));
                  }
                    },
                    state:controller.buttonStateLogin.value
                );
              },
            )
        ),
      ],
    ),
  );
}

Widget _searchSpinner(double wi, double he, var CompanyItem,
    LoginController controller ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: wi * .03),
    padding: EdgeInsets.symmetric(horizontal: wi * .05, vertical: he * 0.01),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.borderColor), width: 1),
        borderRadius: BorderRadius.circular(15)),
    child: Obx(() {
      return SearchChoices.single(
        items: CompanyItem,
        value: Get
            .find<SplashController>(tag: "SplashController")
            .fld_name_company
            .value,
        hint: AppString.companyName,
        rightToLeft: true,
        searchHint: null,
        onChanged: (value) {
          Get
              .find<SplashController>(tag: "SplashController")
              .fld_name_company
              .value = value;
          Get.find<SplashController>(tag: "SplashController").getBook();

        },
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      );
    }
    ),
  );
}

Widget _searchSpinnerBook(double wi, double he, var bookItem , ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: wi * .03),
    padding: EdgeInsets.symmetric(horizontal: wi * .05, vertical: he * 0.01),
    decoration: BoxDecoration(
        border: Border.all(color: Color(AppColor.borderColor), width: 1),
        borderRadius: BorderRadius.circular(15)),
    child: SearchChoices.single(
      items: bookItem,
      value: "",
      hint: AppString.bookName,
      rightToLeft: true,
      searchHint: null,
      onChanged: (value) {
        bookNameId = value;

         _getBookId(value);
      },
      dialogBox: false,
      isExpanded: true,
      menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
    ),
  );
}
void _getBookId(var value){
  for(var i=0 ; i<Get.find<SplashController>(tag: "SplashController").companyModel.value.bookList!.length ; i++){
    if(Get.find<SplashController>(tag: "SplashController").companyModel.value.bookList![i].fldTifBook == value){
      Utils.bookId = Get.find<SplashController>(tag: "SplashController").companyModel.value.bookList![i].fldCOdBook;
    }
  }

}

