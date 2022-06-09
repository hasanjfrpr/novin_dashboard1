import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/AsnadNaqesController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/FilterSoodVzianController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';


class AsnadNaqesScreen extends StatelessWidget {
  const AsnadNaqesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    Get.put(AsnadNaqesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("اسناد ناقص "),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: OrientationBuilder(builder:(context , orientation)=> orientation == Orientation.portrait ? _portraitView(wi, he , Get.find<FilterSoodVzianControler>() ) :
      _landScapeView(Get.find<FilterSoodVzianControler>() ) ),
    );
  }
  Widget _portraitView(double wi , double he , FilterSoodVzianControler filterController){


    var soodZianList = filterController.soodVzianModel.value.soodZianListO!;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(flex: 2,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("شماره سند",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
              SizedBox(width: 1,),
              Expanded(flex: 4,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("عنوان",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
           ],),
            Container(
              padding: EdgeInsets.only(bottom: he*0.08),
              margin: EdgeInsets.only(bottom: he*0.04),
              width: wi,
              height: he,
              child: ListView.builder(itemCount: soodZianList.docswithproblemlist!.length,itemBuilder: (context , index){
                return Container(
                  color: index.isEven ? Colors.white70 : Colors.blue.shade50,
                  child: Row(children: [
                    Expanded(flex: 2,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.docswithproblemlist![index].fldDonoDoc.toString().toLowerCase()=="null"?"---":soodZianList.docswithproblemlist![index].fldDonoDoc.toString(),style: TextStyle(fontWeight: FontWeight.bold),),)),
                    SizedBox(width: 1,),
                    Expanded(flex: 4,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.docswithproblemlist![index].fldTozihat.toString().toLowerCase()=="null"?"----":soodZianList.docswithproblemlist![index].fldTozihat.toString(),style: TextStyle(fontWeight: FontWeight.bold)),)),
                  ],),
                );
              },),
            )
          ],
        ),
      ),
    );
  }

  Widget _landScapeView(FilterSoodVzianControler filterController){
    double he = Get.width;
    double wi = Get.height;

    var soodZianList = filterController.soodVzianModel.value.soodZianListO!;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(flex: 2,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("شماره سند",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
              SizedBox(width: 1,),
              Expanded(flex: 4,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("عنوان",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
            ],),
            Container(
              width: he,
              height: wi,
              child: ListView.builder(itemCount: soodZianList.docswithproblemlist!.length,itemBuilder: (context , index){
                return Container(
                  color: index.isEven ? Colors.white70 : Colors.blue.shade50,
                  child: Row(children: [
                    Expanded(flex: 2,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.docswithproblemlist![index].fldDonoDoc.toString().toLowerCase()=="null"?"---":soodZianList.docswithproblemlist![index].fldDonoDoc.toString(),style: TextStyle(fontWeight: FontWeight.bold),),)),
                    SizedBox(width: 1,),
                    Expanded(flex: 4,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.docswithproblemlist![index].fldTozihat.toString().toLowerCase()=="null"?"----":soodZianList.docswithproblemlist![index].fldTozihat.toString(),style: TextStyle(fontWeight: FontWeight.bold)),)),
                  ],),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
