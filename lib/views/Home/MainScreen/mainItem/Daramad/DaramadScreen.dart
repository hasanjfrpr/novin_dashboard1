
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/DaramadController/DaramadController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/DaramadController/FilterDaramadController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/HazineModel/TarazMoeinModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class DaramadScreen extends StatelessWidget {
  const DaramadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    TarazMoeinModel hazineList = Get.find<FilterDaramadControler>().tarazMoeinModel.value;
    FilterDaramadControler hazineController = Get.find<FilterDaramadControler>();
    Get.put(DaramadController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.daramad),
          actions: [GestureDetector(onTap: (){_showTotalDialog(wi,he,hazineController);},child: Icon(CupertinoIcons.doc_text)),SizedBox(width: 16,)]
      ),

      body: OrientationBuilder(
        builder: (context , orientation){
          return orientation==Orientation.portrait ? _portraitScreen(hazineList ,  wi  ,  he):_landScreen(hazineList ,  wi , he);
        },
      ),
    );
  }
  Widget _landScreen(TarazMoeinModel hazine ,double  wi , double he){
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

  Widget _portraitScreen(TarazMoeinModel hazine ,double  wi , double he){
    return SingleChildScrollView(
      scrollDirection:Axis.vertical ,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor:
          MaterialStateColor.resolveWith((states) => Colors.blue),
          border: TableBorder(verticalInside: BorderSide(color: Colors.black26)),
          headingRowHeight: he*0.05,
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
      ls.add(DataRow(color: MaterialStateColor.resolveWith((states) => i.isEven ? Colors.black12 : Colors.white),cells:[
        DataCell( Text(hazine.tarazAzmayeshiKolMoeinList![i].tif.toString(), overflow: TextOverflow.clip,),),
        DataCell( Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].sbed.toString()) , overflow: TextOverflow.clip,),),
        DataCell(Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].sbes.toString()) , overflow: TextOverflow.clip,),),
        DataCell( Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].bed.toString()) , overflow: TextOverflow.clip,),),
        DataCell( Text(setFormatNumber(hazine.tarazAzmayeshiKolMoeinList![i].bes.toString()) , overflow: TextOverflow.clip,),),
      ] ));
    }


    return ls;
  }

  void _showTotalDialog(double wi , double he , FilterDaramadControler fContoller){
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(side:BorderSide(width: 2 , color: Color(AppColor.primaryColor)) ,borderRadius: BorderRadius.only(topRight:Radius.circular(wi*0.08),bottomLeft: Radius.circular(wi*0.08))),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(wi*0.06) ,boxShadow: [BoxShadow(color: Colors.white54 , blurRadius: 2,spreadRadius: 2)]),
        width: wi,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Text("مجموع بدهکار(گردش) :" , style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.s_bed.value.toString()) , style: TextStyle(color: Colors.green , fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بستانکار(گردش) :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.s_bes.value.toString()), style: TextStyle(color: Colors.redAccent, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text(" مجموع بدهکار :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.bed.value.toString()), style: TextStyle(color: Colors.green, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
            Divider(height: 4,),
            ListTile(leading: Text("مجموع بستانکار :", style: TextStyle(fontSize: 0.03*wi),),title:Text(setFormatNumber(fContoller.bes.value.toString()), style: TextStyle(color: Colors.redAccent, fontSize: wi*0.03,fontWeight: FontWeight.bold),) ,),
          ],
        ),
      ),
    ));
  }

}
