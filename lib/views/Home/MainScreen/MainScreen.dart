import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/DataAsset/server/http/HttpReq.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MainController.dart';
import 'package:novin_dashboard1/controllers/splashController/SplashController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Daramad/FilterDaramadScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/Hazine/FilterHazineScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/ashKhasList/AshKhasList.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/asnadList/FilterAsnadScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/FilterBedBesScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/FilterFactorForoosh.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/mojoodiKala/MojodiFilterScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/FilterSoodVzianScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/tarazAzmayeshi/FilterTarazScreen.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {


    if(controller.imgList.value.length ==0){
      controller.onIn();
    }

    // Future.delayed(Duration(milliseconds: 5000)).then((value) {
    //   Get.dialog(
    //     AlertDialog(
    //       content: const Text('آیا مایل به اجرای راهنمای برنامه هستید؟'),
    //       actions: [
    //         TextButton(
    //           child: const Text("خیر"),
    //           onPressed: () => Get.back(),
    //         ),
    //         TextButton(
    //           child: const Text("بله"),
    //           onPressed: () {
    //             Get.back();
    //             ShowCaseWidget.of(context)!.startShowCase([controller.factorForooshKey , controller.taraz , controller.asnad , controller.soodVzian , controller.ashkhas , controller.bedBes , controller.anbar , controller.hazine , controller.daramad]);
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // });

    
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      body: ShowCaseWidget(
          builder: Builder(
              builder : (context)=> NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[

              SliverAppBar(
                expandedHeight: he * .25,
                floating: false,
                elevation: 0,
                backgroundColor: Colors.white,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Obx(() {
                      return CarouselSlider.builder(
                          itemCount:controller.imgList.value.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return controller.imgList.value.length != 0
                                ? InkWell(
                                 onTap: (){
                                   _loadUrl(controller.imgList.value[itemIndex].link);
                                     },
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: he * .008),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(AppColor.borderColor),
                                                spreadRadius: 4,
                                                blurRadius: 12,
                                                offset: Offset(2, 0))
                                          ],
                                          image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .imgList.value[itemIndex].img!),
                                              fit: BoxFit.fill),
                                          borderRadius: BorderRadius.circular(15)),
                                    ),
                                )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                          options: CarouselOptions(
                            height: he * .25,
                            viewportFraction: 0.96,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ));
                    })),
              )
            ];
          },
          body: Container(
            margin: EdgeInsets.symmetric(vertical: he*0.005),
            child: GridView.builder(
                  itemCount: controller.mainItemList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: he*0.01,

                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: (){
                        ShowCaseWidget.of(context)?.startShowCase([controller.keyList[index]]);
                      },
                      onTap: (){
                        _ontabClickItem(controller.mainItemList[index].id!);
                      },

                        child: Container(
                          child: Column(
                            children: [
                              Showcase(
                                key: controller.keyList[index],
                                description:controller.descriptionList[index],
                                // descTextStyle: TextStyle(color: Colors.white),
                                title: controller.mainItemList[index].name!,
                                textColor: Colors.white,
                               blurValue: 2.3,
                                overlayColor: Colors.white10,
                                showcaseBackgroundColor: Color(AppColor.primaryColor),

                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(wi*0.15)),
                                  child: Container(
                                    padding: EdgeInsets.all(wi*.04),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(wi*0.15)),
                                        border:Border.all(color: Color(AppColor.primaryColor),width: wi*0.005)),
                                      child: Image.asset(
                                    controller.mainItemList[index].imagePath!,
                                    fit: BoxFit.cover,
                                    color: Color(AppColor.primaryColor),
                                    width: wi * 0.15,
                                    height: wi * 0.15,
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: he * .01,
                              ),
                              Text(
                                controller.mainItemList[index].name!,
                                style: TextStyle(fontSize: wi*0.035,
                                    color:
                                        Color(AppColor.primaryColor).withOpacity(0.8),
                                    fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
                    );
                  }),
          ),
          )
      ),
      ),
    );
  }

  void _loadUrl(String? link) async{
    if( await canLaunch(link!)){
      await launch(link);
    }else
      Get.snackbar("مشکل در برقراری ارتباط..","",snackPosition: SnackPosition.BOTTOM);
  }

  void _ontabClickItem(int index) {
    switch(index){
      case 0:
        Get.to(FilterFactorForooshScreen());
        break;
      case 1:
        Get.to(FilterTarazScreen());
        break;
      case 2 :
        Get.to(FilterAsnadScreen());
        break;
      case 3:
        Get.to(FilterSoodVzianScreen());
        break;
      case 4:
       controller.getPersonList(0);
        showLoading(Get.width, Get.height ,title: "درحال دریافت لیست اشخاص");
        break;
      case 5:
        controller.getPersonList(1);
        showLoading(Get.width, Get.height ,title: "درحال دریافت لیست اشخاص");
        break;
      case 6:
        Get.to(FilterMojoodiScreen());
        break;
      case 7:
        Get.to(FilterHazineScreen());
        break;
      case 8:
        Get.to(FilterDaramadScreen());
        break;

    }
  }

}
