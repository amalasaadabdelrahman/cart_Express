import 'package:cart_express/Secreens/splash.dart';
import 'package:cart_express/prefs/user_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Secreens/order_detials.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefererencesController().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
