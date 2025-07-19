


import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toast/toast.dart';

import '../network/api_dialog.dart';
import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'custom_calender.dart';
import 'huddle_details_screen.dart';

class MyHuddleScreen extends StatefulWidget
{
  MyHuddleState createState()=>MyHuddleState();
}


class MyHuddleState extends State<MyHuddleScreen>
{
  DateTime? _selectedDate;
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  bool isLoading=false;
  List<dynamic> huddleList=[];
  List<dynamic> huddleListAllData=[];
  String submittedHuddle="";
  String expiredHuddle="";
  int selectedTab=0;
  bool check1=false;
  int selectedRadioButton=0;
  int selectedRadio=0;
  List<int> selectedIndices=[];
  List<dynamic> nameList=[

  ];

  List<String> filterList=[
    "All",
    "Upcoming",
    "Submitted",
    "Expired",

  ];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 23),
          onPressed: () {
            //  _logOut();
            // Add your right button action here
          },
        ),
        title: Text(
          'My Huddle',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [




          IconButton(
              icon: Image.asset(
                'assets/calender_white.png',
                width: 22,
                height: 22,
              ),
              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder: (context)=>CustomCalenderScreen()));
                // _bottomSheetFilter();
              }),

          Container(

            child: Stack(
              children: [

                //calender_white



                IconButton(
                    icon: Image.asset(
                      'assets/bell.png',
                      width: 22,
                      height: 22,
                    ),
                    onPressed: () {
                      // _bottomSheetFilter();
                    }),
                Container(
                    transform: Matrix4.translationValues(22.0, 10.0, 0.0),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFf5619D1)),
                    child: Center(
                      child: Text('10',
                          style: TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ),
        ],
      ),
      body:

      isLoading?
          Center(
            child: Loader(),
          ):


      Column(

        children: [

          SizedBox(height:10),


          Row(
            children: [
              Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: 10),
                    color: Color(0xFfF9F9F9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xFfF9F9F9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Stack(
                                    //  alignment: Alignment.topRight,
                                    children: [
                                      Row(
                                        children: [
                                          Spacer(),
                                          Image.asset(
                                              "assets/tiles_1.png"),
                                        ],
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(height: 8),
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  left: 11),
                                              child: Text(
                                                  'Submitted Huddle',
                                                  style:
                                                  TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                    12.0,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left:
                                                      11),
                                                  child: Text(
                                                      submittedHuddle,
                                                      style:
                                                      TextStyle(
                                                        fontSize:
                                                        21.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                        color: AppTheme.themeColor,
                                                      )),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 5),
                                          ]),
                                    ],
                                  )),
                              /* Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CustomerFeedbackScreen()));
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [


                                          ],
                                        ),
                                      ))*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 1),

              SizedBox(width: 11),
              Expanded(
                  child: Card(
                    margin: EdgeInsets.only(right: 10),
                    color: Color(0xFfF9F9F9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xFfF9F9F9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Stack(
                                    //  alignment: Alignment.topRight,
                                    children: [
                                      Row(
                                        children: [
                                          Spacer(),
                                          Image.asset(
                                              "assets/tiles_2.png"),
                                        ],
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(height: 8),
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  left: 11),
                                              child: Text(
                                                  'Expired Huddle',
                                                  style:
                                                  TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                    12.0,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left:
                                                      11),
                                                  child: Text(
                                                      expiredHuddle,
                                                      style:
                                                      TextStyle(
                                                        fontSize:
                                                        21.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                        color: AppTheme.themeColor,
                                                      )),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 5),
                                          ]),
                                    ],
                                  )),
                              /* Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CustomerFeedbackScreen()));
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [


                                          ],
                                        ),
                                      ))*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 1),
            ],
          ),
          SizedBox(height:12),
          Container(
            height: 50,
            decoration:  BoxDecoration(
                color: Colors.white,


                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Color of the shadow
                    spreadRadius: 2, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius of the shadow
                    offset: Offset(0, 0), // Offset of the shadow
                  ),
                ],

                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              children: [


                Expanded(child:   GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedTab=0;
                    });
                  },
                  child: Container(
                    height:40,
                    decoration:  BoxDecoration(
                        color: selectedTab==0?Color(0xFF95B3E4):Colors.white,
                        borderRadius: BorderRadius.circular(6)
                    ),

                    child: Center(
                      child:  Text('Huddle Utility',
                          style: TextStyle(
                              fontSize: 11, color: selectedTab==0?Colors.black:Color(0xFF727272),fontWeight: selectedTab==0?FontWeight.w600:FontWeight.w500)),
                    ),
                  ),
                ),flex: 1,
                ),

                SizedBox(width: 5),
                Expanded(child:   GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedTab=1;
                    });
                  },
                  child: Container(
                    height:40,
                    decoration:  BoxDecoration(
                        color: selectedTab==1?Color(0xFF95B3E4):Colors.white,
                        borderRadius: BorderRadius.circular(6)
                    ),

                    child: Center(
                      child:  Text('Planned Huddles',
                          style: TextStyle(
                              fontSize: 11, color: selectedTab==1?Colors.black:Color(0xFF727272),fontWeight: selectedTab==1?FontWeight.w600:FontWeight.w500)),
                    ),
                  ),
                ),flex: 1,
                ),



                
              ],
            ),


          ),

          SizedBox(height:12),



          selectedTab==0?
          Container(
            //  height: 43,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Show Expired',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.themeColor)),
                GestureDetector(
                    onTap: (){
                      showOnlyExpired();


                    },

                    child: Container(
                        child: check1?
                        Icon(Icons.check_box,color: AppTheme.themeColor,size: 28):
                        Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFfD7C8C0),size: 28)
                    ))
              ],
            ),
          ):
          Container(
            //  height: 43,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(filterList[selectedRadioButton],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.themeColor)),

                InkWell(
                    onTap: () {
                      filterBottomSheet();
                    },
                    child: Image.asset(
                      "assets/filter_ic.png",
                      width: 38,
                      height: 38,
                    ))


              ],
            ),
          ),

          SizedBox(height: 15),






          Expanded(child: ListView.builder(
              itemCount: huddleList.length,
              itemBuilder: (BuildContext context,int pos)
          {
            return Column(
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Color of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                        blurRadius: 5, // Blur radius of the shadow
                        offset: Offset(0, 0), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                          decoration: BoxDecoration(
                            color: huddleList[pos]["huddle_status"]=="pending"?
                            Color(0xFFFFEFCA):
                            huddleList[pos]["huddle_status"]=="submitted"?

                                    Color(0xFfCFEAD6):

                            huddleList[pos]["huddle_status"]=="expired"?

                                        Color(0xFFFFC4C4):

                            AppTheme.themeColor.withOpacity(0.23),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 9),
                              Text('Date and Time',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.themeColor)),
                              Spacer(),
                              Text(parseServerFormatDate(huddleList[pos]["date"].toString()),
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),


                              SizedBox(width: 9),


                            ],
                          )
                      ),

                      huddleList[pos]["huddle_status"]=="expired"
                          || selectedTab==1

                          ?Container():

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 9),
                              Text('Actual Huddle Date',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.themeColor)),
                              Spacer(),




                              InkWell(
                                onTap: (){
                                  if(huddleList[pos]["huddle_status"]=="submitted")
                                    {


                                    }
                                  else
                                    {

                                      _pickDateDialog();

                                      //open Calender
                                    }
                                },
                                child: Container(
                                  height: 39,
                                  width:120,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)
                                  ),

                                  child: DottedBorder(
                                    dashPattern: [5,5],
                                    borderType: BorderType.RRect,

                                    color: Color(0xFF707070),
                                    radius: Radius.circular(4),
                                    //  padding: EdgeInsets.all(6),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                        child:Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Row(

                                            children: [
                                              SizedBox(width: 7),

                                              Image.asset("assets/calender_grey.png"),

                                              Spacer(),


                                              Text(huddleList[pos]["huddle_status"]=="submitted"?parseServerFormatDate(huddleList[pos]["actual_date"].toString()):

                                         _selectedDate==null?
                                             "Select":
                                              parseServerFormatDate(_selectedDate.toString()),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color(0xFf797979))),
                                              SizedBox(width: 7),

                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 9),


                            ],
                          )
                      ),
                      huddleList[pos]["huddle_status"]=="expired"  || selectedTab==1?Container():
                      SizedBox(height:3),
                      huddleList[pos]["huddle_status"]=="expired"  || selectedTab==1?Container():
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 1,
                        color: Colors.grey.withOpacity(0.4),
                        width: double.infinity,
                      ),

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 9),
                              Text('Status',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.themeColor)),
                              Spacer(),
                              Text(

                                  huddleList[pos]["huddle_status"]=="pending"?

                                  'Pending':

                                  huddleList[pos]["huddle_status"]=="submitted"?

                                  'Submitted':

                                  huddleList[pos]["huddle_status"]=="expired"?

                                  'Expired':

                                  'Upcoming',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color:


                                      huddleList[pos]["huddle_status"]=="pending"?

                                              Color(0xFFFFBB1C):


                                      huddleList[pos]["huddle_status"]=="submitted"?

                                          Color(0xFF2EA44C):

                                      huddleList[pos]["huddle_status"]=="expired"?

                                          Color(0xFFDB0000):


                                      AppTheme.themeColor)),


                              SizedBox(width: 9),


                            ],
                          )
                      ),


                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 1,
                        color: Colors.grey.withOpacity(0.4),
                        width: double.infinity,
                      ),


                      huddleList[pos]["huddle_status"]=="expired"?Container():

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 9),

                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text('Past week\'s Feedbacks',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.themeColor)),

                                  Text(huddleList[pos]["past_feedback"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),

                                ],
                              )),

                              Container(
                                height: 70,
                                width: 1,
                                color: Colors.grey.withOpacity(0.4),
                              ),

                              SizedBox(width: 9),

                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text('This week\'s Feedbacks',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.themeColor)),

                                  Text(huddleList[pos]["this_week_feedback"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),

                                ],
                              )),

                              SizedBox(width: 9),


                            ],
                          )
                      ),
                      huddleList[pos]["huddle_status"]=="expired"?Container():

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 1,
                        color: Colors.grey.withOpacity(0.4),
                        width: double.infinity,
                      ),

                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 9),

                              Icon(Icons.person,color: AppTheme.themeColor),
                              SizedBox(width: 4),
                              Text('Select User',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.themeColor)),
                              Spacer(),
                              huddleList[pos]["huddle_status"]=="pending" || huddleList[pos]["huddle_status"]=="upcoming" && huddleList[pos]['members'].length==0?
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedRadio=0;
                                      });

                                    },

                                    child:

                                    selectedRadio==0?
                                    Icon(
                                      Icons.radio_button_checked,color: AppTheme.themeColor,
                                    ):Icon(Icons.radio_button_off),





                                  ),

                                  SizedBox(width: 4),
                                  Text('All',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.themeColor)),


                                  SizedBox(width: 10),



                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedRadio=1;
                                      });

                                      selectedIndices.clear();

                                      _modalBottomSheetUsers();

                                    },

                                    child:

                                    selectedRadio==1?
                                    Icon(
                                      Icons.radio_button_checked,color: AppTheme.themeColor,
                                    ):Icon(Icons.radio_button_off),





                                  ),

                                  SizedBox(width: 4),
                                  Text('Select',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.themeColor)),
                                ],
                              ):

                            InkWell(
                                onTap:(){
                                  if(huddleList[pos]['members'].length!=0)
                                    {
                                      _modalBottomSheetViewUsers(huddleList[pos]['members']);
                                    }
          },
                                    child: Container(

                                child: Row(
                                    children: [

                                      Icon(Icons.remove_red_eye_outlined,color: AppTheme.themeColor),
                                      SizedBox(width: 4),
                                      Text(huddleList[pos]['members'].length.toString()+' Selected',
                                          style: TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w600,
                                              color: AppTheme.themeColor)),

                                    ],
                                ),

                              ),
                                  ),


                              SizedBox(width: 9),


                            ],
                          )
                      ),

                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 1,
                        color: Colors.grey.withOpacity(0.4),
                        width: double.infinity,
                      ),
                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      SizedBox(height: 17),



                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [


                            Expanded(child: Container(
                              height: 44,
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
                                          borderRadius: BorderRadius.circular(4.0),
                                        ))),
                                onPressed: () {

                                  String huddleID="";
                                  huddleID=huddleList[pos]["id"].toString();


                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HuddleDetailsScreen(huddleID)));


                                },
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(fontSize: 13.5,color: Colors.white,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),flex: 1),

                            SizedBox(width: 15),


                            huddleList[pos]["huddle_status"]=="submitted"?Container():

                            Expanded(child: Container(
                              height: 44,
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
                                          borderRadius: BorderRadius.circular(4.0),
                                        ))),
                                onPressed: () {

                                  updateHuddleDetails(huddleList[pos]["id"].toString());


                                },
                                child: const Text(
                                  'Save',
                                  style: TextStyle(fontSize: 13.5,color: Colors.white,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),flex: 1),
                          ],
                        ),
                      ),
                      huddleList[pos]["huddle_status"]=="expired"?Container():
                      SizedBox(height: 15),
                    ],
                  ),
                ),

                SizedBox(height: 12),

              ],
            );
          }

          ))




        ],
      ),
    );

  }
  void _modalBottomSheetUsers() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFf707070),width: 1),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: 23,
                      ),


                      Container(
                        width: 111,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF929292)
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.close_rounded),
                        ),
                      )


                    ],
                  ),


                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Search User',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor

                    )),
                  ),

                  SizedBox(height: 2),

                  Divider(),

                  SizedBox(height: 4),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    /* decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black45,width: 1)
                          ),*/
                    child: TextFormField(
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF707070),
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Image.asset("assets/search_icc.png"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide:
                              BorderSide(color: Color(0xFF707070), width: 0.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide:
                                BorderSide(color: Color(0xFF707070), width: 0.2)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.red, width: 0.2)),
                            //contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 5, 5),
                            //prefixIcon: fieldIC,
                            hintText: "Search Caller",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF707070).withOpacity(0.4),
                            ))),
                  ),

                  SizedBox(height: 5),


                  Container(
                    height: 174,
                    child: ListView.builder(
                        itemCount: nameList.length,

                        itemBuilder: (BuildContext context,int pos)
                        {
                          return InkWell(
                            onTap: (){



                            },
                            child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                              child: Row(
                                children: [

                                  SizedBox(width: 15),



                                  GestureDetector(
                                    onTap: (){

                                      if(selectedIndices.contains(nameList[pos]["id"]))
                                        {
                                          selectedIndices.remove(nameList[pos]["id"]);
                                        }
                                      else
                                        {
                                          selectedIndices.add(nameList[pos]["id"]);
                                        }
                                      setModalState(() {

                                      });

                                    },

                                    child:

                                    selectedIndices.contains(nameList[pos]["id"])?

                                        Icon(Icons.check_box,color: AppTheme.themeColor):
                                    Icon(Icons.check_box_outline_blank)
                                  ),

                                  SizedBox(width: 7),


                                  Expanded(child: Text(nameList[pos]["name"],style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black

                                  )))


                                ],
                              ),


                            ),
                          );
                        }


                    ),
                  ),
                  SizedBox(height: 10),


                  Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
                                borderRadius: BorderRadius.circular(4.0),
                              ))),
                      onPressed: () {
                        if(selectedIndices.length!=0)
                        {
                          Navigator.pop(context);
                        }

                      },
                      child: const Text(
                        'Select',
                        style: TextStyle(fontSize: 14.5,color: Colors.white),
                      ),
                    ),
                  ),




                  const SizedBox(height: 18),
                ],
              ),
            );
          }),
    );
  }


  void _modalBottomSheetViewUsers(List<dynamic> agentList) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFf707070),width: 1),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: 23,
                      ),


                      Container(
                        width: 111,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF929292)
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.close_rounded),
                        ),
                      )


                    ],
                  ),


                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Selected User',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor

                    )),
                  ),

                  SizedBox(height: 2),

                  Divider(),

                  SizedBox(height: 4),



                  Container(
                    height: 174,
                    child: ListView.builder(
                        itemCount: agentList.length,

                        itemBuilder: (BuildContext context,int pos)
                        {
                          return InkWell(
                            onTap: (){



                            },
                            child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                              child: Row(
                                children: [

                                  SizedBox(width: 15),


                                  Expanded(child: Text(agentList[pos]["name"],style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black

                                  )))


                                ],
                              ),


                            ),
                          );
                        }


                    ),
                  ),
                  SizedBox(height: 10),


                  Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
                                borderRadius: BorderRadius.circular(4.0),
                              ))),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(fontSize: 14.5,color: Colors.white),
                      ),
                    ),
                  ),




                  const SizedBox(height: 18),
                ],
              ),
            );
          }),
    );
  }

  void filterBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFf707070),width: 1),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: 23,
                      ),


                      Container(
                        width: 111,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF929292)
                        ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.close_rounded),
                        ),
                      )


                    ],
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Sort by',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor

                    )),
                  ),

                  SizedBox(height: 2),

                  Divider(),

                  SizedBox(height: 4),



                  ListView.builder(
                      itemCount: filterList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context,int pos)
                  {
                    return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [



                          GestureDetector(
                            onTap: (){

                              selectedRadioButton=pos;

                              setModalState(() {

                              });

                            },

                            child: selectedRadioButton==pos?Icon(Icons.radio_button_checked,color: AppTheme.themeColor):  Icon(Icons.radio_button_off),
                          ),

                          SizedBox(width: 15),

                          Expanded(child:  Text(filterList[pos],style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black

                          )),)

                        ],
                      ),
                    );
                  }

                  ),


                  SizedBox(height: 18),


                  Container(
                    height: 53,
                    width:double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15),

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
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                      onPressed: () {
                        filterData();
                      },
                      child: const Text(
                        'Apply',
                        style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),



                  const SizedBox(height: 18),
                ],
              ),
            );
          }),
    );
  }


  fetchAllHuddles() async {
    setState(() {
      isLoading=true;
    });

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('show-all-huddle',context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    huddleList= responseJSON["data"]['details'];
    huddleListAllData= responseJSON["data"]['details'];
    print("Length of hgewfef  "+huddleListAllData.length.toString());
    submittedHuddle= responseJSON["data"]['submitted_count'].toString();
    expiredHuddle= responseJSON["data"]['expired_count'].toString();
    setState(() {});

  }

  filterData(){
    List<dynamic> upcoming=[];
    List<dynamic> submitted=[];
    List<dynamic> expired=[];


    if(selectedRadioButton==0)
      {
        huddleList=huddleListAllData;
        setState(() {

        });
      }
    else if(selectedRadioButton==1)
      {
        for(int i=0;i<huddleListAllData.length;i++)
        {
           if(huddleListAllData[i]["huddle_status"]=="upcoming")
          {
            upcoming.add(huddleListAllData[i]);
          }
        }
        huddleList=upcoming;
        setState(() {

        });
      }
    else if(selectedRadioButton==2)
    {
      for(int i=0;i<huddleListAllData.length;i++)
      {
        if(huddleListAllData[i]["huddle_status"]=="submitted")
        {
          submitted.add(huddleListAllData[i]);
        }
      }
      huddleList=submitted;
      setState(() {

      });
    }
    else if(selectedRadioButton==3)
    {
      for(int i=0;i<huddleListAllData.length;i++)
      {
        if(huddleListAllData[i]["huddle_status"]=="expired")
        {
          expired.add(huddleListAllData[i]);
        }
      }
      huddleList=expired;
      setState(() {

      });
    }

    Navigator.pop(context);

  }




updateHuddleDetails(String huddleID) async {
  String userIDs="";

  print(selectedIndices.toString());

   if(selectedIndices.length!=0)
     {
       userIDs=selectedIndices.toString();
       userIDs=userIDs.substring(1,userIDs.length-2);
     }
   print(userIDs);


    APIDialog.showAlertDialog(context,"Saving details..");

    var requestModel = {
      "huddle_id":huddleID,
      "user_ids":userIDs,
      "actual_date":_selectedDate==null?"":_selectedDate.toString(),
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('update-date-or-add-users',requestModel,context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON['status'])
    {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
    }
    else
    {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }

  }
  showOnlyExpired(){
    if(!check1)
      {
        List<dynamic> newHuddle=[];

        print("Length of "+huddleListAllData.length.toString());
        for(int i=0;i<huddleListAllData.length;i++)
        {

          print(huddleListAllData[i]["huddle_status"]);

          if(huddleListAllData[i]["huddle_status"]=="expired")
            {
              newHuddle.add(huddleListAllData[i]);
            }
        }

        huddleList=newHuddle;



        print("Huddle sss"+huddleList.toString());
        setState(() {
          check1=!check1;
        });

      }
    else
      {

        huddleList=huddleListAllData;
        print("Huddle rrr"+huddleList.toString());

        setState(() {
          check1=!check1;
        });

      }




  }



  fetchAgentList() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('huddle-users',context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    nameList= responseJSON["data"];
    setState(() {});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllHuddles();
    fetchAgentList();
  }
  void _pickDateDialog() {
    showDatePicker(

        context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  String parseServerFormatDate(String serverDate) {
    var date = DateTime.parse(serverDate);
    final dateformat = DateFormat.yMd();
    final clockString = dateformat.format(date);
    return clockString.toString();
  }



}