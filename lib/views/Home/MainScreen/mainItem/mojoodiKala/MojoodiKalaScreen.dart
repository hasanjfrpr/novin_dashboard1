import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/MojodiController/FilterMojoodiController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';

class MojoodikalaScreen extends StatelessWidget {
  const MojoodikalaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.mojodiKala),
        backgroundColor: Color(AppColor.primaryColor),
      ),
      body: OrientationBuilder(
          builder: (context, orientation) => orientation==Orientation.portrait? _portraitView(wi , he ,Get.find<FilterMojoodiController>()) : _landView() ),


    );

  }
  Widget _portraitView(double wi , double he , FilterMojoodiController controller){
    var ListMojoodiKala = controller.mojoodikalaModel.value.mojoodiKalaList;
    return GestureDetector(
      onTap: (){ FocusManager.instance.primaryFocus!.unfocus(); },
      child: Column(
        children: [
        Expanded(child: _searchBox(wi, he)),
        Expanded(child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: he,
                child: Column(

                  children: [
                    Expanded(
                      child: Row(children: [
                        Container(width: wi*0.6 ,height: he*0.065,child: Text("عنوان" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("موجودی" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("معدل فی موجودی" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),
                        Container(width: wi*0.3 ,height: he*0.065,child: Text("مبلغ" , style: TextStyle(color:Colors.white),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.blue,border: Border(left: BorderSide(color: Colors.white70))),),


                      ],),
                    ),
                    Expanded(
                      flex: 18,
                      child: Container(
                        width: 5*0.3*wi,
                        height: he,
                        color: Colors.grey,
                        child: ListView.builder(itemBuilder: (context , index){
                          return Row(children: [
                            Container(padding:EdgeInsets.all(wi*0.04),width: wi*0.6 ,height: he*0.08,child: Text(ListMojoodiKala![index].fldtiflfac.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12),
                            Container(padding:EdgeInsets.all(wi*0.04),width: wi*0.3 ,height: he*0.08,child: Text(ListMojoodiKala[index].qtymoged.toString(), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(padding:EdgeInsets.all(wi*0.04),width: wi*0.3 ,height: he*0.08,child: Text(setFormatNumber(ListMojoodiKala[index].avmoged.toString()) , style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),
                            Divider(color: Colors.black12,),
                            Container(padding:EdgeInsets.all(wi*0.04),width: wi*0.3 ,height: he*0.08,child: Text(setFormatNumber(ListMojoodiKala[index].prcmoged.toString()), style: TextStyle(color:Colors.black),),alignment: Alignment.center,decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.black12))),),


                          ],);

                        }, itemCount: ListMojoodiKala!.length,),
                      ),
                    ),




                  ],
                ),
              ),
            )
        ),flex: 13,)
        ],
      ),
    );


  }

  Widget _searchBox(double wi, double he) {
    return Container(
      width: wi,
      height: he * 0.08,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.004),
      child: TextField(

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
        onChanged:(value){} ,
      ),
    );
  }

  Widget _landView(){
    return Container();
  }
}
