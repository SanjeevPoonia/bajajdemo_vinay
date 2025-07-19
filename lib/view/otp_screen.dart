


import 'package:bajaj_app/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'customer_issues_screen.dart';
import 'dashboard_screen.dart';
import 'landing_screen.dart';

class OTPScreen extends StatefulWidget
{
 LoginState createState()=>LoginState();
}

class LoginState extends State<OTPScreen>
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
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,

                  ),
                ),






              ],
            ),
          ),


          Padding(padding: EdgeInsets.only(left: 12,right:20),
          child:  Text(
            'Please enter the OTP sent on your mobile or Email',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.60),
            ),
          ),

          ),



          SizedBox(height: 18),

          Padding(padding: EdgeInsets.only(left: 12,right:20),
            child:  Text(
              'Mobile Verification Code',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.8)
              ),
            ),

          ),



          SizedBox(height: 19),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: PinCodeTextField(
              length: 6,
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF2EA44C),
                fontSize: 19

              ),
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(6),
                fieldHeight: 55,
                selectedColor:AppTheme.themeColor,
                selectedFillColor: Colors.white,
                fieldWidth: 46,
                activeFillColor: Colors.white,
                activeColor: Colors.green,
                inactiveFillColor:Color(0xFFE8E8E8),
                inactiveColor: Color(0xFFE8E8E8),
                disabledColor: Color(0xFFE8E8E8),
                errorBorderColor: Colors.red,
              ),
              animationDuration: Duration(milliseconds: 300),
             // backgroundColor: Colors.white,
              enableActiveFill: true,
             /* errorAnimationController: errorController,
              controller: textEditingController,*/
              enablePinAutofill: false,
              onCompleted: (v) {
                print("Completed");
                print(v);
             /*   otpText =
                    v;*/

              },
              onChanged: (value) {
                print(value);
               /* setState(() {
                  otpText =
                      value;
                });*/
              },
              appContext: context,
            ),
          ),


          SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Resend OTP in '),
                        TextSpan(
                          text: "00:30",
                          style: const TextStyle(
                              fontWeight:
                              FontWeight.w500,
                              color: Color(0xFfFF5E5E)),
                        ),
                        const TextSpan(
                            text: ' seconds '),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(right:20),
                child:  Text(
                  'Resend',
                  style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.8)
                  ),
                ),

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
                            LandingScreen()));
              },
              child: const Text(
                'Login',
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
