import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NpsResponeScreen extends StatefulWidget{
  bool showBack;

  NpsResponeScreen(this.showBack);
  @override
  NpsResponeState createState() => NpsResponeState();
}

class NpsResponeState extends State<NpsResponeScreen>{

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppTheme.themeNewColor,
      child: SafeArea(
        child: Scaffold(
          appBar: widget.showBack
              ? AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/profile_icon.svg',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                // Add your right button action here
              },
            ),

            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/logout.svg',
                  width: 25,
                  height: 25,
                ),
                onPressed: () => Navigator.pop(context),

              ),
            ],

            title:Image.asset('assets/brand_logo.png',
              height: 40,
              width: 220,),
            centerTitle: true,
          )
              : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar()),
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}