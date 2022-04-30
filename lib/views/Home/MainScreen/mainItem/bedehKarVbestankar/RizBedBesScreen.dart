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
        ) : SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: DataTable(

                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
                border: TableBorder(verticalInside: BorderSide(color: Colors.black26)),
                headingRowHeight: he*0.05,
                columns:  [
                  DataColumn(label: Expanded(child: Text("تاریخ سند") ) ),
                  DataColumn(label: Expanded(child: Container(width: wi,alignment: Alignment.center,child: Text("شرح" , textAlign: TextAlign.center,)  ) , flex: 3,) ),
                  DataColumn(label: Expanded(child: Text("بدهکار"))),
                  DataColumn(label: Expanded(child: Text("بستانکار"))),
                  DataColumn(label: Expanded(child: Text("مانده"))),
                ],
                rows: getDataRow(controller)
            ),
          ),
        );
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

}
