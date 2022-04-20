import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:novin_dashboard1/Dialog/Dialog.dart';
import 'package:novin_dashboard1/controllers/setting/SettingController.dart';
import 'package:novin_dashboard1/resource/Resource.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
  final SettingController controller = SettingController();


  @override
  Widget build(BuildContext context) {
    controller.onInit();
    double wi = Get.width;
    double he = Get.height;
    return Scaffold(
      backgroundColor: Color(AppColor.onPrimaryColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: wi,
                margin: EdgeInsets.all(wi * 0.05),
                child: Text(
                  AppString.networkSetting,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: wi * 0.035,
                  ),
                )),
            SizedBox(
              height: he * 0.0005,
            ),
            Card(
              child: Container(
                  width: wi,
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(
                            AppString.serverSetting,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: wi * 0.035,
                            ),
                          ),
                          onTap: (){
                            Dialogs.showServerSettingDialog();
                          },
                          trailing: Icon(Icons.arrow_drop_down_outlined)),
                      Divider(),
                      ListTile(
                          title: Text(
                            AppString.restartServer,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: wi * 0.035,
                            ),
                          ),
                          onTap: (){
                            Dialogs.showRestartingServerDialog();
                          },
                          trailing: Icon(Icons.arrow_drop_down_outlined)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
