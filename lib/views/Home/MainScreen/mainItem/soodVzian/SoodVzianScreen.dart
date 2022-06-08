import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/FilterSoodVzianController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/SoodVzianController/SoodVzianController.dart';


import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/AdamMoojodiScreen.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/soodVzian/AsnadNaqesScreen.dart';


class SoodVzianScreen extends StatelessWidget {
  const SoodVzianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    SoodVzianController soodVzianController = Get.put(SoodVzianController());
    FilterSoodVzianControler fController = Get.find<FilterSoodVzianControler>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.sodVzian),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      bottomNavigationBar: Container(
        width: wi,
        height: he*0.07,
        child: Row(
          children: [
            Expanded(child:Container(width: wi,height: he,color: Colors.green.shade100,child: MaterialButton(onPressed: (){Get.to(AdamMojoodiScreen());},child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("عدم موجودی    "), Container(padding: EdgeInsets.all(wi*0.015),decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.015),color: fController.soodVzianModel.value.soodZianListO!.zeroQuantityList!.length<1?Colors.redAccent :Color(AppColor.primaryColor)),child: Text(fController.soodVzianModel.value.soodZianListO!.zeroQuantityList!.length.toString(),style: TextStyle(color: Color(AppColor.onPrimaryColor)),))],)))),
            Expanded(child:Container(width:wi,height: he,color: Colors.blueGrey.shade100,child: MaterialButton(onPressed: (){Get.to(AsnadNaqesScreen());},child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("اسناد ناقص    "), Container(padding: EdgeInsets.all(wi*0.015),decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.015),color: fController.soodVzianModel.value.soodZianListO!.docswithproblemlist!.length<1?Colors.redAccent :Color(AppColor.primaryColor)),child: Text(fController.soodVzianModel.value.soodZianListO!.docswithproblemlist!.length.toString(),style: TextStyle(color: Color(AppColor.onPrimaryColor))))],)))),
          ],
        ),
      ),
      body: OrientationBuilder(builder:(context , orientation)=> orientation == Orientation.portrait ? _portraitView(wi, he , fController, soodVzianController ) :
      _landScapeView(fController , soodVzianController) ),
    );
  }
  Widget _portraitView(double wi , double he , FilterSoodVzianControler filterController , SoodVzianController soodVzianController){


    var soodZianList = filterController.soodVzianModel.value.soodZianListO!;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(flex: 2,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("کد",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor)),),)),
              SizedBox(width: 1,),
              Expanded(flex: 5,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("شرح",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
              SizedBox(width: 1,),
              Expanded(flex: 4,child: Container(height: he*0.053,alignment: Alignment.center,color: Colors.blue,child: Text("مبلغ",style: TextStyle(fontWeight: FontWeight.bold,color: Color(AppColor.onPrimaryColor))),)),
            ],),
            Container(
              padding: EdgeInsets.only(bottom: he*0.08),
              margin: EdgeInsets.only(bottom: he*0.04),
              width: wi,
              height: he,
              child: ListView.builder(itemCount: soodZianList.soodZianList!.length,itemBuilder: (context , index){
                return  InkWell(
                  onTap: (){
                    soodVzianController.getSoodVzianDetail(convertJtoGDate(filterController.year.value,filterController.month.value, filterController.day.value),
                        convertJtoGDate(filterController.endYear.value,filterController.endMonth.value, filterController.endDay.value) , soodZianList.soodZianList![index].hesabFDesc.toString(),soodZianList.soodZianList![index].fldcod.toString(),
                        soodZianList.soodZianList![index].fldScrHead.toString() , soodZianList.soodZianList![index].sort.toString() );
                    showLoading(wi, he);
                  },
                  child: Container(
                    color: index.isEven ? Colors.white70 : Colors.blue.shade50,
                    child: Row(children: [
                      Expanded(flex: 2,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].cfs.toString().toLowerCase()=="null"?"---":soodZianList.soodZianList![index].cfs.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),)),
                      SizedBox(width: 1,),
                      Expanded(flex: 5,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].hesabFDesc.toString().toLowerCase()=="null"?"----":soodZianList.soodZianList![index].hesabFDesc.toString(),style: TextStyle(fontSize: 16)),)),
                      SizedBox(width: 1,),
                      Expanded(flex: 4,child: Container(padding: EdgeInsets.all(wi*0.04),alignment: Alignment.center,child: Text(setFormatNumber(soodZianList.soodZianList![index].fldPrcAcc.toString()),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12)),)),
                    ],),
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }

 Widget _landScapeView(FilterSoodVzianControler filterController, SoodVzianController soodVzianController){
    double he = Get.width;
    double wi = Get.height;

    var soodZianList = filterController.soodVzianModel.value.soodZianListO!;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
              width: he,
              height: wi,
              child: ListView.builder(itemCount: soodZianList.soodZianList!.length,itemBuilder: (context , index){
                return  InkWell(
                  onTap: (){
                    soodVzianController.getSoodVzianDetail(convertJtoGDate(filterController.year.value,filterController.month.value, filterController.day.value),
                        convertJtoGDate(filterController.endYear.value,filterController.endMonth.value, filterController.endDay.value) , soodZianList.soodZianList![index].hesabFDesc.toString(),soodZianList.soodZianList![index].fldcod.toString(),
                        soodZianList.soodZianList![index].fldScrHead.toString() , soodZianList.soodZianList![index].sort.toString() );
                    showLoading(wi, he);
                  },
                  child: Container(
                    color: index.isEven ? Colors.white70 : Colors.blue.shade50,
                    child: Row(children: [
                      Expanded(flex: 2,child: Container(padding: EdgeInsets.all(wi*0.04),height: he*0.08,alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].cfs.toString().toLowerCase()=="null"?"---":soodZianList.soodZianList![index].cfs.toString(),style: TextStyle(fontWeight: FontWeight.bold),),)),
                      SizedBox(width: 1,),
                      Expanded(flex: 6,child: Container(padding: EdgeInsets.all(wi*0.04),height: he*0.08,alignment: Alignment.center,child: Text(soodZianList.soodZianList![index].hesabFDesc.toString().toLowerCase()=="null"?"----":soodZianList.soodZianList![index].hesabFDesc.toString(),style: TextStyle(fontWeight: FontWeight.bold)),)),
                      SizedBox(width: 1,),
                      Expanded(flex: 3,child: Container(padding: EdgeInsets.all(wi*0.04),height: he*0.08,alignment: Alignment.center,child: Text(setFormatNumber(soodZianList.soodZianList![index].fldPrcAcc.toString()),style: TextStyle(fontWeight: FontWeight.bold)),)),
                    ],),
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
