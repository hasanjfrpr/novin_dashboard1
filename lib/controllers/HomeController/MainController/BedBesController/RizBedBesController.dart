

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RizBedBesController extends GetxController{






  @override
  void onInit() {
    print("alan onInit shod");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    print("alan onClose shod");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onClose();
  }





}