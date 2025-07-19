
import 'dart:convert';

import 'package:bajaj_app/network/shopper_network/api_helper.dart';
import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetails extends StatefulWidget {
  bool showBack;
  String selectIdx ='';
  HistoryDetails(this.showBack,this.selectIdx);
  @override
  HistoryState createState() => HistoryState();
}
class HistoryState extends State<HistoryDetails>{
  int status =-1;
  String createDate = '';
  String assignDate = '';
  String attempt1Date = '';
  String attempt2Date = '';
  String attempt3Date = '';
  List<String> status2List=[];
  String assignName = '';
  String assignName1 = '';
  String textMsg = '';
  List<dynamic> historyList = [];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.56;
    return Container(
      margin: EdgeInsets.only(left: 0,right: 0, top: 20, bottom: 20),
      child:  AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Set the corner radius here
        ),

        content: Container(
        //  height: 300,
          child:Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,    // Set the desired width
                  height: 3,     // Set the desired height
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Send Case',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,  // Set the desired width
              height: 1,     // Set the desired height
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Container(
              height: containerHeight,
              width: 350,
              child: ListView.builder(

                  itemCount: historyList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context,int pos)

                  {
                    DateTime dateTime = DateTime.parse(historyList[pos]['updated_at']);
                    createDate = DateFormat('dd-MM-yyyy').format(dateTime);
                    if (historyList[pos]['agent'] != null){
                      assignName = historyList[pos]['agent']['name'];
                    }
                    if (historyList[pos]['text'] != null){
                      textMsg = historyList[pos]['text'];
                    }
                    if(historyList[pos]["status"]==2)
                      {
                        status2List.add("Item");
                      }

                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/right.png', width: 20, height: 20),
                              SizedBox(width: 12),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  historyList[pos]["status"]==2?
                                  Text(
                                     status2List.length==1?
                                    "Attempt 1":
                                         status2List.length==2?
                                             "Attempt 2":
                                         status2List.length==3?
                                             "Attempt 3":''
                                    ,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppTheme.blueColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ):
                                  Text(
                                    historyList[pos]["status"]==0?
                                    'Ticket Generated': historyList[pos]["status"]==1? 'Ticket Assigned'
                                        :historyList[pos]["status"]==3? 'Reassigned':historyList[pos]["status"]==4? 'Resolved'
                                        :historyList[pos]["status"]==5? 'Auto Close':historyList[pos]["status"]==6? 'System Close':'',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppTheme.blueColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    width: 3, // Width of the vertical line
                                    height: 35, // Height of the vertical line
                                    color: AppTheme.blueColor, // Color of the vertical line
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Image.asset('assets/right.png', width: 20, height: 20),
                                  SizedBox(width: 8),
                                  historyList[pos]["status"]==2?


                                  Text(
                                    status2List.length==1?
                                    'Done by ' + assignName +' on '+ createDate:
                                    status2List.length==2?
                                    'Done by ' + assignName +' on '+ createDate:
                                    status2List.length==3?
                                    'Done by ' + assignName +' on '+ createDate:''
                                    ,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.grayColor,
                                    ),
                                  ):
                                  Text(
                                    historyList[pos]["status"]==0?
                                    'Generated on ' + createDate: historyList[pos]["status"]==1? 'Assigned to '+ assignName +' on ' + createDate
                                        :historyList[pos]["status"]==3? 'Reassigned by '+ assignName +' on ' + createDate:historyList[pos]["status"]==4? 'Resolved by '+ assignName +' on ' + createDate
                                        :historyList[pos]["status"]==5? 'Auto close on '+ createDate:historyList[pos]["status"]==6? 'System Close on ' + createDate:'',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppTheme.grayColor,
                                    ),

                                  ),
                                ],
                              ),
                            ],

                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    width: 3, // Width of the vertical line
                                    height: 50, // Height of the vertical line
                                    color: AppTheme.blueColor, // Color of the vertical line
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Image.asset('assets/right.png', width: 20, height: 20),
                                  SizedBox(width: 22),
                                  historyList[pos]["status"]==2?
                                  Text(
                                    status2List.length==1?
                                    'Remark :' + textMsg:
                                    status2List.length==2?
                                    'Remark :' + textMsg:
                                    status2List.length==3?
                                    'Remark :' + textMsg:''
                                    ,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.blackColor,
                                    ),
                                  ):
                                  Text(
                                    historyList[pos]["status"]==0?
                                    '': historyList[pos]["status"]==1? 'Remark :' + textMsg
                                        :historyList[pos]["status"]==3?'Remark :' + textMsg:historyList[pos]["status"]==4? 'Remark :' + textMsg
                                        :historyList[pos]["status"]==5? 'Remark :' + textMsg:historyList[pos]["status"]==6? 'Remark :' + textMsg:'',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ],
                      ),
                    );
                  }

              ),
            ),

          ],
        ),

        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 4), // Set left margin here
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('Close',
                  style: TextStyle(
                    color: Colors.white, // Set the text color of the ElevatedButton here
                  ),
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(120, 40)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),//
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryData();
  }

  getHistoryData() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('sc/get-history/' + widget.selectIdx, context);
    var responseJSON = json.decode(response.body);
    historyList = responseJSON["data"];

    print(status);
    setState(() {});
  }
}