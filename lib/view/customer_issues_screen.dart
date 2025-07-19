import 'dart:convert';

import 'package:bajaj_app/network/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../network/api_helper.dart';
import '../utils/app_theme.dart';
import 'calender_screen.dart';
import 'customer_feedback_screen.dart';
import 'feedback_details.dart';

class CustomerScreen extends StatefulWidget {
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<CustomerScreen> {
  List<dynamic> customerList = [];
  int selectedIndex = 1;
  var searchController = TextEditingController();
  List<bool> feedbackStatusSelected = [false, false, false, false];
  String NPSRatingFilter = "";
  String BranchFilter = "";
  List<String> feedbackStatusList = [
    "Open",
    "In-Progress",
    "Completed",
    "Closed"
  ];

  int selectedStatusFilter = 9999;
  int selectedNPSRatingFilter = 9999;
  int selectedSelectBranchFilter = 9999;

  List<bool> npsSelected = [false, false, false];
  List<String> npsList = ["Promotor", "Detractor", "Passive"];

  int ticketStatus = 1;

  List<bool> dateRangeSelected = [false, false, false, false, false];
  List<String> dateRangeList = [
    "Week To Date",
    "Month To Date",
    "Previous Month",
    "Year To Date",
    "Previous Year"
  ];
  List<bool> branchSelected = [];
  List<dynamic> branchList = [];

  List<String> regionList = [];
  int selectedTab = 9999;

  bool isLoading = false;
  bool isChildLoading = false;
  Map<String, dynamic> dashboardCountData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Huddle Utility',
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
        ],
      ),
      body: isLoading
          ? Center(child: Loader())
          : ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalenderView()));
                  },
                  child: Container(
                    height: 43,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    color: Color(0xFFEBEBEB),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('27-11-2023 - 27-11-2023',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        Image.asset("assets/calender_ic.png")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),








                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.4), // Color of the shadow
                          spreadRadius: 0, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Expanded(
                                child: Card(
                                  margin: EdgeInsets.only(left: 7),
                                  color: Color(0xFfF9F9F9),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    height: 146,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      //color: Color(0xFfF9F9F9),
                                    ),
                                    // height: 93,
                                    // width: 180,
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
                                                          SizedBox(height: 16),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15),
                                                            child: Text(
                                                                'Total NPS feedbacks',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0,
                                                                  color: Color(
                                                                      0xFF707070),
                                                                )),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15),
                                                                child: Text(
                                                                    dashboardCountData
                                                                            .isEmpty
                                                                        ? '0'
                                                                        : dashboardCountData['nps_counts']['Total']
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          21.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    )),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              
                                                              SizedBox(
                                                                  height:21,
                                                                width: 21,
                                                                child: Lottie.asset("assets/d1.json"),
                                                              ),
                                                              Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              15),
                                                                  child: Text(
                                                                      dashboardCountData
                                                                              .isEmpty
                                                                          ? '0'
                                                                          : dashboardCountData['nps_counts']['Promoter']
                                                                              .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              Color(0xFF2EA44C)))),


                                                            /*  Expanded(
                                                                child: SizedBox(
                                                                  height: 22,
                                                                  child: OverflowBox(
                                                                    minHeight: 21,
                                                                    maxHeight: 21,
                                                                    child: Lottie.asset('assets/d2.json'),
                                                                  ),
                                                                ),
                                                              ),*/



                                                              Container(
                                                                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),

                                                                  child:Row(
                                                                      children: [

                                                                        RotatedBox(
                                                                            quarterTurns: 2,
                                                                            child: SizedBox(
                                                                              height: 22,
                                                                              width:20,
                                                                              child: Lottie.asset(
                                                                                'assets/d2.json',
                                                                              ),
                                                                            ),
                                                                        ),


                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.only(right: 5),
                                                                          child: Text(dashboardCountData.isEmpty?'0':
                                                                          dashboardCountData['nps_counts']['Detractor'].toString(),
                                                                              style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w700,
                                                                                  color: Color(0xFFDB0000))),
                                                                        ),
                                                                      ],
                                                                  )
                                                              )
                                                            ],
                                                          ),

                                                          SizedBox(height: 18),
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
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Divider()),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomerFeedbackScreen()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5, left: 6),
                                            child: Row(
                                              children: [
                                                //SizedBox(height: 12),
                                               /* Container(
                                                  child: Text('L2 Drilldown',
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              AppTheme.themeColor,
                                                          fontWeight:
                                                              FontWeight.w800)),
                                                ),*/
                                                /* SizedBox(
                                                  //height: 80,
                                                  child: Lottie.asset('assets/info_anim.json',
                                                  ),
                                                ),*/

                                                Expanded(
                                                  child:   Stack(
                                                     children: [

                                                  Container(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text('L2 Drilldown',
    style: TextStyle(
    fontSize: 11.0,
    color:
    AppTheme.themeColor,
    fontWeight:
    FontWeight.w800))),
                                                       Container(
                                                         transform: Matrix4.translationValues(37.0, 0.0, 0.0),
                                                         height: 40,
                                                         child: OverflowBox(
                                                           minHeight: 120,
                                                           maxHeight: 120,
                                                           child: Lottie.asset(
                                                             'assets/info_anim.json',
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                  )
                                                ),

                                                /*  SizedBox(
                                                  height: 60,
                                                  child: Lottie.asset('assets/info_anim.json'),
                                                ),*/
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1),
                            SizedBox(width: 8),
                            Expanded(
                                child: InkWell(
                                  onTap: (){
                                    if(selectedTab==5)
                                      {
                                        selectedTab=9999;
                                        setState(() {

                                        });
                                        ticketStatus=1;
                                        fetchCustomerDetails();
                                      }
                                    else
                                      {

                                        setState(() {
                                          selectedTab=5;
                                        });
                                      }

                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 7),
                                    color: selectedTab==5?AppTheme.themeColor:
                                    Color(0xFfF9F9F9),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 146,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFfF9F9F9),
                                      ),
                                      // height: 93,
                                      // width: 180,
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
                                                              "assets/mask.png",
                                                              width: 93,
                                                              height: 89),
                                                        ],
                                                      ),
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(height: 16),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15),
                                                              child: Text(
                                                                  'Tickets Open for the Day',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0,
                                                                    color:
                                                                    selectedTab==5?Colors.white:
                                                                    Color(
                                                                        0xFF707070),
                                                                  )),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15),
                                                              child: Text("16",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        21.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: selectedTab==5?Colors.white: Colors
                                                                        .black,
                                                                  )),
                                                            ),
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
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Divider()),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5, left: 10),
                                            child: Row(
                                              children: [


                                                SizedBox(
                                                  height: 34,
                                                  child: Lottie.asset(
                                                    'assets/d3.json',
                                                  ),
                                                ),

                                                SizedBox(width: 5),
                                                //SizedBox(height: 12),
                                                Container(
                                                  child: Text('Overdue',
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              Color(0xFfFFBB1C),
                                                          fontWeight:
                                                              FontWeight.w800)),
                                                ),
                                                Spacer(),
                                                Container(
                                                  child: Text('8',
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color:
                                                              Color(0xFfFFBB1C),
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                SizedBox(width: 12),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                  onTap: () {

                                    if(selectedTab==1)
                                      {
                                        removeSelection();
                                      }
                                    else
                                      {
                                        selectedTab = 1;
                                        ticketStatus = 0;
                                        setState(() {});
                                        fetchCustomerDetails();
                                      }



                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 7),
                                    color: selectedTab == 1
                                        ? AppTheme.themeColor
                                        : Color(0xFfF9F9F9),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFfF9F9F9),
                                      ),
                                      //  height: 101,
                                      width: 180,
                                      child: Stack(
                                        //  alignment: Alignment.topRight,
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                  "assets/d1.png",
                                                  width: 83,
                                                  height: 99)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 12),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text('Open Tickets',
                                                    style: TextStyle(
                                                      fontSize: 11.0,
                                                      color: selectedTab == 1
                                                          ? Colors.white
                                                          : Color(0xFF707070),
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                    dashboardCountData.isEmpty
                                                        ? '0'
                                                        : dashboardCountData[
                                                                    'ticket_status_counts']
                                                                ['Open']
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 21.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: selectedTab == 1
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )),
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            bottom: 5),
                                                    child: Text(
                                                        'Tickets Open Today',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTab ==
                                                                    1
                                                                ? Colors.white
                                                                : Colors
                                                                    .black)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            bottom: 5),
                                                    child: Text(
                                                        dashboardCountData
                                                                .isEmpty
                                                            ? '0'
                                                            : dashboardCountData[
                                                                        'ticket_status_counts']
                                                                    [
                                                                    'OpenToday']
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTab ==
                                                                    1
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF3A7DC5))),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1),
                            SizedBox(width: 8),
                            Expanded(
                                child: InkWell(
                                  onTap: () {

                                    if(selectedTab==2)
                                      {
                                        removeSelection();
                                      }
                                    else
                                      {
                                        selectedTab = 2;
                                        ticketStatus = 1;
                                        setState(() {});
                                        fetchCustomerDetails();
                                      }



                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 7),
                                    color: selectedTab == 2
                                        ? AppTheme.themeColor
                                        : Color(0xFfF9F9F9),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFfF9F9F9),
                                      ),
                                      //  height: 101,
                                      width: 180,
                                      child: Stack(
                                        //  alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            transform:
                                                Matrix4.translationValues(
                                                    0.0, -10.0, 0.0),
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: Image.asset(
                                                    "assets/d2.png",
                                                    width: 83,
                                                    height: 99)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 12),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text('In Progress',
                                                    style: TextStyle(
                                                      fontSize: 11.0,
                                                      color: selectedTab == 2
                                                          ? Colors.white
                                                          : Color(0xFF707070),
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                    dashboardCountData.isEmpty
                                                        ? '0'
                                                        : dashboardCountData[
                                                                    'ticket_status_counts']
                                                                ['In Progress']
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: selectedTab == 2
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if(selectedTab==4)
                                      {

                                        removeSelection();
                                      }
                                    else
                                      {
                                        selectedTab = 4;
                                        ticketStatus = 2;
                                        setState(() {});
                                        fetchCustomerDetails();
                                      }


                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 7),
                                    color: selectedTab == 4
                                        ? AppTheme.themeColor
                                        : Color(0xFfF9F9F9),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFfF9F9F9),
                                      ),
                                      //  height: 101,
                                      width: 180,
                                      child: Stack(
                                        //  alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            transform:
                                                Matrix4.translationValues(
                                                    0.0, -10.0, 0.0),
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: Image.asset(
                                                    "assets/d4.png",
                                                    width: 83,
                                                    height: 99)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 12),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text('Completed',
                                                    style: TextStyle(
                                                      fontSize: 11.0,
                                                      color: selectedTab == 4
                                                          ? Colors.white
                                                          : Color(0xFF707070),
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                    dashboardCountData.isEmpty
                                                        ? '0'
                                                        : dashboardCountData[
                                                                    'ticket_status_counts']
                                                                ['Completed']
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: selectedTab == 4
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1),
                            SizedBox(width: 8),
                            Expanded(
                                child: InkWell(
                                  onTap: () {

                                    if(selectedTab==3)
                                      {

                                        removeSelection();
                                      }
                                    else
                                      {
                                        selectedTab = 3;
                                        ticketStatus = 3;
                                        setState(() {});
                                        fetchCustomerDetails();
                                      }
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 7),
                                    color: selectedTab == 3
                                        ? AppTheme.themeColor
                                        : Color(0xFfF9F9F9),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //color: Color(0xFfF9F9F9),
                                      ),
                                      //  height: 101,
                                      width: 180,
                                      child: Stack(
                                        //  alignment: Alignment.topRight,
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                  "assets/d3.png",
                                                  width: 83,
                                                  height: 99)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 12),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text('Closed',
                                                    style: TextStyle(
                                                      fontSize: 11.0,
                                                      color: selectedTab == 3
                                                          ? Colors.white
                                                          : Color(0xFF707070),
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                    dashboardCountData.isEmpty
                                                        ? '0'
                                                        : dashboardCountData[
                                                                    'ticket_status_counts']
                                                                ['Closed']
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: selectedTab == 3
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 1),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  //  height: 43,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                      color: AppTheme.themeColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NPS feedback',
                          style: TextStyle(
                              fontSize: 14,
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  /* decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black45,width: 1)
                          ),*/
                  child: TextFormField(
                      controller: searchController,
                      onChanged: (content) {
                        if (content.length > 2) {
                          fetchCustomerDetails();
                        }
                      },
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF707070),
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Image.asset("assets/search_icc.png"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Color(0xFFC8C8C8), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Color(0xFFC8C8C8), width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          //contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          fillColor: Color(0xFFF2F2F2),
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 5, 5),
                          //prefixIcon: fieldIC,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF707070).withOpacity(0.4),
                          ))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.withOpacity(0.4), // Color of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                        blurRadius: 5, // Blur radius of the shadow
                        offset: Offset(0, 0), // Offset of the shadow
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                isChildLoading
                    ? Container(
                        height: 150,
                        child: Loader(),
                      )
                    : ListView.builder(
                        itemCount: customerList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int pos) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FeedbackDetailsScreen(
                                                  customerList[pos]['id']
                                                      .toString())));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        // Color of the shadow
                                        spreadRadius: 0,
                                        // Spread radius of the shadow
                                        blurRadius: 5,
                                        // Blur radius of the shadow
                                        offset: Offset(
                                            0, 0), // Offset of the shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Customer Name',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.themeColor,
                                              )),
                                          Text('Date',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.themeColor,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(customerList[pos]['name'],
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF929292),
                                              )),
                                          Text(customerList[pos]['date'],
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF929292),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11.5),
                                            child: Text('NPS Rating :',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.themeColor,
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11.5),
                                            child: Text(
                                                'DETRACTOR',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                  color:  Color(0xFfDB0000)
                                                )),
                                          ),
                                          Spacer(),
                                          pos == 0
                                              ? Container(
                                                  height: 32,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFfFFBB1C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Text('Overdue',
                                                        style: TextStyle(
                                                          fontSize: 11.0,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                )
                                              : customerList[pos]
                                                          ['ticket_status'] ==
                                                      1
                                                  ? Container(
                                                      height: 32,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFf2C68C9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                        child: Text(
                                                            'In-Progress',
                                                            style: TextStyle(
                                                              fontSize: 11.0,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    )
                                                  : customerList[pos][
                                                              'ticket_status'] ==
                                                          2
                                                      ? Container(
                                                          height: 32,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFfAEAEAE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                                'Completed',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ),
                                                        )
                                                      : customerList[pos][
                                                                  'ticket_status'] ==
                                                              3
                                                          ? Container(
                                                              height: 32,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFfAEAEAE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Center(
                                                                child: Text(
                                                                    'Closed',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          11.0,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              ),
                                                            )
                                                          : customerList[pos][
                                                                      'ticket_status'] ==
                                                                  0
                                                              ? Container(
                                                                  height: 32,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              16),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xFf2EA44C),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                        'Open',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              11.0,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                                  ),
                                                                )
                                                              : Container(),
                                          SizedBox(width: 7),
                                          InkWell(
                                            onTap: () {
                                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackDetailsScreen()));
                                            },
                                            child: Container(
                                              height: 32,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 11),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFf2C68C9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Image.asset(
                                                      "assets/back_right.png",
                                                      width: 22,
                                                      height: 10.54)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5)
                            ],
                          );
                        })
              ],
            ),
    );
  }

  filterBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStateSheet) {
            return Column(
              children: [
                Container(height: 28, color: AppTheme.themeColor),
                Card(
                  elevation: 4,
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Filters',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFf045FA0),
                              )),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset("assets/cross_ic.png",
                                width: 26, height: 26)),
                        SizedBox(width: 10)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFECECEC),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        color: Color(0xFfF5F5F5),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex == 1
                                    ? AppTheme.themeColor
                                    : Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Feedback Status',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: selectedIndex == 1
                                            ? Colors.white
                                            : Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex == 2
                                    ? AppTheme.themeColor
                                    : Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Date Range',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: selectedIndex == 2
                                            ? Colors.white
                                            : Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex = 3;
                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex == 3
                                    ? AppTheme.themeColor
                                    : Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('NPS Rating',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: selectedIndex == 3
                                            ? Colors.white
                                            : Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex = 4;
                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex == 4
                                    ? AppTheme.themeColor
                                    : Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Select Branch',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: selectedIndex == 4
                                            ? Colors.white
                                            : Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 14),
                            selectedIndex == 1
                                ? Column(
                                    children: [
                                      ListView.builder(
                                          itemCount: feedbackStatusList.length,
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (BuildContext context, int pos) {
                                            return GestureDetector(
                                              onTap: () {
                                                selectedStatusFilter = pos;

                                                /*  if( feedbackStatusSelected[pos])
                                            {
                                              feedbackStatusSelected[pos]=false;
                                            }
                                          else
                                            {
                                              feedbackStatusSelected[pos]=true;
                                            }*/
                                                setStateSheet(() {});
                                              },
                                              child: Container(
                                                  height: 39,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10,
                                                      left: 12,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color:
                                                          selectedStatusFilter ==
                                                                  pos
                                                              ? Color(0xFF2EA44C)
                                                                  .withOpacity(
                                                                      0.10)
                                                              : Colors.white),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 6),
                                                        child: Text(
                                                            feedbackStatusList[
                                                                pos],
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xFf929292),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 6),
                                                        child: Text('5',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xFf929292),
                                                            )),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          })
                                    ],
                                  )
                                : selectedIndex == 2
                                    ? Column(
                                        children: [
                                          ListView.builder(
                                              itemCount: dateRangeList.length,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int pos) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    if (dateRangeSelected[
                                                        pos]) {
                                                      dateRangeSelected[pos] =
                                                          false;
                                                    } else {
                                                      dateRangeSelected[pos] =
                                                          true;
                                                    }
                                                    setStateSheet(() {});
                                                  },
                                                  child: Container(
                                                      height: 39,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10,
                                                          left: 12,
                                                          right: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          color: dateRangeSelected[
                                                                  pos]
                                                              ? Color(0xFF2EA44C)
                                                                  .withOpacity(
                                                                      0.10)
                                                              : Colors.white),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 6),
                                                            child: Text(
                                                                dateRangeList[
                                                                    pos],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xFf929292),
                                                                )),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 6),
                                                            child: Text('',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xFf929292),
                                                                )),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text('Custom',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFf929292),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              children: [
                                                Text('20-03-2023',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFf045FA0),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: Image.asset(
                                                      "assets/divider.png",
                                                      width: 10,
                                                      height: 10),
                                                ),
                                                Text('20-03-2023',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFf045FA0),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : selectedIndex == 3
                                        ? Column(
                                            children: [
                                              ListView.builder(
                                                  itemCount: npsList.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int pos) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        selectedNPSRatingFilter =
                                                            pos;
                                                        setStateSheet(() {});
                                                      },
                                                      child: Container(
                                                          height: 39,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10,
                                                                  left: 12,
                                                                  right: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: selectedNPSRatingFilter ==
                                                                      pos
                                                                  ? Color(0xFF2EA44C)
                                                                      .withOpacity(
                                                                          0.10)
                                                                  : Colors
                                                                      .white),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            6),
                                                                child: Text(
                                                                    npsList[
                                                                        pos],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFf929292),
                                                                    )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            6),
                                                                child: Text('',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFf929292),
                                                                    )),
                                                              ),
                                                            ],
                                                          )),
                                                    );
                                                  }),
                                              Container(
                                                height: 39,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: Text('Custom',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFf929292),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Container(
                                                height: 40,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Color(0xFFF2F2F2)),
                                                child: TextFormField(
                                                    style: const TextStyle(
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                5,
                                                                5),
                                                        hintText: "5 - 7",
                                                        hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          color: Color(
                                                                  0xFF929292)
                                                              .withOpacity(0.4),
                                                        ))),
                                              ),
                                            ],
                                          )
                                        : selectedIndex == 4
                                            ? Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 13),
                                                    /* decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black45,width: 1)
                          ),*/
                                                    child: TextFormField(
                                                        style: const TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xFF707070),
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                prefixIcon:
                                                                    Image.asset(
                                                                        "assets/search_icc.png"),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFF707070),
                                                                      width:
                                                                          0.2),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    borderSide: BorderSide(
                                                                        color: Color(
                                                                            0xFF707070),
                                                                        width:
                                                                            0.2)),
                                                                errorBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .red,
                                                                        width:
                                                                            0.2)),
                                                                //contentPadding: EdgeInsets.zero,
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                fillColor: Colors
                                                                    .white,
                                                                filled: true,
                                                                contentPadding:
                                                                    EdgeInsets.fromLTRB(
                                                                        2.0,
                                                                        7.0,
                                                                        5,
                                                                        5),
                                                                //prefixIcon: fieldIC,
                                                                hintText: "Search Branch",
                                                                hintStyle: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                          0xFF707070)
                                                                      .withOpacity(
                                                                          0.4),
                                                                ))),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.6,
                                                    child: ListView.builder(
                                                        itemCount:
                                                            branchList.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int pos) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              selectedSelectBranchFilter =
                                                                  pos;
                                                              setStateSheet(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                                height: 39,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            12,
                                                                        right:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4),
                                                                    color: selectedSelectBranchFilter ==
                                                                            pos
                                                                        ? Color(0xFF2EA44C).withOpacity(
                                                                            0.10)
                                                                        : Colors
                                                                            .white),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              6),
                                                                      child: Text(
                                                                          branchList[
                                                                              pos],
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Color(0xFf929292),
                                                                          )),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              6),
                                                                      child: Text(
                                                                          '',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Color(0xFf929292),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                )),
                                                          );
                                                        }),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: 45,
                                  width: 112,
                                  margin: EdgeInsets.only(left: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ))),
                                    onPressed: () {
                                      if (selectedStatusFilter == 9999 &&
                                          selectedNPSRatingFilter == 9999 &&
                                          selectedSelectBranchFilter == 9999) {
                                        Navigator.pop(context);
                                      } else {
                                        if (selectedStatusFilter != 9999) {
                                          if (selectedStatusFilter == 0) {
                                            ticketStatus = 0;
                                          } else if (selectedStatusFilter ==
                                              1) {
                                            ticketStatus = 1;
                                          } else if (selectedStatusFilter ==
                                              2) {
                                            ticketStatus = 2;
                                          } else if (selectedStatusFilter ==
                                              3) {
                                            ticketStatus = 3;
                                          }
                                        }

                                        if (selectedNPSRatingFilter != 9999) {
                                          NPSRatingFilter =
                                              npsList[selectedNPSRatingFilter];
                                        }
                                        if (selectedSelectBranchFilter !=
                                            9999) {
                                          BranchFilter = branchList[
                                              selectedSelectBranchFilter];
                                        }
                                        Navigator.pop(context);
                                        fetchCustomerDetails();
                                      }
                                    },
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25),
                              ],
                            ),
                            SizedBox(height: 17),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: 43,
                                  width: 112,
                                  margin: EdgeInsets.only(left: 20),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white), // background
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFfD5D5D5)), // fore
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ))),
                                    onPressed: () {},
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25),
                              ],
                            ),
                            SizedBox(height: 17),
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            );
          });
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDashboardData();
    fetchRegionList();
    fetchCustomerDetails();
  }

  fetchDashboardData() async {
    setState(() {
      isLoading = true;
    });

    var requestModel = {"start_date": "2023-06-01", "end_date": "2023-10-30"};

    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.get('huddle-utility', context);
    var responseJSON = json.decode(response.body);
    isLoading = false;
    print(responseJSON);
    dashboardCountData = responseJSON["data"];
    setState(() {});
  }

  fetchRegionList() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.get('region-list', context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    branchList = responseJSON["data"];
    branchSelected = List<bool>.filled(branchList.length, false);
    setState(() {});
  }

  fetchCustomerDetails() async {
    setState(() {
      isChildLoading = true;
    });

    var requestModel = {
      "ticket_status": ticketStatus,
      "name": searchController.text,
      "region": BranchFilter,
      "nps_ratting": NPSRatingFilter,
      "l2": ""
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
        await helper.postAPI('huddle-customers', requestModel, context);
    var responseJSON = json.decode(response.body);
    isChildLoading = false;
    print(responseJSON);
    customerList = responseJSON["data"];
    setState(() {});
  }
  removeSelection(){
    selectedTab=9999;
    setState(() {

    });
    ticketStatus=1;
    fetchCustomerDetails();
  }
}
