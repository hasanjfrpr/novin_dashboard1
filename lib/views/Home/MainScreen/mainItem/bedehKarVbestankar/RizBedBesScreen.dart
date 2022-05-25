import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/BedBesController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/RizBedBesController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class RizBedBesScreen extends StatelessWidget {

  String? name;

   RizBedBesScreen({Key? key , required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double wi = Get.width;
    double he = Get.height;
    BedBesController controller = Get.find<BedBesController>();
    RizBedBesController rizBedBesController = Get.put(RizBedBesController());




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.rizhesab+"(${name})"),
      ),
      body:OrientationBuilder(builder: (context,orientation){
        return orientation==Orientation.portrait ? Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                      border: TableBorder(verticalInside: BorderSide(color: Colors.black26)),
                      headingRowHeight: he*0.05,

                      columns:  [
                        DataColumn(label: Text("تاریخ سند")),
                        DataColumn(label: Container(width: wi,alignment: Alignment.center,child: Text("شرح" , textAlign: TextAlign.center,)  ) ),
                        DataColumn(label: Text("بدهکار")),
                        DataColumn(label: Text("بستانکار")),
                        DataColumn(label: Text("مانده")),
                      ],
                      rows: getDataRow(controller)
                  ),
                ),
              ),
            ),
          ],
        ) : _landView(wi , he , controller);
        // Row(children: [
        //   Expanded(child:SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: SingleChildScrollView(
        //       scrollDirection: Axis.vertical,
        //       child: Container(
        //         width: he,
        //         height: wi,
        //         child: DataTable(
        //
        //             headingRowColor:
        //             MaterialStateColor.resolveWith((states) => Colors.blue),
        //             border: TableBorder(verticalInside: BorderSide(color: Colors.black26)),
        //             headingRowHeight: he*0.05,
        //             columns:  [
        //               DataColumn(label: Expanded(child: Text("تاریخ سند") ) ),
        //               DataColumn(label: Expanded(child: Container(width: wi,alignment: Alignment.center,child: Text("شرح" , textAlign: TextAlign.center,)  ) , flex: 3,) ),
        //               DataColumn(label: Expanded(child: Text("بدهکار"))),
        //               DataColumn(label: Expanded(child: Text("بستانکار"))),
        //               DataColumn(label: Expanded(child: Text("مانده"))),
        //             ],
        //             rows: getDataRow(controller)
        //         ),
        //       ),
        //     ),
        //   ),)
        // ],);
      })
    );
  }

  List<DataRow> getDataRow(BedBesController controller){
    List<DataRow> datalist=<DataRow>[];
    for(var i=0 ; i<controller.rizBedBesModel.value.hesabAshkhasList!.length ; i++){
      datalist.add(DataRow(color: MaterialStateColor.resolveWith((states) => i.isEven ?Colors.blueGrey.withOpacity(0.5) : Colors.white70) ,cells: [
       DataCell(Text(convertDtoJDate(controller.rizBedBesModel.value.hesabAshkhasList![i].flddodadoc.toString()))),
        DataCell(Container(alignment: Alignment.center, child: Text(controller.rizBedBesModel.value.hesabAshkhasList![i].flddsfacc.toString(), style: TextStyle(fontSize: 16 , ) , textAlign: TextAlign.center,))),
        DataCell(Text(setFormatNumber(controller.rizBedBesModel.value.hesabAshkhasList![i].bed.toString()))),
        DataCell(Text(setFormatNumber(controller.rizBedBesModel.value.hesabAshkhasList![i].bes.toString()))),
        DataCell(Text(setFormatNumber(controller.rizBedBesModel.value.hesabAshkhasList![i].sumprc.toString()))),
      ]));
    }
    return datalist;
  }

  Widget _landView(double wi , double he  ,BedBesController controller ){
    var listTaraz = controller.rizBedBesModel.value.hesabAshkhasList!;
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height*.15,
              color: Colors.blue,
              child: Row(children: [
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("تاریخ سند",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("شرح",style: TextStyle(color: Colors.white),),) , flex: 3,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بدهکار",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("بستانکار",style: TextStyle(color: Colors.white),),) , flex: 2,),
                Expanded(child: Container(decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text("مانده",style: TextStyle(color: Colors.white),),) , flex: 2,),




              ],),

            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: Get.width,
              height: Get.height*0.85,
              child: ListView.builder(itemBuilder: (context , index){
                return  Container(
                    //height: Get.height*0.1,
                    color: index.isEven ? Colors.blueGrey.shade100 : Colors.white70,
                    child: Row(children: [
                      Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.03),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(convertDtoJDate(listTaraz[index].flddodadoc.toString()), style: TextStyle(color:Colors.black),),) , flex: 2,),
                      Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.03),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(listTaraz[index].flddsfacc.toString(), style: TextStyle(color:Colors.black),),) , flex: 3,),
                      Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.03),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].bed.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),
                      Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.03),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].bes.toString()), style: TextStyle(color:Colors.black)),) , flex: 2,),
                      Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: wi*0.03),decoration:BoxDecoration(border: Border(left: BorderSide(width: 1,color: Colors.black))),alignment: Alignment.center,child: Text(setFormatNumber(listTaraz[index].sumprc.toString()) , style: TextStyle(color:Colors.black),),) , flex: 2,),

                    ],),
                  );

              }, itemCount: listTaraz.length,),
            ),
          )
        ],
      ),
    );
  }

}
