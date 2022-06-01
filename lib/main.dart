import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novin_dashboard1/resource/Resource.dart';
import 'package:novin_dashboard1/views/splashScreen/SplashScreen.dart';

void main() {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      defaultTransition:Transition.fadeIn ,
      theme: ThemeData(
        primaryColor: Color(AppColor.primaryColor),
        colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light , primarySwatch: Colors.blueGrey),
        fontFamily: 'IrSans'

      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
