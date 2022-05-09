import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/FilterSoodVzianController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';


class SoodVzianScreen extends StatelessWidget {
  const SoodVzianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.sodVzian),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: OrientationBuilder(builder:(context , orientation)=> orientation == Orientation.portrait ? _portraitView(wi, he , Get.find<FilterSoodVzianControler>()) : _landScapeView() ),
    );
  }
  Widget _portraitView(double wi , double he , FilterSoodVzianControler filterController){
    var soodZianList = filterController.soodVzianModel.value.soodZianLists;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(flex: 2,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("کد",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
              SizedBox(width: 1,),
              Expanded(flex: 6,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("شرح",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
              SizedBox(width: 1,),
              Expanded(flex: 3,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("مبلغ",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
            ],),
            Container(
              padding: EdgeInsets.only(bottom: he*0.08),
              margin: EdgeInsets.only(bottom: he*0.04),
              width: wi,
              height: he,
              child: ListView.builder(itemCount: soodZianList!.soodZianList!.length,itemBuilder: (context , index){
                return  Row(children: [
                  Expanded(flex: 2,child: Container(height: he*0.053,alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].fldcod.toString(),style: TextStyle(fontWeight: FontWeight.bold),),)),
                  SizedBox(width: 1,),
                  Expanded(flex: 6,child: Container(height: he*0.053,alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].hesabEDesc.toString(),style: TextStyle(fontWeight: FontWeight.bold)),)),
                  SizedBox(width: 1,),
                  Expanded(flex: 3,child: Container(height: he*0.053,alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].fldPrcAcc.toString(),style: TextStyle(fontWeight: FontWeight.bold)),)),
                ],);
              },),
            )
          ],
        ),
      ),
    );
  }

 Widget _landScapeView(){
    return Container();
  }
}
