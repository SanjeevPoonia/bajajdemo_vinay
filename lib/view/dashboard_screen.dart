

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/app_theme.dart';

class DashboardScreen extends StatefulWidget
{
  DashboardState createState()=>DashboardState();
}
class DashboardState extends State<DashboardScreen>
{
   ExpandedTileController _controller=ExpandedTileController();
   ExpandedTileController _controller2=ExpandedTileController();
   ExpandedTileController _controller3=ExpandedTileController();
   ExpandedTileController _controller4=ExpandedTileController();
   ExpandedTileController _controller5=ExpandedTileController();
   ExpandedTileController _controller6=ExpandedTileController();
   int selectedTab=1;
   int selectedTab2=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Image.asset(
            'assets/leftarrow.png',
            width: 25,
            height: 25,
          ),
          onPressed: () {

           Navigator.pop(context);
          },
        ),
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,

        actions: [
          Stack(
            children: [

              IconButton(
                  icon: Image.asset(
                    'assets/bell.png',
                    width: 22,
                    height: 22,
                  ),
                  onPressed: () {
                   // _bottomSheetFilter();

                  }
              ),


              Container(
                transform: Matrix4.translationValues(27.0, 10.0, 0.0),
                width:16,
              height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFf5619D1)
                ),

                  child:Center(
                    child:   Text('Welcome Back,',style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                  )
              )


            ],
          ),

        ],

      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 5,
            color: Color(0xFFE8E8E8),
          ),

          Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
            color: Colors.white,
            child: Container(
              color: Colors.white,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back,',style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                      Text('Jhon Smith!',style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor,
                      )),
                    ],
                  ),

                  SizedBox(height: 5),


                  Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(width: 65),
                      Text('Employee Id : ASD45789',style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                    ],
                  ),




                ],
              ),
            ),
          ),

          SizedBox(height:10),


          Row(
            children: [
              Expanded(child:  Card(
                margin: EdgeInsets.only(left: 7),
                color: Color(0xFfF9F9F9),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xFfF9F9F9),
                  ),
                  height: 93,
                  width: 180,
                  child: Column(
                    children: [



                      Row(
                        children: [

                          SizedBox(width: 7),
                          Expanded(
                            child: Text('Survey invitations sent',style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D2226),
                            )),
                          ),
                          Image.asset("assets/tiles_1.png")
                        ],
                      ),


                      Container(
                        transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                        child:  Row(


                          children: [
                            SizedBox(width: 7),

                            Text('24,886',style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            )),
                          ],
                        ),
                      ),







                    ],
                  ),
                ),
              ),flex: 1),

              SizedBox(width: 13),
              Expanded(child:  Card(
                margin: EdgeInsets.only(right: 7),
                color: Color(0xFfF9F9F9),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xFfF9F9F9),
                  ),
                  height: 93,
                  width: 180,
                  child: Column(
                    children: [



                      Row(
                        children: [

                          SizedBox(width: 7),
                          Expanded(
                            child: Text('OTP filled',style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D2226),
                            )),
                          ),
                          Image.asset("assets/tiles_2.png")
                        ],
                      ),


                      Container(
                        transform: Matrix4.translationValues(0.0, -7.0, 0.0),
                        child:  Row(


                          children: [
                            SizedBox(width: 7),

                            Text('5,000',style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            )),
                          ],
                        ),
                      ),







                    ],
                  ),
                ),
              ),flex: 1)
            ],
          ),


          SizedBox(height:15),

          Row(
            children: [
              Expanded(child:  Card(
                margin: EdgeInsets.only(left: 7),
                color: Color(0xFfF9F9F9),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xFfF9F9F9),
                  ),
                  height: 93,
                  width: 180,
                  child: Column(
                    children: [
                      SizedBox(height: 10),



                      Row(
                        children: [

                          SizedBox(width: 7),
                          Text('Response rate',style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D2226),
                          )),
                        ],
                      ),

                    SizedBox(height: 3),




                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 7),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 18,
                          height: 9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color(0xFfD6D6D6)
                          ),
                        ),

                        SizedBox(width: 5),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Partial',style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D2226),
                            )),


                            Text('5,000',style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            )),
                          ],
                        ),

                        SizedBox(width: 10),


                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 18,
                          height: 9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFfF47321)
                          ),
                        ),

                        SizedBox(width: 5),

                        Column(
                          children: [
                            Text('Complete',style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D2226),
                            )),


                            Text('19,886',style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            )),
                          ],
                        ),





                      ],
                    ),

                      SizedBox(height: 5),

                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: new LinearPercentIndicator(
                          //width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 10.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          center: Text("80.0%",style: TextStyle(
                            fontSize: 8,
                            color: Colors.white
                          ),),
                          barRadius: Radius.circular(4),
                          progressColor: AppTheme.themeColor,
                        ),
                      ),







                    ],
                  ),
                ),
              ),flex: 1),

              SizedBox(width: 13),
              Expanded(child:  Card(
                margin: EdgeInsets.only(right: 7),
                color: Color(0xFfF9F9F9),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xFfF9F9F9),
                  ),
                  height: 93,
                  width: 180,
                  child: Column(
                    children: [



                      Row(
                        children: [

                          SizedBox(width: 7),
                          Expanded(
                            child: Text('Callbacks',style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D2226),
                            )),
                          ),
                          Opacity(
                          opacity: 0.67,

                            child: Image.asset("assets/dialer_ic.png"))
                        ],
                      ),


                      Container(
                        transform: Matrix4.translationValues(0.0, -7.0, 0.0),
                        child:  Row(


                          children: [
                            SizedBox(width: 7),

                            Text('10,000',style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.themeColor,
                            )),
                          ],
                        ),
                      ),







                    ],
                  ),
                ),
              ),flex: 1)
            ],
          ),
          SizedBox(height:15),

          Card(
            color: Color(0xFFF9F9F9),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              padding: EdgeInsets.all(10),

              child: Stack(
                children: [

                  Container(
                    transform: Matrix4.translationValues(48.0, -57.0, 0.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset("assets/right_curve.png"),

                      ],
                    ),
                  ),


                  Column(
                    children: [

                      Text('Net Promotor Score',style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                      SizedBox(height: 2),


                      Text('40',style: TextStyle(
                        fontSize: 37.0,
                        fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        color: AppTheme.themeColor,
                      )),


                      Row(
                        children: [

                          Expanded(
                              flex:1,
                              child: Column(children: [

                                SizedBox(
                                  height: 80,
                                  child: OverflowBox(
                                    minHeight: 160,
                                    maxHeight: 160,
                                    child:Lottie.asset('assets/promoter_1.json',
                                    ),
                                  ),
                                ),


                                Text('75%',style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0ECA14),
                                )),



                          ])),


                          Expanded(
                              flex:1,
                              child: Column(children: [

                                SizedBox(
                                  height: 80,
                                  child: OverflowBox(
                                    minHeight: 160,
                                    maxHeight: 160,
                                    child:Lottie.asset('assets/rage.json',
                                    ),
                                  ),
                                ),

                                Text('5%',style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFEE3A4E),
                                )),



                              ])),


                          Expanded(
                              flex:1,
                              child: Column(children: [
                                SizedBox(
                                  height: 80,
                                  child: OverflowBox(
                                    minHeight: 160,
                                    maxHeight: 160,
                                    child:Lottie.asset('assets/relaxed.json',
                                    ),
                                  ),
                                ),

                                Text('20%',style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFC449),
                                )),



                              ]))




                        ],
                      ),


                      SizedBox(height:12),

                      Row(
                        children: [

                          Image.asset("assets/check_ic.png"),
                          SizedBox(width: 8),


                          Text('Customers are likely to recommend us',style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color:Color(0xFF979797)
                          )),

                        ],
                      ),


                      SizedBox(height:5),





                    ],
                  ),
                ],
              ),

            ),
          ),

          SizedBox(height:15),

          Card(
            color: Color(0xFFF9F9F9),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              height: 150,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Stack(
                    children: [

                      Row(
                        children: [

                          Container(

                             transform: Matrix4.translationValues(-38.0, -45.0, 0.0),
                              child: Opacity(
                                  opacity: 0.5,
                                  child: Image.asset("assets/side_arc.png")))
                        ],
                      ),

                      Column(
                        children: [

                          SizedBox(height: 15),

                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('All India Rank',style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                          ),

                          SizedBox(height: 2),


                          Text('200',style: TextStyle(
                            fontSize: 37.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: AppTheme.themeColor,
                          )),


                        ],
                      )


                    ],
                  ),



                  Expanded(
                    child: SizedBox(
                      height: 170,
                      child: OverflowBox(
                        minHeight: 160,
                        maxHeight: 160,
                        child:Lottie.asset('assets/podium.json',
                        ),
                      ),
                    ),
                  ),



               


               /*   Text('Net Promotor Score',style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),

                  SizedBox(height: 2),*/






                ],
              ),

            ),
          ),
          SizedBox(height:15),


          Card(
            color: Color(0xFFF9F9F9),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10),





                     Padding(
                       padding: const EdgeInsets.only(left: 5),
                       child: Text('Top & Bottom 3',style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF383838),
                  )),
                     ),

                  SizedBox(height: 10),

                  Container(
                    height: 43,
                 //   margin: EdgeInsets.symmetric(horizontal: 8),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                      color:Colors.white.withOpacity(0.80),
                    ),


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text('Top 3',style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0FCD15).withOpacity(0.97),
                          )),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Score',style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C68C9).withOpacity(0.97),
                          )),
                        ),


                      ],
                    ),



                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_green.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Quality of service',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller2,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_green.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Servicing time',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '67%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller3,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_green.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Cost of service',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '82%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Problem Understanding',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    height: 43,
                    //   margin: EdgeInsets.symmetric(horizontal: 8),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                      color:Colors.white.withOpacity(0.80),
                    ),


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text('Bottom 3',style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF0000).withOpacity(0.97),
                          )),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Score',style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C68C9).withOpacity(0.97),
                          )),
                        ),


                      ],
                    ),



                  ),


                  SizedBox(height: 5),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller4,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_red.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Servicing team interaction',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFF0000).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller5,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_red.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Service procedures',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFF0000).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: ExpandedTile(
                      controller: _controller6,
                      theme: const ExpandedTileThemeData(
                        headerColor: Color(0xFFF3F3F3),
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.only(top: 10,bottom: 10),
                        titlePadding: EdgeInsets.zero,
                        //headerSplashColor: Colors.red,
                        //
                        // contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(5.0),
                        contentRadius: 2.0,
                      ),
                      title:  Container(
                        color: Color(0xFFF3F3F3),
                        child: Row(
                          children: [

                            SizedBox(width: 8),


                            Image.asset("assets/arrow_red.png"),

                            SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Service reach',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF383838).withOpacity(0.97),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF383838).withOpacity(0.97),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                          ],
                        ),
                      ),

                      content:Container(
                        color: Colors.white,
                        child: Column(
                          children: [

                            SizedBox(height: 10),


                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFF0000).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            Divider(),

                            Row(
                              children: [

                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Wait time for opening job card',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF707070).withOpacity(0.97),
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0FCD15).withOpacity(0.97),
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ),


/*
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 5),
                            child: Icon(Icons.keyboard_arrow_down,size: 31),
                          )*/



                              ],
                            ),

                            SizedBox(height: 10)


                          ],
                        ),
                      ),

                      onTap: () {

                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },

                    ),
                  ),


                ],
              ),

            ),
          ),

          SizedBox(height: 15),


          Card(
            color: Color(0xFFF9F9F9),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 5),


                  Row(
                    children: [

                      Text('My Huddle',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                      Spacer(),


                      Text('View All',style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: AppTheme.themeColor,
                      )),

                     SizedBox(width: 3),

                     // Image.asset("assets/forward.png")

                      Icon(Icons.arrow_right_alt_rounded,color: AppTheme.themeColor)







                    ],
                  ),

                  SizedBox(height: 10),


                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 10),


                        Row(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Total Huddle Count',style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),
                                ),
                                SizedBox(height: 3),

                                Padding(
                                  padding: const EdgeInsets.only(left: 65),
                                  child: Text('50',style: TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.themeColor,
                                  )),
                                ),

                                SizedBox(height: 5),
                              ],
                            ),


                            Expanded(
                              child:   SizedBox(
                                height: 70,
                                child: OverflowBox(
                                  minHeight: 160,
                                  maxHeight: 160,
                                  child:Lottie.asset('assets/huddle_an.json',
                                  ),
                                ),
                              ),
                            )



                          ],
                        ),

                        SizedBox(height: 5),


                        Container(
                          height: 52,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white), // background
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    AppTheme.themeColor), // fore
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ))),
                            onPressed: () {

                            },
                            child: const Text(
                              'Create New Huddle',
                              style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),


                      ],
                    ),
                  ),


                  SizedBox(height: 20),



                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    
                    child: Row(
                      children: [
                        
                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              selectedTab=1;
                            });
                          },
                          child: Container(


                            child: Center(
                              child: Text('Completed Huddles',style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: selectedTab==1?FontWeight.w600:FontWeight.w500,
                                  color:selectedTab==1?Colors.black:Color(0xFF727272)
                              )),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: selectedTab==1?Color(0xFF95B3E4):Colors.white
                            ),
                          ),
                        ),flex: 1),



                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              selectedTab=2;
                            });
                          },
                          child: Container(


                            child: Center(
                              child: Text('Upcoming Sessions',style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: selectedTab==2?FontWeight.w600:FontWeight.w500,
                                  color:selectedTab==2?Colors.black:Color(0xFF727272)
                              )),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: selectedTab==2?Color(0xFF95B3E4):Colors.white
                            ),
                          ),
                        ),flex: 1)







                      ],
                    ),
                    
                    
                  ),

                  SizedBox(height: 15),


                  selectedTab==1?


                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        

                        Text('Huddle Name',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2962FF),
                        )),

                        Text('Simply dummy text of the printing....',style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),



                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Date & Time',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('21 Nov 2023 11:00 AM',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            ),



                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Issues',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('3 issues',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Member',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('20',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            )



                          ],
                        ),


                        SizedBox(height: 25),
                        Container(
                          height: 52,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white), // background
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Color(0xFf2CC92C)), // fore
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ))),
                            onPressed: () {

                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 45),
                                
                                Text(
                                  'Closure',
                                  style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                                ),
                                
                                Lottie.asset("assets/right_arrow.json")
                                
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                      ],
                    ),
                  ):

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Row(
                          children: [
                            Text('Huddle Name',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2962FF),
                            )),

                            Spacer(),

                            Icon(
                                Icons.edit,
                              color: AppTheme.themeColor,
                            )



                          ],
                        ),

                        Text('Simply dummy text of the printing....',style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),



                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Date & Time',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('21 Nov 2023 11:00 AM',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            ),



                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Issues',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('3 issues',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Member',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2962FF),
                                )),

                                Text('20',style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),


                              ],
                            )



                          ],
                        ),


                        SizedBox(height: 25),
                        Container(
                          height: 52,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white), // background
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Color(0xFfDF0D0D)), // fore
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ))),
                            onPressed: () {

                            },
                            child: const Text(
                              'Remove Huddle',
                              style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                      ],
                    ),
                  )




                ],
              ),

            ),
          ),

          SizedBox(height: 15),



          Card(
            color: Color(0xFFF9F9F9),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 5),


                  Row(
                    children: [

                      Text('Action Plan',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                      Spacer(),


                      Text('View All',style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: AppTheme.themeColor,
                      )),

                      SizedBox(width: 3),

                       Image.asset("assets/view_all_ic.png")

                    //  Icon(Icons.arrow_right_alt_rounded,color: AppTheme.themeColor)







                    ],
                  ),




                  SizedBox(height: 20),



                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),

                    child: Row(
                      children: [

                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              selectedTab2=1;
                            });
                          },
                          child: Container(


                            child: Center(
                              child: Text('Create Action Plan',style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: selectedTab2==1?FontWeight.w600:FontWeight.w500,
                                  color:selectedTab2==1?Colors.black:Color(0xFF727272)
                              )),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: selectedTab2==1?Color(0xFF95B3E4):Colors.white
                            ),
                          ),
                        ),flex: 1),



                        Expanded(child: InkWell(
                          onTap: (){
                            setState(() {
                              selectedTab2=2;
                            });
                          },
                          child: Container(

                            child: Center(
                              child: Text('Action Plans',style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: selectedTab2==2?FontWeight.w600:FontWeight.w500,
                                  color:selectedTab2==2?Colors.black:Color(0xFF727272)
                              )),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: selectedTab2==2?Color(0xFF95B3E4):Colors.white
                            ),
                          ),
                        ),flex: 1)







                      ],
                    ),


                  ),

                  SizedBox(height: 15),

                 selectedTab2==1?
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(2),
                     color: Colors.white,

                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.4), // Color of the shadow
                         spreadRadius: 0, // Spread radius of the shadow
                         blurRadius: 5, // Blur radius of the shadow
                         offset: Offset(0, 0), // Offset of the shadow
                       ),
                     ],
                   ),

                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [


                       Text('Huddle Name',style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFF2962FF),
                       )),

                       Text('Simply dummy text of the printing....',style: TextStyle(
                         fontSize: 13.5,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                       )),



                       SizedBox(height: 10),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [


                       Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Date & Time',style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w500,
                             color: Color(0xFF2962FF),
                           )),
                             Text('21 Nov 2023 11:00 AM',style: TextStyle(
                             fontSize: 13.5,
                             fontWeight: FontWeight.w500,
                             color: Colors.black,
                           )),
                         ],
                       ),


                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Total Member',style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w500,
                             color: Color(0xFF2962FF),
                           )),
                           Text('20',style: TextStyle(
                             fontSize: 13.5,
                             fontWeight: FontWeight.w500,
                             color: Colors.black,
                           )),
                         ],
                       ),





                     ],

                     ),

                       SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [


                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text('Service Center',style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xFF2962FF),
                               )),

                               Text('Bajaj Service Center 1',style: TextStyle(
                                 fontSize: 13.5,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.black,
                               )),


                             ],
                           ),

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text('Created By',style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xFF2962FF),
                               )),

                               Text('Admin',style: TextStyle(
                                 fontSize: 13.5,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.black,
                               )),


                             ],
                           )
                         ],
                       ),

                       SizedBox(height: 17),
                       Container(
                         height: 52,
                         width: double.infinity,
                         margin: EdgeInsets.symmetric(horizontal: 35),
                         child: ElevatedButton(
                           style: ButtonStyle(
                               foregroundColor:
                               MaterialStateProperty.all<Color>(
                                   Colors.white), // background
                               backgroundColor:
                               MaterialStateProperty.all<Color>(
                                   AppTheme.themeColor), // fore
                               shape: MaterialStateProperty.all<
                                   RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                   ))),
                           onPressed: () {

                           },
                           child: const Text(
                             'Create Action Plan',
                             style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                           ),
                         ),
                       ),
                       SizedBox(height: 10),

                     ],
                   ),
                 ):
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(2),
                     color: Colors.white,

                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.4), // Color of the shadow
                         spreadRadius: 0, // Spread radius of the shadow
                         blurRadius: 5, // Blur radius of the shadow
                         offset: Offset(0, 0), // Offset of the shadow
                       ),
                     ],
                   ),

                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [


                       Text('Huddle Name',style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFF2962FF),
                       )),

                       Text('Simply dummy text of the printing....',style: TextStyle(
                         fontSize: 13.5,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                       )),



                       SizedBox(height: 10),

                       Text('Date & Time',style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: Color(0xFF2962FF),
                       )),

                       Text('21 Nov 2023 11:00 AM',style: TextStyle(
                         fontSize: 13.5,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                       )),


                       SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [


                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text('Created By',style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xFF2962FF),
                               )),

                               Text('Admin',style: TextStyle(
                                 fontSize: 13.5,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.black,
                               )),


                             ],
                           ),

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text('Status',style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xFF2962FF),
                               )),

                               Text('Open',style: TextStyle(
                                 fontSize: 13.5,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xFF1DC26A),
                               )),


                             ],
                           )
                         ],
                       ),

                       SizedBox(height: 17),
                       Container(
                         height: 52,
                         width: double.infinity,
                         margin: EdgeInsets.symmetric(horizontal: 35),
                         child: ElevatedButton(
                           style: ButtonStyle(
                               foregroundColor:
                               MaterialStateProperty.all<Color>(
                                   Colors.white), // background
                               backgroundColor:
                               MaterialStateProperty.all<Color>(
                                   AppTheme.themeColor), // fore
                               shape: MaterialStateProperty.all<
                                   RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(2.0),
                                   ))),
                           onPressed: () {

                           },
                           child: const Text(
                             'Mark As Completed',
                             style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins"),
                           ),
                         ),
                       ),
                       SizedBox(height: 10),

                     ],
                   ),
                 ),




                  SizedBox(height: 30),

                ],
              ),

            ),
          ),

        ],
      ),
    );
  }

}