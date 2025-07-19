

import 'dart:async';
import 'package:bajaj_app/view/login_screen.dart';
import 'package:bajaj_app/view/new_landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer_issues_screen.dart';

class SplashScreen extends StatefulWidget
{
  SplashState createState()=>SplashState();
}
class SplashState extends State<SplashScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
        /*  decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/QAviews.png'),
              fit: BoxFit.contain,
            ),
          ),*/
        )
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _navigateUser();

  }

  _navigateUser() async {
          Timer(
              Duration(seconds: 2),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => NewLandingScreen())));
        }



    }


