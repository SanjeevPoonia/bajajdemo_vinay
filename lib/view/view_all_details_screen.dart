

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';

class ViewDetailsScreen extends StatefulWidget
{
  ViewDetailState createState()=>ViewDetailState();
}
class ViewDetailState extends State<ViewDetailsScreen>
{
  bool isLoading=false;
  Map<String,dynamic> userData={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 23),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
        title: Text(
          'View All Details',
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

      body:
      isLoading?
          Center(
            child: Loader(),
          ):

          userData.isEmpty?

              Container():



      Column(
        children: [

          SizedBox(height: 15),


          Container(
            height: 47,

            padding: EdgeInsets.only(left: 12,right: 12),
            decoration:  BoxDecoration(
                color:Color(0xFfEBEBEB),
            ),


            child: Row(
              children: [

                SizedBox(width: 8),


                Expanded(
                  child: Text('Customer Details',style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF025CA5))),
                ),

                SizedBox(width: 5),


                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/backk.png")),

                SizedBox(width: 5),





              ],
            ),


          ),

          Padding(padding: EdgeInsets.all(11),

          child: Row(
            children: [

              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Customer Name',style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070))),

                  SizedBox(height: 10),

                  Text(userData['cust_name'],style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),

                  SizedBox(height: 15),


                  Text('Document Number',style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070))),

                  SizedBox(height: 10),

                  Text(userData['doc_number'],style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),


                ],


              ),flex: 1),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Mobile Number/Unique ID',style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070))),

                  SizedBox(height: 10),

                  Text(userData['phone'].toString(),style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),

                  SizedBox(height: 15),


                  Text('Model',style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF707070))),

                  SizedBox(height: 10),

                  Text(userData['model'],style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),


                ],


              ),flex: 1),

            ],
          ),


          ),

          Container(
            height: 47,

            padding: EdgeInsets.only(left: 12,right: 12),
            decoration:  BoxDecoration(
              color:Color(0xFfEBEBEB),
            ),


            child: Row(
              children: [

                SizedBox(width: 8),


                Expanded(
                  child: Text('NPS Response',style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF025CA5))),
                ),








              ],
            ),


          ),

          Padding(padding: EdgeInsets.all(11),

            child: Row(
              children: [

                Expanded(child: Row(
                  children: [

                    Text('NPS Rating :',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(width: 5),

                    Text('3',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFfDB0000))),

                    SizedBox(height: 15),




                  ],


                ),flex: 1),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Feedback Type',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text('DETRACTOR',style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFfDB0000))),



                  ],


                ),flex: 1),

              ],
            ),


          ),

          Container(
            height: 47,
            padding: EdgeInsets.only(left: 12,right: 12),
            decoration:  BoxDecoration(
              color:Color(0xFfEBEBEB),
            ),


            child: Row(
              children: [

                SizedBox(width: 8),


                Expanded(
                  child: Text('Other Details',style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF025CA5))),
                ),








              ],
            ),


          ),


          Padding(padding: EdgeInsets.all(11),

            child: Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Registration Number',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text(userData['registration_number'],style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),

                    SizedBox(height: 15),


                    Text('Service Provider',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text(userData['service_provider']['EMPLNAME'],style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),

                    SizedBox(height: 15),


                    Text('Chassis Number',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text(userData['chassis_number'],style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                  ],


                ),flex: 1),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Visit Date',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text(userData['created_at'].toString(),style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),

                    SizedBox(height: 15),


                    Text('Feedback Date',style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF707070))),

                    SizedBox(height: 10),

                    Text(userData['created_at'].toString(),style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),


                  ],


                ),flex: 1),


              ],
            ),


          ),
        ],
      ),
    );
  }
  fetchAllDetails() async {
    setState(() {
      isLoading = true;
    });

    var requestModel = {"customer_id": "19"};

    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.postAPI('customer-details',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading = false;
    print(responseJSON);
    userData = responseJSON["data"];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllDetails();
  }
}