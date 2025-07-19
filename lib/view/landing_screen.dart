import 'dart:io';

import 'package:bajaj_app/view/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

import '../utils/app_theme.dart';
import '../widgets/new_bottom.dart';
import 'customer_issues_screen.dart';
import 'ilr_screen.dart';
import 'my_huddle_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingState createState() => LandingState();
}

class LandingState extends State<LandingScreen> {
  static int _tabIndex = 0;
  String email='';

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        height: 95,
        activeIcons: [
          Image.asset('assets/d_active1.png',width: 18.47,height: 18.47),
          Image.asset('assets/d_active2.png',width: 25.54,height: 20.45),
          Image.asset('assets/d_active3.png',width: 23.74,height: 20.45),
          Image.asset('assets/d_active4.png',width: 11.75,height:16),
          Image.asset('assets/da5.png',width: 20.66,height: 20.45,color: AppTheme.themeColor),
        ],
        inactiveIcons: [
          Container(
            child: Column(
              children: [

                SizedBox(height: 13),
                Image.asset('assets/da1.png',width: 18.47,height: 18.47),
                SizedBox(height: 5),
                Text("Dashboard",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2A2A2),
                        fontWeight: FontWeight.w500)),

                SizedBox(height: 5)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 13),
                Image.asset('assets/da2.png', width: 25.54,height: 20.45),
                SizedBox(height: 5),
                Text("Huddle",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2A2A2),
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 5)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 13),
                Image.asset('assets/da3.png',width: 23.74,height: 20.45),
                SizedBox(height: 5),
                Text("ILR",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2A2A2),
                        fontWeight: FontWeight.w500)),

                SizedBox(height: 5)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 13),
                Image.asset('assets/da4.png', width: 22,height:22),
                SizedBox(height: 5),
                Text("Tickets",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2A2A2),
                        fontWeight: FontWeight.w500)),

                SizedBox(height: 5)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 13),
                Image.asset('assets/da5.png',width: 20.66,height: 20.45),
                SizedBox(height: 5),
                Text("Profile",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2A2A2),
                        fontWeight: FontWeight.w500)),

                SizedBox(height: 5)
              ],
            ),
          ),
        ],
        color: Colors.white,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTab: (v) {
          tabIndex = v;
          pageController.jumpToPage(tabIndex);
        },
        /*  cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),*/
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 4,
      ),
      body: WillPopScope(
        onWillPop: () {

          appExitDialog();
          return Future.value(true);
        },
        child: PageView(
          controller: pageController,
          onPageChanged: (v) {
            tabIndex = v;
          },
          children: [

            DashboardScreen(),

            MyHuddleScreen(),
            ILRScreen(),

            CustomerScreen(),

            Container(
            ),

          ],
        ),

      )
    );
  }


  appExitDialog() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel",style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600
      )),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Exit",style: TextStyle(
        color: AppTheme.themeColor,
        fontWeight: FontWeight.w600
      )),
      onPressed: () {
        Navigator.pop(context);
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Exit App?",style: TextStyle(
          color: AppTheme.themeColor,
          fontWeight: FontWeight.w600
      )),
      content: Text("Are you sure you want to exit Bajaj ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
