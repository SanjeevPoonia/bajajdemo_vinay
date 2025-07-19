


import 'package:bajaj_app/utils/app_theme.dart';
import 'package:bajaj_app/view/nps_dashboard/nps_dashboard_screen.dart';
import 'package:bajaj_app/view/phone_number_screen.dart';
import 'package:bajaj_app/view/shopper_view/login_screen.dart';
import 'package:bajaj_app/view/login_screen.dart' as Bajaj;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'customer_issues_screen.dart';
import 'dashboard_screen.dart';
import 'landing_screen.dart';

class NewLandingScreen extends StatefulWidget
{
  LoginState createState()=>LoginState();
}

class LoginState extends State<NewLandingScreen>
{

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.themeColor,
      body: ListView(
        children: [

          // SizedBox(height: 23),

          SizedBox(
            height: 244,
            child: Stack(
              children: [

                Lottie.asset('assets/login_animation.json',
                ),

                Image.asset("assets/map_bg.png",fit: BoxFit.cover,width: double.infinity),


                /*  Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Image.asset("assets/bajaj_logo.png",width: 190,height:48),
                  )
                )*/





              ],
            ),
          ),

          Center(
            child: Text(
              'Please select',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),



          Container(
            height: 54,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 52),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(
                      AppTheme.themeColor), // background
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      Colors.white), // fore
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NPSDashboardScreen()));
              },
              child: const Text(
                'NPS Dashboard',
                style: TextStyle(fontSize: 14.5,color: AppTheme.themeColor,fontWeight: FontWeight.w700),
              ),
            ),
          ),


          SizedBox(height: 25),






          Container(
            height: 54,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 52),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(
                      AppTheme.themeColor), // background
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      Colors.white), // fore
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
              onPressed: () {
                print("Hello world");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()));
              },
              child: const Text(
                'Survey CXM',
                style: TextStyle(fontSize: 14.5,color: AppTheme.themeColor,fontWeight: FontWeight.w700),
              ),
            ),
          ),

          SizedBox(height: 25),

          Container(
            height: 54,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 52),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(
                      AppTheme.themeColor), // background
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      Colors.white), // fore
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bajaj.LoginScreen()));
              },
              child: const Text(
                'Huddle',
                style: TextStyle(fontSize: 14.5,color: AppTheme.themeColor,fontWeight: FontWeight.w700),
              ),
            ),
          ),











        ],
      ),
    );
  }

}
