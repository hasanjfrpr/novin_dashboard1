
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdamMojoodiController extends GetxController{


  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
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