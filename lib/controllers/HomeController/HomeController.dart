
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeController extends GetxController{
  var jalili = Jalali.now().obs;
  RxInt currentActiveScreen = 0.obs;




  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _getTime();
    super.onInit();
  }

  Future _getTime() async{
    new Timer.periodic(Duration(seconds: 1), (timer) async {
      jalili.value = Jalali.now();
    });
  }

}