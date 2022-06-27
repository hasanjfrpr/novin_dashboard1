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
    SplashController controller =
        Get.put(SplashController(), tag: "SplashController");
    // controller.goNexScreen();
    double wi = Get.width;
    double he = Get.height;

    return Scaffold(
      backgroundColor: Color(AppColor.primaryColor),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Center(
          //           child: (Lottie.asset("assets/welcome.json" ,
          //           fit: BoxFit.fitHeight,
          //           width: wi*0.8,
          //           height: he*0.6,
          //           controller: controller.lottieController,
          //             onLoaded: (composition){
          //             controller.lottieController
          //                 ..duration = composition.duration
          //                 ..forward().whenComplete(() {
          //                  controller.showLoading.value = true;
          //                  controller.goNexScreen();
          //                 });
          //             }
          //           )),
          //         ),
          // Align(alignment: Alignment.bottomCenter,child: Obx(
          //         (){return Container(
          //       margin: EdgeInsets.symmetric(vertical: wi*0.08),
          //       child: Visibility(visible: controller.showLoading.value,child:
          //       CircularProgressIndicator(color: Colors.white,)
          //         ,),
          //     );}
          // )),

          Container(
            width: wi * .4,
            height: he * 0.2,
            child: Hero(
                tag: "logoHero",
                child: Image.asset(
                  "assets/images/novin.png",
                  color: Color(AppColor.onPrimaryColor),
                  fit: BoxFit.contain,
                )),
          ),
          SizedBox(
            height: he * 0.02,
          ),
          Text(
            AppString.hoshMandNovin,
            style: TextStyle(
                color: Color(AppColor.onPrimaryColor),
                fontSize: wi * .05,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: he * 0.01,
          ),
          Text(
            AppString.novinDes,
            style: TextStyle(
                color: Color(AppColor.onPrimaryColor).withOpacity(0.5),
                fontSize: wi * .035,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: he * 0.01,
          ),
          Text(
            AppString.novinSiteAddress,
            style: TextStyle(
                color: Color(AppColor.onPrimaryColor),
                fontSize: wi * .035,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: he * 0.02,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Lottie.asset("assets/loading.json", width: 50, height: 50,
                onLoaded: (composition) {
                  controller.lottieController
                    ..duration = composition.duration
                    ..forward().whenComplete(() {
                      controller.goNexScreen();
                    });
                }),
          )

          // Align(alignment: Alignment.bottomCenter,child: Obx(
          //    (){return Container(
          //      margin: EdgeInsets.symmetric(vertical: wi*0.08),
          //      child: Visibility(visible: controller.showLoading.value,child:
          //        CircularProgressIndicator(color: Colors.white,)
          //        ,),
          //    );}
          //  )),
        ]),
      ),
    );
  }
}
