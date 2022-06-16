import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:novin_dashboard1/controllers/splashController/SplashController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

   //Get.lazyPut(() => SplashController());
    SplashController controller = Get.put(SplashController(),tag: "SplashController" , permanent: true);

    double wi = Get.width;
    double he = Get.height;


    return Scaffold(
      backgroundColor: Color(AppColor.primaryColor),
      body:  Container(
        child: Stack(
          children:[ Center(
                      child: (Lottie.asset("assets/welcome.json" ,
                      controller: controller.lottieController,
                        onLoaded: (composition){
                        controller.lottieController
                            ..duration = composition.duration
                            ..forward().whenComplete(() {
                             controller.showLoading.value = true;
                             controller.goNexScreen();
                            });
                        }
                      )),
                    ),

            Align(alignment: Alignment.bottomCenter,child: Obx(
               (){return Container(
                 margin: EdgeInsets.symmetric(vertical: wi*0.08),
                 child: Visibility(visible: controller.showLoading.value,child:
                   CircularProgressIndicator(color: Colors.white,)
                   ,),
               );}
             )),
          ]
        ),
      ),

               // Align(alignment: Alignment.bottomCenter,child: Obx(
               //    (){return Container(
               //      margin: EdgeInsets.symmetric(vertical: wi*0.08),
               //      child: Visibility(visible: controller.showLoading.value,child:
               //        CircularProgressIndicator(color: Colors.white,)
               //        ,),
               //    );}
               //  )),


              // Container(
              //   width: wi * .4,
              //   height: he * 0.2,
              //   child: Hero(
              //   tag: "logoHero",
              //       child: Image.asset("assets/images/novin.png",color: Color(AppColor.onPrimaryColor),)),
              // ),
              // SizedBox(height: he*0.015,),
              // Text(AppString.hoshMandNovin , style: TextStyle(color: Color(AppColor.onPrimaryColor),fontSize: wi*.05,fontWeight: FontWeight.bold),),
              // SizedBox(height: he*0.01,),
              // Text(AppString.novinDes , style: TextStyle(color: Color(AppColor.onPrimaryColor).withOpacity(0.5),fontSize: wi*.035,fontWeight: FontWeight.bold),),
              // SizedBox(height: he*0.01,),
              // Text(AppString.novinSiteAddress , style: TextStyle(color: Color(AppColor.onPrimaryColor),fontSize: wi*.035,fontWeight: FontWeight.bold),),
              // SizedBox(height: he*0.015,),
              // CircularProgressIndicator(color: Color(AppColor.onPrimaryColor),)

    );
  }
}
