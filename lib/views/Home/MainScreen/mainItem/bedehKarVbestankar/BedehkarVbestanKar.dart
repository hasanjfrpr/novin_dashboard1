import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/controllers/HomeController/MainController/BedBesController/BedBesController.dart';
import 'package:novin_dashboard1/model/MainModel/mainItemModel/FilterFactorForooshModel/PersonListModel.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/utils/Utils.dart';
import 'package:novin_dashboard1/views/Home/MainScreen/mainItem/bedehKarVbestankar/RizBedBesScreen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class BedehkarVbestanKarScreen extends StatelessWidget {
  List<PersonList>? personList;

  BedehkarVbestanKarScreen({Key? key, required this.personList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = Get.width;
    double he = Get.height;
    RxInt filterRadio = 0.obs;
    RxList<PersonList> personLists = <PersonList>[].obs;
    personLists.value = personList!;
    BedBesController controller = Get.put(BedBesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColor.primaryColor),
        title: Text(AppString.bedehkarVbestankar),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation==Orientation.portrait ? portrait(wi, he, filterRadio, personLists, controller) : portrait(he, wi, filterRadio, personLists, controller);
        })
      ),
    );
  }
  Widget portrait(double wi , double he , RxInt filterRadio ,RxList<PersonList> personLists,BedBesController controller  ){
    return Container(
      width: wi,
      height: he,
      padding: EdgeInsets.only(top: wi * 0.02),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: _searchBox(wi, he),
                    flex: 5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(Obx(() {
                          return Container(
                            width: wi,
                            height: he * 0.3,
                            child: Column(
                              children: [
                                RadioListTile<int>(
                                    title: Text("بیشترین بستانکار"),
                                    value: 0,
                                    groupValue: filterRadio.value,
                                    onChanged: (value) {
                                      filterRadio.value = value!;
                                    }),
                                RadioListTile<int>(
                                    title: Text("بیشترین بدهکار"),
                                    value: 1,
                                    groupValue: filterRadio.value,
                                    onChanged: (value) {
                                      filterRadio.value = value!;
                                    }),
                                MaterialButton(
                                  onPressed: () {
                                    personLists.value.sort((a,b)=>int.parse(a.prc!.toLowerCase()=="null" ? "0" : a.prc!).compareTo(int.parse(a.prc!.toLowerCase()=="null" ? "0" : a.prc!))

                                    );
                                    Get.back();
                                    Get.off(BedehkarVbestanKarScreen(personList: personLists.value,));

                                  },
                                  child: Text(
                                    "مرتب سازی",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(AppColor.primaryColor),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(wi * 0.05),
                              color: Colors.white,
                            ),
                          );
                        }),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: wi * 0.008,
                                    color: Color(AppColor.primaryColor)),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(wi * 0.05))));
                      },
                      child: Container(
                        height: he,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.grey.shade400)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("مرتب سازی"),
                            Icon(CupertinoIcons.sort_down)
                          ],
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              width: wi,
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("مجموع بدهکار"),
                      Text(
                        setFormatNumber(_totalBed(personList!)),
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("مجموع بستانکار"),
                      Text(
                        setFormatNumber(_totalBes(personList!)),
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )
                ],
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Obx((){ return Container(
              color: Colors.white,
              child: personLists.value.isEmpty
                  ? emptyScreen(wi, he)
                  : ListView.builder(
                itemCount: personLists.value.length,
                itemBuilder: (context, index) {
                  return _item(wi, he, personList!, index , controller);
                },
              ),
            );}
            ),
            flex: 30,
          ),
        ],
      ),
    );
  }

  Widget _searchBox(double wi, double he) {
    return Container(
      width: wi,
      height: he * 0.05,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: AppString.searchFactorF,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.0065),
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _item(double wi, double he, List<PersonList> personLis, int index , BedBesController controller) {
    return Container(
      width: wi,
      margin: EdgeInsets.symmetric(horizontal: wi * 0.04, vertical: he * 0.01),
      decoration: (BoxDecoration(
          color: Colors.white70.withOpacity(0.7),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
          ],
          border: Border(
              right: BorderSide(
                  color: Color(AppColor.primaryColor), width: wi * 0.013)))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: wi * 0.04, vertical: wi * 0.02),
            width: wi,
            alignment: Alignment.center,
            child: Text(
              personLis[index].fldTifLfac.toString(),
              overflow: TextOverflow.clip,
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          _itemRow(AppString.mondehesab,
              setFormatNumber(personLis[index].prc.toString())),
          _itemRow(AppString.personName,
              setFormatNumber(personLis[index].fldNmmfPer.toString())),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  _showDetailDialog(wi , he , personLis , index);
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person,
                        color: Color(AppColor.primaryColor),
                      ),
                      SizedBox(
                        width: wi * 0.015,
                      ),
                      Text(
                        AppString.moshakhasat,
                        style: TextStyle(color: Color(AppColor.primaryColor)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  controller.getRizBedBes(personLis[index].fLDCodLFAC.toString(),personLis[index].fldTifLfac.toString());
                  showLoading(wi, he);
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.decrease_indent,
                        color: Color(AppColor.primaryColor),
                      ),
                      SizedBox(
                        width: wi * 0.015,
                      ),
                      Text(AppString.rizhesab,
                          style: TextStyle(color: Color(AppColor.primaryColor)))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemRow(String rowName, String value) {
    if (value.toLowerCase() == "null") value = "----";
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04, vertical: Get.height * 0.005),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                rowName + " :  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(),
                overflow: TextOverflow.clip,
              ))
        ],
      ),
    );
  }
  void _showDetailDialog(double wi, double he, List<PersonList> personList, int index){
    Get.defaultDialog(
      title:  personList[index].fldTifLfac!.toLowerCase()=="null" ? "فاقد نام" : "${personList[index].fldTifLfac}",
      content: Container(
        child: Column(
          children: [

                _itemRow(AppString.personName, personList[index].fldNmmfPer.toString()),
                InkWell(onTap: (){ if(personList[index].fldphn1per.toString().toLowerCase() != "null") UrlLauncher.launch("tel://${personList[index].fldphn1per}");},child: _itemRow(AppString.phoneNumber1, personList[index].fldphn1per.toString() )),
                InkWell(onTap: (){if(personList[index].fldphn2per.toString().toLowerCase() != "null") UrlLauncher.launch("tel://${personList[index].fldphn2per}");},child: _itemRow(AppString.phoneNumber2, personList[index].fldphn2per.toString())),
                _itemRow(AppString.address,personList[index].fldadfper.toString()),



            _itemRow(AppString.codehesab,personList[index].cfs.toString()),




          ],
        ),
      )
    );
  }

  String _totalBes(List<PersonList> personList) {
    int totalBes = 0;
    if (personList.isNotEmpty) {
      for (var ps in personList) {
        if (ps.prc!.contains("-")) {
          totalBes += int.parse(ps.prc!);
        }
      }
    }
    String s = totalBes.toString().replaceAll("-", "");
    return s;
  }

  String _totalBed(List<PersonList> personList) {
    int totalBes = 0;
    if (personList.isNotEmpty) {
      for (var ps in personList) {
        if (!ps.prc!.contains("-") &&
            ps.prc! != "" &&
            ps.prc!.toLowerCase() != "null" &&
            ps.prc!.toLowerCase() != "0") {
          totalBes += int.parse(ps.prc!);
        }
      }
    }
    String s = totalBes.toString();
    return s;
  }

  void _sort(int value) {
    if (value == 0) {
      personList!.sort();
    } else {}
  }
}
