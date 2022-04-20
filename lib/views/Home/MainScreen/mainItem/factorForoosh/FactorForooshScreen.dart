import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/FactorForooshController/FactorForooshController.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/FactorForooshController/FilterFFCotroller.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/FactorForooshModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/factorForoosh/RizFactorScreen.dart';

class FactorForooshScreen extends StatelessWidget {
   FactorForooshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;

    FactorForooshController controller = Get.put(FactorForooshController(),tag: "factorForooshController");
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.factorFrosh),
          centerTitle: true,
          backgroundColor: Color(AppColor.primaryColor),
        ),
        body:Get.find<FilterFactorForooshController>(tag: "FilterFFController").suggestFactorForooshModel.value.factorForooshList!.isEmpty ? emptyScreen(wi, he) :
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _searchBox(wi, he, controller)),
            Expanded(
                flex: 11,
                child: Container(
                  child: Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: Get.find<FilterFactorForooshController>(tag: "FilterFFController").suggestFactorForooshModel.value.factorForooshList?.length,
                        itemBuilder: (context, int index) {
                          return _items(wi, he, index,
                              Get.find<FilterFactorForooshController>(
                                  tag: "FilterFFController"), controller);
                        });

                  }
                  ),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(wi*0.05),
                color: Color(AppColor.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(AppString.allSell , style: TextStyle(color: Color(AppColor.onPrimaryColor)),),
                    Text(_totalSell() , style: TextStyle(color: Color(AppColor.onPrimaryColor)),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _items(double wi, double he, int index , FilterFactorForooshController controller,FactorForooshController forooshController) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      width: wi,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(2, 2))
      ],
        color: Colors.white70.withOpacity(0.25),
        border: Border(right: BorderSide(color:  Color(AppColor.primaryColor),width: wi*0.0145))
      ),
      margin: EdgeInsets.only(bottom: he * 0.02 , left: wi*0.04,right: wi*0.04),
      child: Column(
              children: [
                 ExpansionTile(
                        title: Text(controller.suggestFactorForooshModel.value
                            .factorForooshList?[index].fldtiflfac!.toLowerCase()=="null" ? "فاقد نام" : "${controller.suggestFactorForooshModel.value
                            .factorForooshList?[index].fldtiflfac}"),
                        iconColor: Color(AppColor.primaryColor),
                        children: [
                          _itemRow(AppString.commission, setFormatNumber(controller.suggestFactorForooshModel.value.factorForooshList![index].fldPrcAcc2!)),
                          _itemRow(AppString.discount, setFormatNumber(controller.suggestFactorForooshModel.value.factorForooshList![index].fldPrcAcc22!)),
                          _itemRow(AppString.taxation, setFormatNumber(controller.suggestFactorForooshModel.value.factorForooshList![index].maliatForosh!)),
                          _itemRow(AppString.complications, controller.suggestFactorForooshModel.value.factorForooshList![index].avarezForosh!),
                          _itemRow(AppString.date, convertDtoJDate(controller.suggestFactorForooshModel.value.factorForooshList![index].flddodadoc!)),
                        ],
                      ),
                _itemRow(AppString.price, setFormatNumber(controller.suggestFactorForooshModel.value.factorForooshList![index].fldamoudoc!)),
                _itemRow(AppString.profitFactor, setFormatNumber(controller.suggestFactorForooshModel.value.factorForooshList![index].fldSoodLastpurchase!)),
                _itemRow(AppString.description, controller.suggestFactorForooshModel.value.factorForooshList![index].flddsfdoc!),
                InkWell(
                  onTap: (){
                   forooshController.getRizFactor(controller.suggestFactorForooshModel.value.factorForooshList![index].fldcoddoc!);
                    showLoading(wi, he);
                  },
                  child: Container(
                    color: Colors.grey.withOpacity(0.15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.increase_indent , color:  Color(AppColor.primaryColor)),
                        SizedBox(width: wi*0.02,),
                        Text("ریزفاکتور" , style: TextStyle(color:  Color(AppColor.primaryColor)))


                      ],
                    ),
                  ),
                )



              ],
      ),
    );
  }

  Widget _itemRow(String rowName , String value){
    if(value.toLowerCase() == "null") value="----";
    return Container(
      margin: EdgeInsets.symmetric(horizontal:Get.width*0.04, vertical: Get.height*0.005 ),
      child: Row(
        children: [
          Expanded(flex:1,child: Text(rowName+" :  "  , style: TextStyle(fontWeight: FontWeight.bold),)),
          Expanded(flex:3,child: Text(value , style: TextStyle(),overflow: TextOverflow.clip,))
        ],
      ),
    );
  }

  Widget _searchBox(double wi, double he, FactorForooshController controller) {
    return Container(
      width: wi,
      height: he * 0.05,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.004),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: AppString.searchFactorF,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(wi * 0.04))),
        ),
        onChanged:(value){Get.find<FilterFactorForooshController>(tag: "FilterFFController").searchPattern(value);} ,
      ),
    );
  }


  String _totalSell() {
    int? length = Get.find<FilterFactorForooshController>(tag: "FilterFFController").factorForooshModel.value.factorForooshList?.length;
     int totalsell=0;
    for(var i=0 ; i<length! ; i++){
      totalsell += int.parse(Get.find<FilterFactorForooshController>(tag: "FilterFFController").factorForooshModel.value.factorForooshList![i].fldamoudoc!);
    }

    return setFormatNumber(totalsell.toString());

  }
}
