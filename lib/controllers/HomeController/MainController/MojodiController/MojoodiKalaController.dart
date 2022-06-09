
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MojoodiController extends GetxController{


  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }


  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }
}