
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/HazineController/FilterHazineController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/HazineController/HazineController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';


class HazineScreen extends StatelessWidget {
  const HazineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    var hazineList = Get.find<FilterHazineControler>().tarazMoeinModel.value;
    var hazineController = Get.find<FilterHazineControler>();
    Get.put(HazineController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.hazineh),
      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: he*0.03),
          width: he,
          child: DataTable(
            decoration: BoxDecoration(color: Colors.white70 , boxShadow: [BoxShadow(color: Colors.black12 , blurRadius: 2 , spreadRadius: 4)] , borderRadius: BorderRadius.circular(wi*0.05)),
            columns: [

              DataColumn(label: Text("مجموع بدهکار(گردش)")),
              DataColumn(label: Text("مجموع بستانکار (گردش)")),
              DataColumn(label: Text("مجموع بدهکار(مانده)")),
              DataColumn(label: Text("مجموع بستانکار(مانده)")),
            ],
            rows: [
              DataRow(cells: [

                DataCell(Text(setFormatNumber(hazineController.s_bed.value.toString()))),
                DataCell(Text(setFormatNumber(hazineController.s_bes.value.toString()))),
                DataCell(Text(setFormatNumber(hazineController.bed.value.toString()))),
                DataCell(Text(setFormatNumber(hazineController.bes.value.toString()))),
              ])
            ],
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context , orientation){
          return orientation==Orientation.portrait ? _portraitScreen(hazineList):_landScreen(hazineList);
        },
      ),
    );
  }
  Widget _landScreen(var hazine){
    return  Container(
      width: Get.width,
      child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
          columns: const [
            DataColumn(label: Text("حساب")),
            DataColumn(label: Text("بدهکار(گردش)")),
            DataColumn(label: Text("بستانکار(گردش)")),
            DataColumn(label: Text("بدهکار(مانده)")),
            DataColumn(label: Text("بستانکار(مانده)")),
          ],
          rows: _portRatRowItem(hazine),
        ),
    );
  }

  Widget _portraitScreen(var hazine){
    return SingleChildScrollView(
      scrollDirection:Axis.vertical ,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
         columns: const [
           DataColumn(label: Text("حساب")),
           DataColumn(label: Text("بدهکار(گردش)")),
           DataColumn(label: Text("بستانکار(گردش)")),
           DataColumn(label: Text("بدهکار(مانده)")),
           DataColumn(label: Text("بستانکار(مانده)")),
         ],
          rows: _portRatRowItem(hazine),
        ),
      ),
    );
  }

  List<DataRow> _portRatRowItem(TarazMoeinModel hazine){
    List<DataRow> ls =[];

    for(var i =0 ; i<hazine.tarazAzmayeshiKolMoeinList!.length ; i++){
      ls.add(DataRow( color: MaterialStateColor.resolveWith((states) => i.isEven ? Colors.black12 : Colors.white),cells:[
        DataCell(Expanded(child: Text(hazine.tarazAzmayeshiKolMoeinList![i].cfs.toString(), overflow: TextOverflow.clip,),)),
        DataCell(Expanded(child: Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].sbed.toString()) , overflow: TextOverflow.clip,),)),
        DataCell(Expanded(child: Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].sbes.toString()) , overflow: TextOverflow.clip,),)),
        DataCell(Expanded(child: Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].bed.toString()) , overflow: TextOverflow.clip,),)),
        DataCell(Expanded(child: Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].bes.toString()) , overflow: TextOverflow.clip,),)),
      ] ));
    }


    return ls;
  }


}
