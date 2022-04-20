import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/BedBesController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class RizBedBesScreen extends StatelessWidget {
  const RizBedBesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    BedBesController controller = Get.find<BedBesController>();
    controller.onInit();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.rizhesab),
      ),
      body: Row(
        children: [
          Expanded(
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
        ],
      ),
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
