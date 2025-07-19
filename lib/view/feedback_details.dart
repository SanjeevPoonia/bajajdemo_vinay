

import 'dart:convert';

import 'package:bajaj_app/network/api_dialog.dart';
import 'package:bajaj_app/view/quality_of_service.dart';
import 'package:bajaj_app/view/servicing_time_screen.dart';
import 'package:bajaj_app/view/view_all_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:toast/toast.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'cost_of_service.dart';

class FeedbackDetailsScreen extends StatefulWidget
{
  final String huddleID;
  FeedbackDetailsScreen(this.huddleID);
  FeedbackState createState()=>FeedbackState();
}
class FeedbackState extends State<FeedbackDetailsScreen>
{
  Map<String,dynamic> customerData={};
  String callerID='';
  List<int> selectedIndexes=[];
  List<dynamic> rootCauseList=[];
  int attemptNumber=1;
  bool isLoading=false;
  var customerController=TextEditingController();
  var dealerController=TextEditingController();
  List<ExpandedTileController> _controllerList=[];
  ExpandedTileController _controller1 = ExpandedTileController();
  List<String> nameList=[
    "Vaibhav Saini",
    "Rishabh Kumawat",
    "Sam Mathew",
    "Joe Alwn",
    "Anubhav Kumawat",
    "Tom Harry",
    "Anderson",
  ];
  int callBackRadio=0;
  int customerLoopRadio=0;
  int resolveRadio=0;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 23),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text('Customer Feedbacks',style: TextStyle(
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


      body:

      isLoading?
          Center(
            child: Loader(),
          ):

      ListView(
        children: [

          SizedBox(height: 15),



          customerData.isEmpty?

              Container():

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.only(bottom: 10,top: 3,left: 3,right: 3),
            decoration:  BoxDecoration(
                color: Color(0xFFF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Color of the shadow
                    spreadRadius: 0, // Spread radius of the shadow
                    blurRadius: 6, // Blur radius of the shadow
                    offset: Offset(0, 0), // Offset of the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20)
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  padding:EdgeInsets.symmetric(vertical:9),
                  decoration: BoxDecoration(
                    color: AppTheme.themeColor.withOpacity(0.20),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
                  ),
                 
                  child: Row(
                    children: [

                      SizedBox(width: 15),

                      Text('Customer Details',style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor
                      )),












                    ],
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),

                  child: Row(
                    children: [

                      Expanded(child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                        decoration:  BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                spreadRadius: 0, // Spread radius of the shadow
                                blurRadius: 5, // Blur radius of the shadow
                                offset: Offset(0, 0), // Offset of the shadow
                              ),
                            ],
                            color:AppTheme.themeColor.withOpacity(0.10),
                            
                            borderRadius: BorderRadius.circular(10)
                        ),


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Customer Name',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.themeColor

                            ),),

                            SizedBox(height: 12),

                            Text(customerData['customer']['cust_name'],style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black

                            ),),


                          ],
                        ),





                      ),flex: 1),


                      SizedBox(width: 11),
                      Expanded(child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                        decoration:  BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                spreadRadius: 0, // Spread radius of the shadow
                                blurRadius: 5, // Blur radius of the shadow
                                offset: Offset(0, 0), // Offset of the shadow
                              ),
                            ],
                            color:AppTheme.themeColor.withOpacity(0.10),

                            borderRadius: BorderRadius.circular(10)
                        ),


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Feedback Type',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.themeColor

                            ),),

                            SizedBox(height: 12),

                            Text("DETRACTOR",style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFfDB0000)

                            ),),


                          ],
                        ),





                      ),flex: 1),

                    ],
                  ),
                ),


                SizedBox(height: 10),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),


                  child: Row(
                    children: [

                      Expanded(child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                        decoration:  BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                spreadRadius: 0, // Spread radius of the shadow
                                blurRadius: 5, // Blur radius of the shadow
                                offset: Offset(0, 0), // Offset of the shadow
                              ),
                            ],
                            color:AppTheme.themeColor.withOpacity(0.10),

                            borderRadius: BorderRadius.circular(10)
                        ),


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Feedback Date',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.themeColor

                            ),),

                            SizedBox(height: 12),

                            Text('12-05-2022',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black

                            ),),


                          ],
                        ),





                      ),flex: 1),


                      SizedBox(width: 11),
                      Expanded(child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDetailsScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 18,bottom: 18,left: 10),
                          decoration:  BoxDecoration(
                            border: Border.all(color: AppTheme.themeColor,width: 0.3),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                  spreadRadius: 0, // Spread radius of the shadow
                                  blurRadius: 5, // Blur radius of the shadow
                                  offset: Offset(0, 0), // Offset of the shadow
                                ),
                              ],
                              color:AppTheme.themeColor.withOpacity(0.10),

                              borderRadius: BorderRadius.circular(10)
                          ),


                          child: Row(
                            children: [
                              Text('View All',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.themeColor

                              ),),

                             Spacer(),

                              Image.asset("assets/arrow12.png",width: 61),
                              SizedBox(width: 9),





                            ],
                          ),





                        ),
                      ),flex: 1),

                    ],
                  ),
                ),

                SizedBox(height: 3),



              ],
            ),

          ),


          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.only(left: 3,right: 3,bottom: 10,top: 3),
            decoration:  BoxDecoration(
                color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 0, // Spread radius of the shadow
                  blurRadius: 6, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset of the shadow
                ),
              ],

            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Container(
                  padding:EdgeInsets.symmetric(vertical:10),
                  decoration: BoxDecoration(
                      color: AppTheme.themeColor.withOpacity(0.20),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
                  ),

                  child: Row(
                    children: [

                      SizedBox(width: 15),

                      Text('Call Back Details',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor
                      )),

                      Spacer(),

                      Image.asset("assets/expand_ic.png",width: 22,height: 22),


                      SizedBox(width: 12)











                    ],
                  ),
                ),


             /*   ExpandedTile(
                  contentseparator: 1,
                  trailing: Container(),
                  theme: ExpandedTileThemeData(
                    headerColor: Colors.white,
                    headerRadius: 10,
                    trailingPadding: EdgeInsets.zero,
                    leadingPadding: EdgeInsets.zero,
                    headerPadding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                    headerSplashColor: AppTheme.themeColor.withOpacity(0.4),
                    contentBackgroundColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                  ),
                  controller: _controller1,
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Attempt 2',
                                style: TextStyle(
                                    fontSize: 13, color: AppTheme.themeColor,fontWeight: FontWeight.w700)),
                            Spacer(),
                            Text('Non - Contactable',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFfFFBB1C)

                            ),),

                            SizedBox(width: 5),

                            _controller1.isExpanded
                                ? Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.themeColor, width: 2)),
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_up_outlined,
                                    color: AppTheme.themeColor, size: 20),
                              ),
                            )
                                : Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.themeColor, width: 2)),
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_down,
                                    color: AppTheme.themeColor, size: 21),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  content: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        SizedBox(height: 10),

                        Container(

                          child: Row(
                            children: [

                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13,left: 10,right: 17),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Caller',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('12-05-2022',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),


                              SizedBox(width: 11),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Call Back Done',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),


                                    Row(
                                      children: [

                                        callBackRadio==0?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                callBackRadio=0;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('YES',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),


                                        Spacer(),

                                        callBackRadio==1?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                callBackRadio=1;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('NO',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),



                                      ],
                                    )


                                  ],
                                ),





                              ),flex: 1),

                            ],
                          ),
                        ),


                        SizedBox(height: 10),

                        Container(

                          child: Row(
                            children: [

                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Planned Huddle Date',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('12-05-2022',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),


                              SizedBox(width: 11),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Actual Huddle Date',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('-',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),

                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Call-Back Verbatim(Customer)',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),

                                  Text('i am not happy with this service',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black

                                  ),),


                                ],
                              ),





                            ),flex: 1),
                          ],
                        ),





                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Call-Back Verbatim(Dealer)',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),

                                  Text('Apologies for the inconvenience , Please visit the store',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black

                                  ),),


                                ],
                              ),





                            ),flex: 1),
                          ],
                        ),


                        SizedBox(height: 10),


                        Row(
                          children: [

                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Resolvable at Dealer',style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),


                                  Row(
                                    children: [

                                      resolveRadio==0?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              resolveRadio=0;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('YES',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),


                                      Spacer(),

                                      resolveRadio==1?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              resolveRadio=1;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('NO',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),



                                    ],
                                  )


                                ],
                              ),





                            ),flex: 1),


                            SizedBox(width: 10),


                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 5),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Customer Loop Closure',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),maxLines: 1),

                                  SizedBox(height: 12),


                                  Row(
                                    children: [

                                      customerLoopRadio==0?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              customerLoopRadio=0;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('YES',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),


                                      Spacer(),

                                      customerLoopRadio==1?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              customerLoopRadio=1;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text('NO',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),
                                      ),



                                    ],
                                  )


                                ],
                              ),





                            ),flex: 1),

                          ],
                        ),




                        SizedBox(height: 5),

                      ],
                    ),
                  ),
                  onTap: () {

                    if(_controller2.isExpanded)
                      {
                        _controller2.toggle();
                      }



                    setState(() {});
                  },
                  onLongTap: () {
                    debugPrint("long tapped!!");
                  },
                ),

                Container(
                  height: 1,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withOpacity(0.4),
                ),



                ExpandedTile(
                  contentseparator: 1,
                  trailing: Container(),
                  theme: ExpandedTileThemeData(
                    headerColor: Colors.white,
                    headerRadius: 10,
                    trailingPadding: EdgeInsets.zero,
                    leadingPadding: EdgeInsets.zero,
                    headerPadding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                    headerSplashColor: AppTheme.themeColor.withOpacity(0.4),
                    contentBackgroundColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                  ),
                  controller: _controller2,
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Attempt 1',
                                style: TextStyle(
                                    fontSize: 13, color: AppTheme.themeColor,fontWeight: FontWeight.w700)),
                            Spacer(),

                            Text('Solved',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.greenAccent

                            ),),

                            SizedBox(width: 5),
                            _controller2.isExpanded
                                ? Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.themeColor, width: 2)),
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_up_outlined,
                                    color: AppTheme.themeColor, size: 20),
                              ),
                            )
                                : Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.themeColor, width: 2)),
                              child: Center(
                                child: Icon(Icons.keyboard_arrow_down,
                                    color: AppTheme.themeColor, size: 21),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                  content: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        SizedBox(height: 10),

                        Container(

                          child: Row(
                            children: [

                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 17),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Caller',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('12-05-2022',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),


                              SizedBox(width: 11),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Call Back Done',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),


                                    Row(
                                      children: [

                                        callBackRadio==0?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                callBackRadio=0;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('YES',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),


                                        Spacer(),

                                        callBackRadio==1?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                callBackRadio=1;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('NO',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),



                                      ],
                                    )


                                  ],
                                ),





                              ),flex: 1),

                            ],
                          ),
                        ),


                        SizedBox(height: 10),

                        Container(

                          child: Row(
                            children: [

                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Planned Huddle Date',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('12-05-2022',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),


                              SizedBox(width: 11),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Actual Huddle Date',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),

                                    Text('-',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),),


                                  ],
                                ),





                              ),flex: 1),

                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Call-Back Verbatim(Customer)',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),

                                  Text('i am not happy with this service',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black

                                  ),),


                                ],
                              ),





                            ),flex: 1),
                          ],
                        ),





                        SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Call-Back Verbatim(Dealer)',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),

                                  Text('Apologies for the inconvenience , Please visit the store',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black

                                  ),),


                                ],
                              ),





                            ),flex: 1),
                          ],
                        ),


                        SizedBox(height: 10),


                        Row(
                          children: [

                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Resolvable at Dealer',style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),),

                                  SizedBox(height: 12),


                                  Row(
                                    children: [

                                      resolveRadio==0?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              resolveRadio=0;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('YES',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),


                                      Spacer(),

                                      resolveRadio==1?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              resolveRadio=1;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('NO',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),



                                    ],
                                  )


                                ],
                              ),





                            ),flex: 1),


                            SizedBox(width: 10),


                            Expanded(child: Container(
                              padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 5),
                              decoration:  BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 5, // Blur radius of the shadow
                                      offset: Offset(0, 0), // Offset of the shadow
                                    ),
                                  ],
                                  color:AppTheme.themeColor.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(10)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Customer Loop Closure',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.themeColor

                                  ),maxLines: 1),

                                  SizedBox(height: 12),


                                  Row(
                                    children: [

                                      customerLoopRadio==0?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              customerLoopRadio=0;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Text('YES',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      )),


                                      Spacer(),

                                      customerLoopRadio==1?
                                      Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                      GestureDetector(
                                          onTap:(){

                                            setState(() {
                                              customerLoopRadio=1;
                                            });


                                          },


                                          child: Icon(Icons.radio_button_off)),
                                      SizedBox(width: 5),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text('NO',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),
                                      ),



                                    ],
                                  )


                                ],
                              ),





                            ),flex: 1),

                          ],
                        ),




                        SizedBox(height: 5),

                      ],
                    ),
                  ),
                  onTap: () {
                    if(_controller1.isExpanded)
                    {
                      _controller1.toggle();
                    }
                    setState(() {});
                  },
                  onLongTap: () {
                    debugPrint("long tapped!!");
                  },
                ),*/



                ExpandedTileList.builder(
                    maxOpened: 1,
                    itemCount: attemptNumber, itemBuilder: (context,index,controller)

                {
                  return  ExpandedTile(
                    contentseparator: 1,
                    trailing: Container(),
                    theme: ExpandedTileThemeData(
                      headerColor: Colors.white,
                      headerRadius: 10,
                      trailingPadding: EdgeInsets.zero,
                      leadingPadding: EdgeInsets.zero,
                      headerPadding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                      headerSplashColor: AppTheme.themeColor.withOpacity(0.4),
                      contentBackgroundColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                    ),
                    controller:controller,
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Attempt '+(index+1).toString(),
                                  style: TextStyle(
                                      fontSize: 13, color: AppTheme.themeColor,fontWeight: FontWeight.w700)),
                              Spacer(),
                              Text(
                                selectedIndexes.contains(index)?
                                    'Non - Contactable':'',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFfFFBB1C)

                              )),

                              SizedBox(width: 5),

                              controller.isExpanded
                                  ? Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppTheme.themeColor, width: 2)),
                                child: Center(
                                  child: Icon(Icons.keyboard_arrow_up_outlined,
                                      color: AppTheme.themeColor, size: 20),
                                ),
                              )
                                  : Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppTheme.themeColor, width: 2)),
                                child: Center(
                                  child: Icon(Icons.keyboard_arrow_down,
                                      color: AppTheme.themeColor, size: 21),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    content: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          SizedBox(height: 10),

                          Container(

                            child: Row(
                              children: [

                                Expanded(child: Container(
                                  padding: EdgeInsets.only(top: 13,bottom: 13,left: 10,right: 17),
                                  decoration:  BoxDecoration(

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                          spreadRadius: 0, // Spread radius of the shadow
                                          blurRadius: 5, // Blur radius of the shadow
                                          offset: Offset(0, 0), // Offset of the shadow
                                        ),
                                      ],
                                      color:AppTheme.themeColor.withOpacity(0.10),

                                      borderRadius: BorderRadius.circular(10)
                                  ),


                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Caller',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.themeColor

                                      ),),

                                      SizedBox(height: 12),

                                      Text('Vivek',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      ),),


                                    ],
                                  ),





                                ),flex: 1),


                                SizedBox(width: 11),
                                Expanded(child: Container(
                                  padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                                  decoration:  BoxDecoration(

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                          spreadRadius: 0, // Spread radius of the shadow
                                          blurRadius: 5, // Blur radius of the shadow
                                          offset: Offset(0, 0), // Offset of the shadow
                                        ),
                                      ],
                                      color:AppTheme.themeColor.withOpacity(0.10),

                                      borderRadius: BorderRadius.circular(10)
                                  ),


                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Call Back Done',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.themeColor

                                      ),),

                                      SizedBox(height: 12),


                                      Row(
                                        children: [

                                          callBackRadio==0?
                                          Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                          GestureDetector(
                                              onTap:(){

                                                setState(() {
                                                  callBackRadio=0;
                                                });


                                              },


                                              child: Icon(Icons.radio_button_off)),
                                          SizedBox(width: 5),

                                          Text('YES',style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black

                                          )),


                                          Spacer(),

                                          callBackRadio==1?
                                          Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                          GestureDetector(
                                              onTap:(){

                                                setState(() {
                                                  callBackRadio=1;
                                                });


                                              },


                                              child: Icon(Icons.radio_button_off)),
                                          SizedBox(width: 5),

                                          Text('NO',style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black

                                          )),



                                        ],
                                      )


                                    ],
                                  ),





                                ),flex: 1),

                              ],
                            ),
                          ),


                          SizedBox(height: 10),

                          Container(

                            child: Row(
                              children: [

                                Expanded(child: Container(
                                  padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                  decoration:  BoxDecoration(

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                          spreadRadius: 0, // Spread radius of the shadow
                                          blurRadius: 5, // Blur radius of the shadow
                                          offset: Offset(0, 0), // Offset of the shadow
                                        ),
                                      ],
                                      color:AppTheme.themeColor.withOpacity(0.10),

                                      borderRadius: BorderRadius.circular(10)
                                  ),


                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Planned Huddle Date',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.themeColor

                                      ),),

                                      SizedBox(height: 12),

                                      Text('12-05-2024',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      ),),


                                    ],
                                  ),





                                ),flex: 1),


                                SizedBox(width: 11),
                                Expanded(child: Container(
                                  padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                  decoration:  BoxDecoration(

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                          spreadRadius: 0, // Spread radius of the shadow
                                          blurRadius: 5, // Blur radius of the shadow
                                          offset: Offset(0, 0), // Offset of the shadow
                                        ),
                                      ],
                                      color:AppTheme.themeColor.withOpacity(0.10),

                                      borderRadius: BorderRadius.circular(10)
                                  ),


                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Actual Huddle Date',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.themeColor

                                      ),),

                                      SizedBox(height: 12),

                                      Text('-',style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black

                                      ),),


                                    ],
                                  ),





                                ),flex: 1),

                              ],
                            ),
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Call-Back Verbatim(Customer)',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),
                                    selectedIndexes.contains(index)?
                                    SizedBox(height: 12):SizedBox(height: 8),
                                    selectedIndexes.contains(index)?

                                    Text('-',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    ),):


                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                          controller: customerController,
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF707070),
                                          ),
                                          decoration: InputDecoration(
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
                                              EdgeInsets.fromLTRB(12.0, 7.0, 5, 5),
                                              //prefixIcon: fieldIC,
                                              hintText: "Enter here",
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF707070).withOpacity(0.4),
                                              ))),
                                    ),


                                  ],
                                ),





                              ),flex: 1),
                            ],
                          ),





                          SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Call-Back Verbatim(Dealer)',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),
                                    selectedIndexes.contains(index)?
                                    Text('Customer not contactable',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black

                                    )):Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                          controller: dealerController,
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF707070),
                                          ),
                                          decoration: InputDecoration(
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
                                              EdgeInsets.fromLTRB(12.0, 7.0, 5, 5),
                                              //prefixIcon: fieldIC,
                                              hintText: "Enter here",
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF707070).withOpacity(0.4),
                                              ))),
                                    ),


                                  ],
                                ),





                              ),flex: 1),
                            ],
                          ),


                          SizedBox(height: 10),


                          Row(
                            children: [

                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 20),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Resolvable at Dealer',style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),),

                                    SizedBox(height: 12),


                                    Row(
                                      children: [

                                        resolveRadio==0?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                resolveRadio=0;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('YES',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),


                                        Spacer(),

                                        resolveRadio==1?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                resolveRadio=1;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('NO',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),



                                      ],
                                    )


                                  ],
                                ),





                              ),flex: 1),


                              SizedBox(width: 10),


                              Expanded(child: Container(
                                padding: EdgeInsets.only(top: 8,bottom: 10,left: 10,right: 5),
                                decoration:  BoxDecoration(

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                        spreadRadius: 0, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: Offset(0, 0), // Offset of the shadow
                                      ),
                                    ],
                                    color:AppTheme.themeColor.withOpacity(0.10),

                                    borderRadius: BorderRadius.circular(10)
                                ),


                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Customer Loop Closure',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.themeColor

                                    ),maxLines: 1),

                                    SizedBox(height: 12),


                                    Row(
                                      children: [

                                        customerLoopRadio==0?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                customerLoopRadio=0;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Text('YES',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black

                                        )),


                                        Spacer(),

                                        customerLoopRadio==1?
                                        Icon(Icons.radio_button_on_sharp,color: AppTheme.themeColor):
                                        GestureDetector(
                                            onTap:(){

                                              setState(() {
                                                customerLoopRadio=1;
                                              });


                                            },


                                            child: Icon(Icons.radio_button_off)),
                                        SizedBox(width: 5),

                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text('NO',style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black

                                          )),
                                        ),



                                      ],
                                    )


                                  ],
                                ),





                              ),flex: 1),

                            ],
                          ),
                          SizedBox(height: 14),


                          selectedIndexes.contains(index)?

                              Container():



                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [

                               attemptNumber>2 && index==attemptNumber-1?Container():

                                Expanded(child: Container(
                                  height: 42,
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
                                      controller.toggle();
                                     saveEmptyDetails();

                                    },
                                    child: const Text(
                                      'No Response',
                                      style: TextStyle(fontSize: 13.5,color: Colors.white,fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),flex: 1),

                                SizedBox(width: 15),

                                Expanded(child: Container(
                                  height: 42,
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
                                      controller.toggle();
                                      saveCallBackDetails();
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




                          SizedBox(height: 5),

                        ],
                      ),
                    ),
                    onTap: () {

                  /*    if(_controller2.isExpanded)
                      {
                        _controller2.toggle();
                      }*/



                      setState(() {});
                    },
                    onLongTap: () {
                      debugPrint("long tapped!!");
                    },
                  );
                }


                )



              ],
            ),

          ),


          SizedBox(height: 14),

          Row(
            children: [
              SizedBox(width: 10),
              Text('Root cause Analysis',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.themeColor

              )),
            ],
          ),


          SizedBox(height: 12),




          ListView.builder(
              itemCount: rootCauseList.length,
              shrinkWrap: true,
              physics:NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int pos)
          {
            return Column(
              children: [
                InkWell(
                  onTap: (){

                    if(callerID=='')
                    {
                      Toast.show("Please submit Call back details first !",
                          duration: Toast.lengthLong,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.red);
                    }
                    else{
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen(widget.huddleID,rootCauseList[pos]["id"].toString(),rootCauseList,pos,callerID)));

                    }
                  },
                  child: Container(
                    height: 47,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.only(left: 12,right: 12),
                    decoration:  BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // Color of the shadow
                            spreadRadius: 0, // Spread radius of the shadow
                            blurRadius: 5, // Blur radius of the shadow
                            offset: Offset(0, 0), // Offset of the shadow
                          ),
                        ],
                        color:AppTheme.themeColor.withOpacity(0.10),

                        borderRadius: BorderRadius.circular(10)
                    ),


                    child: Row(
                      children: [

                        Container(
                          width: 21.15,
                          height: 22,
                          decoration: BoxDecoration(
                              color: Color(0xFf00407E),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(
                            child:  Text('0'+(pos+1).toString(),style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white

                            )),
                          ),

                        ),


                        SizedBox(width: 12),


                        Expanded(
                          child: Text(rootCauseList[pos]["title"],style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                        ),

                        SizedBox(width: 5),


                        Image.asset("assets/expand_ic.png",width: 22,height: 22,)







                      ],
                    ),


                  ),
                ),
                SizedBox(height: 15),


              ],
            );
          }

          ),


          SizedBox(height: 22),






        ],
      ),
    );
  }

  void _modalBottomSheetCallers() {
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
                    child: Text('Search Caller',style: TextStyle(
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
                    height: 195,
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

                                  SizedBox(width: 22),


                                  Expanded(child: Text(nameList[pos],style: TextStyle(
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


  fetchCustomerDetails(bool loadData) async {
    setState(() {
      isLoading=true;
    });

    var requestModel = {
      "huddle_id":widget.huddleID,
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('customer-response',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    customerData= responseJSON["data"];
     rootCauseList=responseJSON["data"]['l2_relationship'];

    if(loadData)
      {
        attemptNumber=customerData["attempt_number"];
        if(attemptNumber==2)
        {
          selectedIndexes.add(0);
        }
        else if(attemptNumber==3)
        {
          selectedIndexes.add(0);
          selectedIndexes.add(1);

        }
      }


    setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCustomerDetails(true);
  }

  saveCallBackDetails() async {

    APIDialog.showAlertDialog(context,"Saving details..");

    var requestModel = {
      "caller_name":widget.huddleID,
      "huddle_data_id":widget.huddleID,
      "call_back_done":callBackRadio==0?"yes":"no",
      "planned_huddle_date":'2023-12-06',
      "actual_huddle_date":'2023-12-06',
      "customer_feedback":customerController.text,
      "dealer_feedback":dealerController.text,
      "attempt_number":attemptNumber,
      "customer_loop_closer":customerLoopRadio==0?"yes":"no",
      "resolve_at_dealer":resolveRadio==0?"yes":"no",
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('save-callback-details',requestModel,context);
    var responseJSON = json.decode(response.body);
     Navigator.pop(context);
    print(responseJSON);
    if(responseJSON['status'])
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
        callerID= responseJSON["data"]['id'].toString();
      }
    else
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }



    setState(() {});

  }

  saveEmptyDetails() async {

    APIDialog.showAlertDialog(context,"Saving details..");

    var requestModel = {
      "caller_name":widget.huddleID,
      "huddle_data_id":widget.huddleID,
      "attempt_number":attemptNumber,
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('save-callback-details',requestModel,context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON['status'])
    {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);

      setState(() {

      });
      attemptNumber=attemptNumber+1;

      selectedIndexes.clear();
      if(attemptNumber==2)
      {
        selectedIndexes.add(0);
      }
      else if(attemptNumber==3)
      {
        selectedIndexes.add(0);
        selectedIndexes.add(1);

      }
      fetchCustomerDetails(false);
    }
    else
    {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }



    setState(() {});

  }
}