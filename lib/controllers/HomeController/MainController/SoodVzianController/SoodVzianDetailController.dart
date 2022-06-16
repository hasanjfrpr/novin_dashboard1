

import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SoodVzianDetailController extends GetxController with GetSingleTickerProviderStateMixin{





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
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }



}