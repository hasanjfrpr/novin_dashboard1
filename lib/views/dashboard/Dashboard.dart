
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    double wi = Get.width;
    double he = Get.height;
    List<_PieData> data = [
      _PieData('CHN', 12),
      _PieData('GER', 15),
      _PieData('RUS', 30),
      _PieData('BRZ', 6.4),
      _PieData('IND', 14)
    ];

    return Scaffold(
      body: Container(
        width: wi,
        height: he,
        padding: EdgeInsets.symmetric(horizontal: wi*0.04 , vertical: he*0.015),
        child: SingleChildScrollView(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: wi*0.4,
                  height: wi*0.6,
                  child: SfCircularChart(
                    // Enables the legend
                    title:ChartTitle(text: "pie chart novin") ,
                  //  legend: Legend(isVisible: true , alignment: ChartAlignment.near , isResponsive: false,position:LegendPosition.bottom,width: "${wi}" ),
                    series: [
                      PieSeries<_PieData , String>(
                        xValueMapper:(_PieData data, _)=>data.xData,
                        yValueMapper: (_PieData data , int)=> data.yData,
                        explode: true,
                        dataSource: data,
                        // legendIconType: LegendIconType.triangle,

                        dataLabelMapper: (_PieData data, _)=>"${data.yData }% \n ${data.xData}",
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ],

                        ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: wi*0.4,
                  height: wi*0.6,
                  child: SfCircularChart(
                    // Enables the legend
                    title:ChartTitle(text: "pie chart novin") ,
                  //  legend: Legend(isVisible: true , alignment: ChartAlignment.near , isResponsive: false,position:LegendPosition.bottom,width: "${wi}" ),
                    series: [
                      PieSeries<_PieData , String>(
                        xValueMapper:(_PieData data, _)=>data.xData,
                        yValueMapper: (_PieData data , int)=> data.yData,
                        explode: true,
                        dataSource: data,
                        // legendIconType: LegendIconType.triangle,

                        dataLabelMapper: (_PieData data, _)=>"${data.yData }% \n ${data.xData}",
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ],

                        ),
                ),
              ),
                  ]
              )




        ),
      ),

    );
  }
}


class _PieData {
  _PieData(this.xData, this.yData, {this.text});
  final String xData;
  final num yData;
  final String? text;
}