import 'package:bajaj_app/utils/app_theme.dart';
import 'package:bajaj_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //for survey cxm
 /* final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token=prefs.getString('access_token')??'';
  print(token);*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.themeColor),
        useMaterial3: true,
        fontFamily: 'Montserrat'
      ),
      home: SplashScreen(),
    );
  }
}
