


import 'package:bajaj_app/utils/app_theme.dart';
import 'package:bajaj_app/view/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'customer_issues_screen.dart';
import 'dashboard_screen.dart';

class PhoneScreen extends StatefulWidget
{
 LoginState createState()=>LoginState();
}

class LoginState extends State<PhoneScreen>
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
                
                
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Image.asset("assets/bajaj_logo.png",width: 190,height:48),
                  )
                )
                
                



              ],
            ),
          ),

          Container(
            transform: Matrix4.translationValues(0.0, -12.0, 0.0),
            child: Row(
              children: [

                SizedBox(width: 12),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 15),


          /*     Container(
           padding: EdgeInsets.only(left: 12),
           child: Text(
             'Email Address',
             style: TextStyle(
               fontSize: 13.0,
               fontWeight: FontWeight.w500,
               color: Colors.white.withOpacity(0.5),
             ),
           ),
         ),*/




          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              // cursorHeight: 15,
              keyboardType: TextInputType.number,

                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone_android_outlined,color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    //contentPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 10, 0),
                    //prefixIcon: fieldIC,
                   // suffix: Image.asset("assets/email_ic.png"),
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ))),
          ),



          SizedBox(height: 20),



          Row(
            children: [

              SizedBox(width: 15),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text('Login with Email',style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  //decoration: TextDecoration.underline
                )),
              ),
            ],
          ),


          SizedBox(height: 40),
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
                            OTPScreen()));
              },
              child: const Text(
                'Send OTP',
                style: TextStyle(fontSize: 14.5,color: AppTheme.themeColor,fontWeight: FontWeight.w700),
              ),
            ),
          ),

          SizedBox(height: 25),



          
          
          Container(
            width: double.infinity,
             height: 200,
             transform: Matrix4.translationValues(53.0, 0.0, 0.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/bike_gg.png"
                  )
                )
              ),
          )
          
          





        ],
      ),
    );
  }

}
