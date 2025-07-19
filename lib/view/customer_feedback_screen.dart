
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'feedback_details.dart';

class CustomerFeedbackScreen extends StatefulWidget
{
  CustomerState createState()=>CustomerState();
}
class CustomerState extends State<CustomerFeedbackScreen>
{
  List<bool> toggleList=[];
  String selectedl2="";
  var searchController=TextEditingController();
  bool isLoading=false;
  bool isLoading2=false;
  List<dynamic> customerList=[];
  String NPSRatingFilter="";
  String BranchFilter="";
  int selectedIndex=1;
  int selectedStatusFilter=9999;
  int selectedNPSRatingFilter=9999;
  int selectedSelectBranchFilter=9999;
  List<bool> feedbackStatusSelected=[
    false,
    false,
    false,
    false
  ];
  List<String> feedbackStatusList=[
    "Open",
    "In-Progress",
    "Completed",
    "Closed"
  ];

  List<bool> npsSelected=[
    false,
    false,
    false
  ];
  List<String> npsList=[
    "Promotor",
    "Detractor",
    "Passive"
  ];

  int ticketStatus=1;


  List<bool> dateRangeSelected=[
    false,
    false,
    false,
    false,
    false
  ];
  List<String> dateRangeList=[
    "Week To Date",
    "Month To Date",
    "Previous Month",
    "Year To Date",
    "Previous Year"
  ];
  List<bool> branchSelected=[];
  List<dynamic> branchList=[];

  List<String> regionList=[];
  int selectedTab=9999;
  List<dynamic> customerFeedbacks=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 23),
          onPressed: () {
            Navigator.pop(context);

            //  _logOut();
            // Add your right button action here
          },
        ),

        title: Text('Customer Feedbacks',style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white

        ),),

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
                  transform: Matrix4.translationValues(22.0, 10.0, 0.0),
                  width:16,
                  height: 16,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFf5619D1)
                  ),

                  child:Center(
                    child: Text('10',style: TextStyle(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                  )
              )


            ],
          ),

        ],

      ),
      
      
      body: ListView(
        children: [




          
          SizedBox(height: 14),
          
          
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4), // Color of the shadow
                    spreadRadius: 0, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius of the shadow
                    offset: Offset(0, 0), // Offset of the shadow
                  ),
                ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),

            child:

                isLoading?
            Container(
                height:100,
              child: Center(
                  child:Loader()
              ),
            ):



              Column(
              children: [

                SizedBox(height: 8),



                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: (1.2 / 1.2)),
                  itemCount: customerFeedbacks.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){


                        if(customerFeedbacks[index]["title"]=="Service procedures")
                          {
                            _modalBottomSheetServiceProcedures();
                          }

                        else if(customerFeedbacks[index]["title"]=="Customer lounge facilities ")
                        {
                          _modalBottomSheetCustomerLounge();
                        }


                        else if(customerFeedbacks[index]["title"]=="Servicing time")
                        {
                          _modalBottomSheetServicingTime();
                        }
                        else if(customerFeedbacks[index]["title"]=="Cost of service ")
                        {
                          _modalBottomSheetCostOfService();
                        }

                        else if(customerFeedbacks[index]["title"]=="Servicing team interaction (wait time, service advisor knowledge, friendliness)")
                        {
                          _modalBottomSheetTeamInteraction();
                        }

                        else if(customerFeedbacks[index]["title"]=="Quality of Service")
                        {
                          _modalBottomSheetQualityOfService();
                        }

                        else if(customerFeedbacks[index]["title"]=="Value added services ")
                        {
                          _modalBottomSheetValueAddedServices();
                        }

                        else if(customerFeedbacks[index]["title"]=="Service reach")
                        {
                          _modalBottomSheetServiceReach();
                        }
                      },
                      child: Card(
                        //  margin: EdgeInsets.only(left: 5),
                        color: toggleList[index]?Color(0xFfF9F9F9):AppTheme.themeColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height:160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Color(0xFfF9F9F9),
                          ),
                          //  height: 101,
                          width: 180,
                          child: Stack(
                            //  alignment: Alignment.topRight,
                            children: [

                              /*  Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset("assets/d1.png",width: 83,height: 99)),*/
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  SizedBox(height: 5),




                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 40,
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Text(customerFeedbacks[index]['title'],style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: toggleList[index]?AppTheme.themeColor:Colors.white,
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),


                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12,top: 10),
                                        child: Text(customerFeedbacks[index]['count'].toString(),style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          color: toggleList[index]?Colors.black:Colors.white,
                                        )),
                                      ),
                                      Spacer(),


                                      FlutterSwitch(
                                        width: 88.0,
                                        height: 33.0,
                                        activeSwitchBorder: Border.all(color: Color(0xFF707070),width: 1),
                                        valueFontSize: 11.0,
                                        activeToggleColor:Color(0xFF707070),
                                        inactiveToggleColor: Color(0xFF2EA44C),
                                        activeColor: Colors.white,
                                        inactiveColor: Colors.white,
                                        toggleSize: 25.0,
                                        activeIcon: Icon(
                                          Icons.check,
                                          color: Colors.white,



                                        ),

                                        inactiveIcon: Icon(
                                          Icons.check,
                                          color: Colors.white,



                                        ),

                                        value: toggleList[index],
                                        borderRadius: 30.0,
                                        showOnOff: true,
                                        activeTextColor: Color(0xFf707070),
                                        activeTextFontWeight: FontWeight.w500,
                                        inactiveTextFontWeight: FontWeight.w500,
                                        inactiveTextColor: Colors.black,

                                        activeText: 'Filter',
                                        inactiveText: 'Remove',
                                        onToggle: (val) {
                                          setState(() {
                                            toggleList[index] = val;
                                          });
                                          if(val==false)
                                            {
                                              selectedl2=customerFeedbacks[index]["title"];
                                              fetchCustomerDetails();
                                            }
                                          else
                                            {

                                              selectedl2="";
                                              fetchCustomerDetails();
                                            }




                                        },
                                      ),

                                      SizedBox(width: 5),




                                    ],
                                  ),

                                  SizedBox(height: 7),


                                  Row(
                                    children: [
                                      Expanded(
                                        child: LinearPercentIndicator(
                                          lineHeight: 8.0,
                                          percent: customerFeedbacks[index]['percentage']/100,
                                          progressColor: Color(0xFFDB0000),
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 1),
                                        child: Text(customerFeedbacks[index]['percentage'].toStringAsFixed(0)+"%",style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600,
                                          color:toggleList[index]? Color(0xFfDB0000):Colors.white,
                                        )),
                                      ),

                                      SizedBox(width: 10),


                                    ],
                                  ),

                                  SizedBox(height: 10),


                                  Container(
                                    height: 1,
                                    color: toggleList[index]?Colors.grey.withOpacity(0.4):AppTheme.themeColor,
                                  ),


                                  Row(
                                    children: [

                                      Expanded(
                                          child:   Stack(
                                            children: [

                                              Container(
                                                  padding: EdgeInsets.only(top: 12,left: 8),
                                                  child: Text('L3 Drilldown',
                                                      style: TextStyle(
                                                          fontSize: 11.0,
                                                          color:
                                                          AppTheme.themeColor,
                                                          fontWeight:
                                                          FontWeight.w800))),
                                              Container(
                                                transform: Matrix4.translationValues(42.0, 0.0, 0.0),
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
                                      )

                                    ],

                                  )







                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    // Item rendering
                  },
                ),












                SizedBox(height: 15),

              ],
            ),
          ),


          SizedBox(height: 30),

          Container(
          //  height: 43,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
           decoration: BoxDecoration(
             color: AppTheme.themeColor.withOpacity(0.10),
             borderRadius: BorderRadius.circular(10)
           ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('NPS feedback',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.themeColor

                )),

                InkWell(
                  onTap:(){
                    filterBottomSheet();
                  },

                    child: Image.asset("assets/filter_ic.png",width: 38,height: 38,))


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


                  if(content.length>2)
                  {
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
                      borderSide: BorderSide(
                          color: Color(0xFFC8C8C8), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Color(0xFFC8C8C8), width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Colors.red, width: 1)),
                    //contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    fillColor: Color(0xFFF2F2F2),
                    filled: true,
                    contentPadding:
                    EdgeInsets.fromLTRB(2.0, 7.0, 5, 5),
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
                  color: Colors.grey.withOpacity(0.4), // Color of the shadow
                  spreadRadius: 0, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset of the shadow
                ),
              ],
            ),

          ),


          SizedBox(height: 10),




          isLoading2?
          Center(
              child:Loader()
          ):




              customerList.length==0?

                  Center(
                    child: Text("No data found !"),
                  ):


          ListView.builder(
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
                                  child:  Text(
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
  void _modalBottomSheetServicingTime() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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


                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Servicing time',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 10),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),
                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text('Time taken for servicing',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Servicing time actual v/s promised',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),


                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Preference given to appointment',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Provision for express service',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _modalBottomSheetCustomerLounge() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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


                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Customer lounge facilities',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 10),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),
                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Availability of customer lounge',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Customer lounge facilities (Seating, AC, TV, Magazines)',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),


                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Provision of refreshments',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cleanliness of customer lounge',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cleanliness of Service center',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }


  void _modalBottomSheetTeamInteraction() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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


                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Servicing team interaction',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    Container(
                      height: 250,
                      child: Scrollbar(
                        child: ListView(
                          children: [

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              color: Color(0xFF707070).withOpacity(0.10),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Wait time for opening job card',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('8',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              color: Colors.white,

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Knowledgeability of service advisors',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('2',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),


                            Container(
                              height: 46,
                              color: Color(0xFF707070).withOpacity(0.10),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Recording of vehicle condition- dent, scratch, fuel level etc',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('3',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                              ),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Explanation of jobs to be performed during Job Card opening',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('2',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              color: Color(0xFF707070).withOpacity(0.10),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Communication on Revised time or cost',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('3',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                              ),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Friendliness and professionalism of service advisors',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('2',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),

                            SizedBox(height: 5),

                            Container(
                              height: 46,
                              color: Color(0xFF707070).withOpacity(0.10),

                              child: Row(

                                children: [

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text('Recording all issues in job card',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text('3',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )),
                                  ),

                                ],
                              ),


                            ),


                          ],
                        ),
                      ),
                    ),
















                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }


  void _modalBottomSheetServiceProcedures() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Service procedures',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Timely Service Reminders',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Ease of Service Appointment',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),


                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Ease of Documentation for Accidental claim',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Ease of warranty settlement',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

















                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }


  void _modalBottomSheetValueAddedServices() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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


                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Value added services',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Road side Assistance',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Pick up and drop from home',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),



















                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }


  void _modalBottomSheetQualityOfService() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Service procedures',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Problem Resolution',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Problem Understanding',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),
                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Parts Availability',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cleanliness of vehicle',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),




                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('New issue identification & resolution',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),












                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _modalBottomSheetServiceReach() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Service reach',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Distance to workshop',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Ease of reaching workshop',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),
                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Ease of locating workshop',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Working hours of service centre',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),


                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _modalBottomSheetCostOfService() {
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
              margin: const EdgeInsets.symmetric(horizontal: 8.5,vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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


                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Cost of Service',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 3),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('L3',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Ticket Count',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFf707070)

                          )),
                        ),

                      ],
                    ),


                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cost of labor',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('8',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Colors.white,

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cost of Value added service',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),
                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      color: Color(0xFF707070).withOpacity(0.10),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cost of service actual v/s estimated',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('3',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),

                    SizedBox(height: 5),

                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),

                      child: Row(

                        children: [

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text('Cost of spare parts',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black

                              )),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text('2',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            )),
                          ),

                        ],
                      ),


                    ),


                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }),
    );
  }


  fetchCustomerDetails() async {
    setState(() {
      isLoading2=true;
    });

    var requestModel = {
      "ticket_status":ticketStatus,
      "name":"",
      "region":BranchFilter,
      "nps_ratting":NPSRatingFilter,
      "l2":selectedl2
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('huddle-customers',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading2=false;
    print(responseJSON);
    customerList= responseJSON["data"];
    setState(() {});

  }

  fetchCustomerFeedbacks() async {
    setState(() {
      isLoading=true;
    });

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('customer-L2-feedback',context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    customerFeedbacks= responseJSON["data"];
    for(int i=0;i<customerFeedbacks.length;i++)
      {
        toggleList.add(true);
      }
    setState(() {});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCustomerDetails();
    fetchCustomerFeedbacks();
  }


  filterBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setStateSheet) {

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
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset("assets/cross_ic.png",width: 26,height: 26)),

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
                        color:Color(0xFfF5F5F5) ,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex=1;
                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex==1?AppTheme.themeColor:Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Feedback Status',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:selectedIndex==1? Colors.white:Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex=2;

                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex==2?AppTheme.themeColor:Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Date Range',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:selectedIndex==2? Colors.white:Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex=3;

                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex==3?AppTheme.themeColor:Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('NPS Rating',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:selectedIndex==3? Colors.white:Color(0xFf929292),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setStateSheet(() {
                                  selectedIndex=4;

                                });
                              },
                              child: Container(
                                height: 57.5,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: selectedIndex==4?AppTheme.themeColor:Color(0xFfF5F5F5),
                                child: Center(
                                  child: Text('Select Branch',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:selectedIndex==4? Colors.white:Color(0xFf929292),
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
                                selectedIndex==1?


                                Column(
                                  children: [


                                    ListView.builder(
                                        itemCount: feedbackStatusList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,int pos)

                                        {
                                          return  GestureDetector(
                                            onTap: () {

                                              selectedStatusFilter=pos;




                                              /*  if( feedbackStatusSelected[pos])
                                            {
                                              feedbackStatusSelected[pos]=false;
                                            }
                                          else
                                            {
                                              feedbackStatusSelected[pos]=true;
                                            }*/
                                              setStateSheet(() {

                                              });

                                            },
                                            child: Container(
                                                height: 39,
                                                margin: EdgeInsets.only(bottom: 10,left: 12,right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color:selectedStatusFilter==pos? Color(0xFF2EA44C).withOpacity(0.10):Colors.white
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6),
                                                      child: Text(feedbackStatusList[pos],
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 6),
                                                      child: Text('5',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),


                                                  ],
                                                )
                                            ),
                                          );
                                        }

                                    )




                                  ],
                                ):


                                selectedIndex==2?


                                Column(
                                  children: [


                                    ListView.builder(
                                        itemCount: dateRangeList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,int pos)

                                        {
                                          return  GestureDetector(
                                            onTap: () {


                                              if( dateRangeSelected[pos])
                                              {
                                                dateRangeSelected[pos]=false;
                                              }
                                              else
                                              {
                                                dateRangeSelected[pos]=true;
                                              }
                                              setStateSheet(() {

                                              });

                                            },
                                            child: Container(
                                                height: 39,
                                                margin: EdgeInsets.only(bottom: 10,left: 12,right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color:dateRangeSelected[pos]? Color(0xFF2EA44C).withOpacity(0.10):Colors.white
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6),
                                                      child: Text(dateRangeList[pos],
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 6),
                                                      child: Text('',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),


                                                  ],
                                                )
                                            ),
                                          );
                                        }

                                    ),

                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Text('Custom',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFf929292),
                                              )),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height:5),


                                    Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        children: [

                                          Text('20-03-2023',
                                              style: TextStyle(
                                                fontSize: 10,
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFf045FA0),
                                              )),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Image.asset("assets/divider.png",width: 10,height: 10),
                                          ),


                                          Text('20-03-2023',
                                              style: TextStyle(
                                                fontSize: 10,
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFf045FA0),
                                              )),

                                        ],
                                      ),


                                    )







                                  ],
                                ):



                                selectedIndex==3?


                                Column(
                                  children: [


                                    ListView.builder(
                                        itemCount: npsList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,int pos)

                                        {
                                          return  GestureDetector(
                                            onTap: () {


                                              selectedNPSRatingFilter=pos;
                                              setStateSheet(() {

                                              });

                                            },
                                            child: Container(
                                                height: 39,
                                                margin: EdgeInsets.only(bottom: 10,left: 12,right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color:selectedNPSRatingFilter==pos? Color(0xFF2EA44C).withOpacity(0.10):Colors.white
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6),
                                                      child: Text(npsList[pos],
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 6),
                                                      child: Text('',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(0xFf929292),
                                                          )),
                                                    ),


                                                  ],
                                                )
                                            ),
                                          );
                                        }

                                    ),


                                    Container(
                                      height: 39,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16),
                                            child: Text('Custom',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFf929292),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height:12),


                                    Container(
                                      height: 40,
                                      margin: EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: Color(0xFFF2F2F2)
                                      ),
                                      child: TextFormField(
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 5, 5),
                                              hintText: "5 - 7",
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF929292).withOpacity(0.4),
                                              ))),
                                    ),






                                  ],
                                ):


                                selectedIndex==4?


                                Column(
                                  children: [

                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 13),
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
                                                borderSide: BorderSide(
                                                    color: Color(0xFF707070), width: 0.2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                      color: Color(0xFF707070), width: 0.2)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                      color: Colors.red, width: 0.2)),
                                              //contentPadding: EdgeInsets.zero,
                                              border: InputBorder.none,
                                              fillColor: Colors.white,
                                              filled: true,
                                              contentPadding:
                                              EdgeInsets.fromLTRB(2.0, 7.0, 5, 5),
                                              //prefixIcon: fieldIC,
                                              hintText: "Search Branch",
                                              hintStyle: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF707070).withOpacity(0.4),
                                              ))),
                                    ),

                                    SizedBox(height: 10),





                                    Container(
                                      height: MediaQuery.of(context).size.height*0.6,
                                      child: ListView.builder(
                                          itemCount: branchList.length,
                                          itemBuilder: (BuildContext context,int pos)

                                          {
                                            return  GestureDetector(
                                              onTap: () {


                                                selectedSelectBranchFilter=pos;
                                                setStateSheet(() {

                                                });

                                              },
                                              child: Container(
                                                  height: 39,
                                                  margin: EdgeInsets.only(bottom: 10,left: 12,right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color:selectedSelectBranchFilter==pos? Color(0xFF2EA44C).withOpacity(0.10):Colors.white
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 6),
                                                        child: Text(branchList[pos],
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(0xFf929292),
                                                            )),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 6),
                                                        child: Text('',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(0xFf929292),
                                                            )),
                                                      ),


                                                    ],
                                                  )
                                              ),
                                            );
                                          }

                                      ),
                                    ),



                                  ],
                                ):
                                Container(),




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
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ))),
                                        onPressed: () {


                                          if(selectedStatusFilter==9999 && selectedNPSRatingFilter==9999 && selectedSelectBranchFilter==9999)
                                          {
                                            Navigator.pop(context);
                                          }


                                          else
                                          {
                                            if(selectedStatusFilter!=9999)
                                            {
                                              if(selectedStatusFilter==0)
                                              {
                                                ticketStatus=0;
                                              }
                                              else if(selectedStatusFilter==1)
                                              {
                                                ticketStatus=1;
                                              }


                                              else if(selectedStatusFilter==2)
                                              {
                                                ticketStatus=2;
                                              }

                                              else if(selectedStatusFilter==3)
                                              {
                                                ticketStatus=3;
                                              }
                                            }

                                            if(selectedNPSRatingFilter!=9999)
                                            {
                                              NPSRatingFilter=npsList[selectedNPSRatingFilter];
                                            }
                                            if(selectedSelectBranchFilter!=9999)
                                            {
                                              BranchFilter=branchList[selectedSelectBranchFilter];
                                            }
                                            Navigator.pop(context);
                                            fetchCustomerDetails();
                                          }





                                        },
                                        child: const Text(
                                          'Apply',
                                          style: TextStyle(fontSize: 13.5,color: Colors.white,fontWeight: FontWeight.w500),
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
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ))),
                                        onPressed: () {

                                        },
                                        child: const Text(
                                          'Reset',
                                          style: TextStyle(fontSize: 13.5,color: Colors.white,fontWeight: FontWeight.w500),
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


}