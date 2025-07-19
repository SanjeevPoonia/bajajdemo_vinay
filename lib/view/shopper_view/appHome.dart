import 'dart:convert';
import 'dart:ffi';

import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/login_screen.dart';
import 'package:bajaj_app/widgets/shopper_widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:toast/toast.dart';

class appScreen extends StatefulWidget {
  const appScreen({super.key});

  @override
  appState createState() => appState();
}

class appState extends State<appScreen> {
  bool isObscure = true;
  bool termsChecked = false;
  bool isLoading = false;

  int id = 0;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      color: AppTheme.themeColor,
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                BackgroundWidget(),
                Form(
                    child:  Column(
                      children: [
                        const SizedBox(height: 220),
                        Center(
                          child: Image.asset(
                            'assets/SurveyCXM.png',
                            width: 200,
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text('Welcome Back',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.blueColor,
                              )),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            Toast.show("Coming soon !!",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.blueAccent);
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 50,
                              child: const Center(
                                child: Text('SurveyCXM',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen()));
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 50,
                              child: const Center(
                                child: Text('BlueDart',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }

}