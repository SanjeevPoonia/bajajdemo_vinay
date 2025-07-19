import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'calender_detail_screen.dart';

class CustomCalenderScreen extends StatefulWidget {
  CalenderState createState() => CalenderState();
}

class CalenderState extends State<CustomCalenderScreen> {
  List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 23),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Calendar',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:
      isLoading?
          Center(
            child: Loader(),
          ):

      Column(
        children: [
          SizedBox(height: 5),
          Container(
            height: 49,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4), // Color of the shadow
                    spreadRadius: 1, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius of the shadow
                    offset: Offset(0, 0), // Offset of the shadow
                  ),
                ],
                border: Border.all(color: Color(0xFfADBDD6), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  '2023',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF045FA0),
                      decoration: TextDecoration.underline),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Image.asset("assets/calender_ic.png",
                      color: AppTheme.themeColor),
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 90,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "December",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(width: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalenderDetailScreen('04')));
                },
                child: Container(
                  width: 47,
                  height: 48,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:
                    BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6),
                        // Color of the shadow
                        spreadRadius: 1,
                        // Spread radius of the shadow
                        blurRadius: 5,
                        // Blur radius of the shadow
                        offset: Offset(0,
                            0), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        '04',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            color: AppTheme.themeColor),
                      ),
                      Text(
                        'Mon',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [



                          Container(
                            width:5,
                            height:5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green
                            ),
                          ),







                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),



                    ],
                  ),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),


              SizedBox(width: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalenderDetailScreen('11')));
                },
                child: Container(
                  width: 47,
                  height: 48,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:
                    BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6),
                        // Color of the shadow
                        spreadRadius: 1,
                        // Spread radius of the shadow
                        blurRadius: 5,
                        // Blur radius of the shadow
                        offset: Offset(0,
                            0), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        '11',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            color: AppTheme.themeColor),
                      ),
                      Text(
                        'Mon',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [



                          Container(
                            width:5,
                            height:5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red
                            ),
                          ),







                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),



                    ],
                  ),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),

              SizedBox(width: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalenderDetailScreen('18')));
                },
                child: Container(
                  width: 47,
                  height: 48,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:
                    BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6),
                        // Color of the shadow
                        spreadRadius: 1,
                        // Spread radius of the shadow
                        blurRadius: 5,
                        // Blur radius of the shadow
                        offset: Offset(0,
                            0), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        '18',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            color: AppTheme.themeColor),
                      ),
                      Text(
                        'Mon',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [



                          Container(
                            width:5,
                            height:5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow
                            ),
                          ),







                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),



                    ],
                  ),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),

              SizedBox(width: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalenderDetailScreen('25')));
                },
                child: Container(
                  width: 47,
                  height: 48,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:
                    BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6),
                        // Color of the shadow
                        spreadRadius: 1,
                        // Spread radius of the shadow
                        blurRadius: 5,
                        // Blur radius of the shadow
                        offset: Offset(0,
                            0), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3),
                      Text(
                        '25',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w600,
                            color: AppTheme.themeColor),
                      ),
                      Text(
                        'Mon',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [



                          Container(
                            width:5,
                            height:5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.themeColor
                            ),
                          ),







                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),



                    ],
                  ),
                  margin: EdgeInsets.only(left: 5),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCalenderDetails();
  }


  fetchCalenderDetails() async {
    setState(() {
      isLoading=true;
    });
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('huddle-calender',context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    //huddleDetails= responseJSON['huddle_details'];



    setState(() {});

  }
}
