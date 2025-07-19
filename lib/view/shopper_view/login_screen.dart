import 'dart:convert';
import 'dart:ffi';

import 'package:bajaj_app/network/shopper_network/Utils.dart';
import 'package:bajaj_app/network/shopper_network/api_helper.dart';
import 'package:bajaj_app/utils/shopper_utils/app_modal.dart';
import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/home_screen.dart';
import 'package:bajaj_app/widgets/shopper_widgets/textfield_widget.dart';
import 'package:bajaj_app/widgets/shopper_widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  bool isObscure = true;
  bool termsChecked = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
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
                Container(
                  // Your image container or widget
                  width: 200,
                  height: 200,
                 // color: Colors.grey, // Placeholder color
                ),
                Positioned(
                  top: -100,
                  right: -100,
                  child: SvgPicture.asset(
                    'assets/top_right.svg',
                    width: 200,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -80,
                  child: SvgPicture.asset(
                    'assets/top_right.svg',
                    width: 200,
                    height: 250,
                  ),
                ),
                Form(
                    key: _formKey,
                    child:  Column(
                      children: [
                        const SizedBox(height: 200),
                        Center(
                          child: Image.asset('assets/brand_logo.png',
                            height: 100,
                            width: 220,),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text('Welcome Back',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.blueColor,
                              )),
                        ),
                        const SizedBox(height: 35),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16),
                          child: TextFieldLogin(
                            controller: emailController,
                            validator: emailValidator,
                            labeltext: 'User ID',
                            fieldIC: Icon(Icons.person,
                              size: 20,),
                            suffixIc: Icon(
                              Icons.person,
                              size: 20,
                            ),
                          ),

                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16),
                          child: TextFieldPass(
                            controller: passwordController,
                            validator: checkPasswordValidator,
                            labeltext: 'Password',
                            fieldIC: Icon(Icons.person,
                              size: 20,),
                            suffixIc: Icon(
                              Icons.person,
                              size: 20,
                            ),
                          ),
                        ),
                        //const SizedBox(height: 20),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Padding(
                        //     padding: EdgeInsets.only(right: 16.0),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         // Handle Forgot Password tap
                        //       },
                        //       child: Text(
                        //         'Forgot Password?',
                        //         style: TextStyle(
                        //           color: AppTheme.blueColor,
                        //           decoration: TextDecoration.underline,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            _submitHandler();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             HomeScreen(true)));
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonColor,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 50,
                              child: const Center(
                                child: Text('Second Calling',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                           Navigator.pop(context);
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
                                child: Text('Go to Back',
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
  loginApi() async {
    isLoading = true;
    setState(() {});
    var requestModel = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sign-in', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if (responseJSON['status'] == true) {
      Toast.show("Logged in Successfully !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      MyUtils.saveSharedPreferencesBool(
          'loginStatus', true);
      MyUtils.saveSharedPreferencesInt(
         'id',responseJSON['data']['id']);
      AppModel.setLoginStatus(true);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen(true,9,false)),
              (Route<dynamic> route) => false);
    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    setState(() {});
  }
  String? emailValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(value)) {
      return 'Email should be valid Email address.';
    }
    return null;
  }
  String? checkPasswordValidator(String? value) {
    if (value!.length < 6) {
      return 'Password is required';
    }
    return null;
  }
  void _submitHandler() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    loginApi();

    //
  }
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}