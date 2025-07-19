
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';

class CalenderDetailScreen extends StatefulWidget
{
  final String date;
  CalenderDetailScreen(this.date);
  CalenderState createState()=>CalenderState();
}

class CalenderState extends State<CalenderDetailScreen>
{
  bool isLoading=false;
  List<dynamic> tasksList=[];
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

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('Planned Huddle Date',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor)),




                Text(widget.date +' December',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),

              ],
            ),
          ),

          SizedBox(height: 15),

         
          Expanded(child: ListView.builder(
              itemCount: tasksList.length,
              
              itemBuilder: (BuildContext context,int pos)
          {
            return Column(
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                    color:
                    tasksList[pos]["huddle_status"]=="submitted"?
                    Color(0xFf09AD3F).withOpacity(0.49):

                    tasksList[pos]["huddle_status"]=="pending"?

                    Color(0xFfCDC712).withOpacity(0.49):

                    tasksList[pos]["huddle_status"]=="upcoming"?

                    AppTheme.themeColor.withOpacity(0.49):
                    Color(0xFfDB0000).withOpacity(0.49),
                    borderRadius: BorderRadius.circular(5),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                        blurRadius: 5, // Blur radius of the shadow
                        offset: Offset(0, 0), // Offset of the shadow
                      ),
                    ],
                  ),

                  child: Column(
                    children: [




                      tasksList[pos]["huddle_status"]=="submitted"?Container():
                      Container(
                        height: 39,
                        decoration: BoxDecoration(
                            color:

          tasksList[pos]["huddle_status"]=="pending"?

          Color(0xFfC4C15C):

          tasksList[pos]["huddle_status"]=="upcoming"?

          AppTheme.themeColor:Color(0xFfE44242)

                            ,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text('Actual Huddle Date',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),




                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(parseServerFormatDate(tasksList[pos]["date"].toString()),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [

                                Icon(Icons.person,color: AppTheme.themeColor),
                                SizedBox(width: 4),
                                Text(tasksList[pos]["members_count"].toString()+' Selected',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),

                              ],
                            ),

                            Column(
                              children: [

                                Text('Status',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.themeColor)),

                                Text(tasksList[pos]["huddle_status"],
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),

                              ],
                            )




                          ],
                        ),
                      ),


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
      )

    );
  }

  fetchCalenderDetails() async {
    setState(() {
      isLoading=true;
    });

    var requestModel={
      "date":widget.date,
      "month":"2023-12"
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('huddle-calender-detail',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    tasksList= responseJSON['data'];
    setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCalenderDetails();
  }
  String parseServerFormatDate(String serverDate) {
    var date = DateTime.parse(serverDate);
    final dateformat = DateFormat.yMMMd();
    final clockString = dateformat.format(date);
    return clockString.toString();
  }
}
