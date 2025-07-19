


import 'package:bajaj_app/utils/app_theme.dart';
import 'package:bajaj_app/view/phone_number_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'customer_issues_screen.dart';
import 'dashboard_screen.dart';
import 'landing_screen.dart';

class LoginScreen extends StatefulWidget
{
 LoginState createState()=>LoginState();
}

class LoginState extends State<LoginScreen>
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
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                  suffixIcon: Image.asset("assets/email_ic.png"),
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
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ))),
          ),

          const SizedBox(height: 22),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
                obscureText: isObscure,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  //contentPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 13, 0),
                  suffixIcon: IconButton(
                    icon: isObscure
                        ? Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: const Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: Colors.white,
                    ),
                        )
                        : Padding(
                      padding: const EdgeInsets.only(right: 5),
                          child: const Icon(
                      Icons.visibility,
                      size: 20,
                      color: Colors.white,
                    ),
                        ),
                    onPressed: () {
                      Future.delayed(Duration.zero, () async {
                        if (isObscure) {
                          isObscure = false;
                        } else {
                          isObscure = true;
                        }

                        setState(() {});
                      });
                    },
                  ),
                  labelText: 'Password*',
                  labelStyle: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5),
                  )
                )),
          ),

          SizedBox(height: 22),
          
          
          Row(
            children: [

              SizedBox(width: 15),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneScreen()));
                },
                child: Text('Login with Mobile No.',style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  //decoration: TextDecoration.underline
                )),
              ),
              Spacer(),

              Text('Forgot Password',style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
              SizedBox(width: 12),
              
            ],
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
