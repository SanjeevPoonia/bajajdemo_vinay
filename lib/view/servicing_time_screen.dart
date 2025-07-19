import 'dart:convert';

import 'package:bajaj_app/network/api_dialog.dart';
import 'package:bajaj_app/view/quality_of_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import '../widgets/textfield_widget.dart';
import 'cost_of_service.dart';

class ServiceTimeScreen extends StatefulWidget {
  final String huddleID;
  final String l2ID;
  List<dynamic> l2List;
  int selectedIndex;
  String callbackServiceID;
  ServiceTimeScreen(this.huddleID,this.l2ID,this.l2List,this.selectedIndex,this.callbackServiceID);
  QualityState createState() => QualityState();
}

class QualityState extends State<ServiceTimeScreen> {
  int selectedL2Index=0;
  String l2ID="";
  List<dynamic> l2List=[];
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> resolutionToCustomerController=[];
  List<bool> checkBoxList=[];
  List<TextEditingController> customerRemarkController=[];
  List<TextEditingController> innerLoopSolutionController=[];
  List<String> rootCauseDrop=[];
  List<String> subRootCauseDrop=[];
  ExpandedTileController _controller = ExpandedTileController(isExpanded: true);
  ExpandedTileController _controller2 = ExpandedTileController();
  ExpandedTileController _controller3 = ExpandedTileController();
  bool open=false;
  List<dynamic> rootList=[];
  List<dynamic> subRootList=[];
  bool check1Status=false;
  bool check2Status=false;
  bool check3Status=false;
  List<dynamic> l3List=[];
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

            //  _logOut();
            // Add your right button action here
          },
        ),
        title: Text(
          'Customer Feedbacks',
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

      ListView(
        children: [
          SizedBox(height: 15),

        /*  InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>QualityService()));
            },
            child: Container(
              height: 56,
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

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('L2 Driver',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.themeColor)),
                        Row(
                          children: [
                            Text('Quality of Service',style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),

                            SizedBox(width: 5),

                            Icon(Icons.check,color: Color(0xFf2EA44C))
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(width: 12),






                  Image.asset("assets/expand_ic.png",width: 22,height: 22,)







                ],
              ),


            ),
          ),


          SizedBox(height: 10),*/
          Container(
            height: 47,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(left: 7, right: 7),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                selectedL2Index==0?
                Icon(Icons.arrow_back_ios, color: Colors.grey):


                InkWell(
                    onTap:(){
                      Navigator.pop(context);
                   //   Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen(widget.huddleID,l2List[selectedL2Index-1]["id"].toString(),l2List,selectedL2Index-1,widget.callbackServiceID)));

                    },

                    child: Icon(Icons.arrow_back_ios, color: AppTheme.themeColor)),
                SizedBox(width: 12),
                Expanded(
                  child: Center(
                    child: Text(l2List[selectedL2Index]["title"],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(width: 5),

                selectedL2Index==l2List.length-1?

                Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.grey):

                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen(widget.huddleID,l2List[selectedL2Index+1]["id"].toString(),l2List,selectedL2Index+1,widget.callbackServiceID)));

                  },
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: AppTheme.themeColor),
                )
              ],
            ),
          ),
          SizedBox(height: 15),


          l3List.length==0?


              Center(
                child: Text("No data found"),
              ):



          ExpandedTileList.builder(
              maxOpened: 1,
              itemCount: l3List.length, itemBuilder: (context,index,controller)

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
              controller: _controller,
              title: Container(
                padding:EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: Colors.white,


                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Color of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                        blurRadius: 5, // Blur radius of the shadow
                        offset: Offset(0, 0), // Offset of the shadow
                      ),
                    ],

                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('L3 Selected by Customer',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF00407E))),
                        Spacer(),
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
                        SizedBox(width: 12),
                        Container(
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Color(0xFf00407E),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text('0'+(index+1).toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(l3List[index]['title'],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ],
                ),
              ),
              content: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                ),

                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 3, top: 10, right: 3, bottom: 5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Container(
                          child:  Text(
                            'Resolution to customer',
                            style: TextStyle(
                              color: AppTheme.themeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextFormField(
                              controller: resolutionToCustomerController[index],
                              validator: checkEmptyStringValidator,
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF707070),
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 0.3)),
                                  //contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  fillColor: Color(0xFfF7F7F7),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 7.0, 5, 5),
                                  //prefixIcon: fieldIC,
                                  hintText:'Enter Here',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF707070)))),
                        ),


                        SizedBox(height: 10),

                        Container(
                          child:  Text(
                            'Customer Remark on resolution',
                            style: TextStyle(
                              color: AppTheme.themeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextFormField(
                              validator: checkEmptyStringValidator,
                              controller: customerRemarkController[index],
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF707070),
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 0.3)),
                                  //contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  fillColor: Color(0xFfF7F7F7),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 7.0, 5, 5),
                                  //prefixIcon: fieldIC,
                                  hintText:'Enter Here',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF707070)))),
                        ),
                        SizedBox(height: 10),

                        Container(
                          child:  Text(
                            'Root Cause-Type',
                            style: TextStyle(
                              color: AppTheme.themeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        InkWell(
                          onTap: (){
                            _modalBottomSheetInventory(index);
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color(0xFfF7F7F7),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Color(0xFf707070),width: 0.3)
                            ),
                            child: Row(
                              children: [

                                SizedBox(width:15),

                                Text(rootCauseDrop[index]==""?"Select root cause":rootCauseDrop[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFf929292))),

                                Spacer(),

                                Icon(Icons.arrow_drop_down,size: 31),

                                SizedBox(width:7),

                              ],
                            ),
                          ),
                        ),


                        rootCauseDrop[index]==""?Container():
                        SizedBox(
                          height: 10,
                        ),

                        rootCauseDrop[index]==""?Container():
                        Container(
                          child:  Text(
                            'Sub Root Cause-Type',
                            style: TextStyle(
                              color: AppTheme.themeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        rootCauseDrop[index]==""?Container():
                        SizedBox(
                          height: 5,
                        ),
                        rootCauseDrop[index]==""?Container():
                        InkWell(
                          onTap: (){
                            _modalBottomSheetSubInventory(index);
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color(0xFfF7F7F7),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Color(0xFf707070),width: 0.3)
                            ),
                            child: Row(
                              children: [

                                SizedBox(width:15),

                                Text(subRootCauseDrop[index]==""?"Select sub root cause":subRootCauseDrop[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFf929292))),

                                Spacer(),

                                Icon(Icons.arrow_drop_down,size: 31),

                                SizedBox(width:7),

                              ],
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          child:  Text(
                            'Inner loop resolution',
                            style: TextStyle(
                              color: AppTheme.themeColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextFormField(
                              validator: checkEmptyStringValidator,
                              controller: innerLoopSolutionController[index],
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF707070),
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF707070), width: 0.3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 0.3)),
                                  //contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  fillColor: Color(0xFfF7F7F7),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 7.0, 5, 5),
                                  //prefixIcon: fieldIC,
                                  hintText:'Enter Here',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF707070)))),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Text('Escalate to higher level',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),

                            Spacer(),

                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    checkBoxList[index]=!checkBoxList[index];
                                  });
                                },

                                child: Container(
                                    child: checkBoxList[index]?
                                    Icon(Icons.check_box,color: AppTheme.themeColor,size: 28):
                                    Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFfD7C8C0),size: 28)
                                ))



                          ],
                        ),


                        SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 52,
                              width: 180,
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

                                  _submitHandler(index);


                               //   _modalSheetSubmit();
                                },
                                child: const Text(
                                  'Save',
                                  style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),




                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ),
              ),
              onTap: () {
              /*  if (_controller2.isExpanded) {
                  _controller2.toggle();
                }
                if (_controller3.isExpanded) {
                  _controller3.toggle();
                }*/
                setState(() {});
              },
              onLongTap: () {
                debugPrint("long tapped!!");
              },
            );
          }


          ),







          SizedBox(height: 25),


        ],
      ),
    );
  }
  void _submitHandler(int index) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    validateRootCause(index);
    //
  }
  String? checkEmptyStringValidator(String? value) {
    if (value!.isEmpty) {
      return 'Cannot be blank';
    }
    return null;
  }
  validateRootCause(int index){

    if(rootCauseDrop[index]=="")
      {
        Toast.show("Please select a Root Cause",
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }
    else if(subRootCauseDrop[index]=="")
      {
        Toast.show("Please select a Sub Root Cause",
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }
    else
      {
        print("All Validations passed");
        saveL3Data(index);
      }





  }
  void _modalBottomSheetInventory(int index) {
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
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
                height: 500,
                child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10),


                    Center(
                      child: Container(
                        width: 111,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF929292)
                        ),
                      ),
                    ),


                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Root Cause-Type',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),



                    Container(
                      child: ListView.builder(
                          itemCount: rootList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (BuildContext context,int pos)
                          {
                            return InkWell(
                              onTap: (){
                                Navigator.pop(context);
                                rootCauseDrop[index]=rootList[pos]["name"];
                                setState(() {

                                });
                                fetchSubRootTypes(rootList[pos]["id"].toString());
                              },
                              child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                                child: Row(
                                  children: [

                                    SizedBox(width: 22),


                                    Expanded(child: Text(rootList[pos]["name"],style: TextStyle(
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
                      margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                      decoration: BoxDecoration(
                        color: open?AppTheme.themeColor.withOpacity(0.10):Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          InkWell(
                            onTap: (){

                              setModalState(() {
                                open=!open;
                              });

                            },
                            child: Container(

                              padding: EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [

                                  SizedBox(width: 5),


                                  Expanded(child: Text('Others (Specify)',style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black

                                  )))


                                ],
                              ),



                            ),
                          ),

                          SizedBox(height: 5),


                          open?

                          Container(
                            margin: EdgeInsets.only(left: 6,right: 6),
                            /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45,width: 1)
                            ),*/
                            child: TextFormField(
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF707070),
                                ),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide:
                                      BorderSide(color: Color(0xFF707070), width: 0.3),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide:
                                        BorderSide(color: Color(0xFF707070), width: 0.3)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(color: Colors.red,width: 0.3)),
                                    //contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    fillColor: Color(0xFFF7F7F7),
                                    filled: true,
                                    contentPadding: EdgeInsets.fromLTRB(10.0, 7.0, 5, 5),
                                    //prefixIcon: fieldIC,
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF707070).withOpacity(0.2),
                                    ))),
                          ):Container(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),




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
              ),
            );
          }),
    );
  }

  void _modalBottomSheetSubInventory(int index) {
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
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
                height: 500,
                child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10),


                    Center(
                      child: Container(
                        width: 111,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF929292)
                        ),
                      ),
                    ),


                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Sub Root Cause-Type',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),



                    Container(
                      child: ListView.builder(
                          itemCount: subRootList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (BuildContext context,int pos)
                          {
                            return InkWell(
                              onTap: (){

                                subRootCauseDrop[index]=subRootList[pos]["name"];
                                setState(() {

                                });

                                Navigator.pop(context);



                              },
                              child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                                child: Row(
                                  children: [

                                    SizedBox(width: 22),


                                    Expanded(child: Text(subRootList[pos]["name"],style: TextStyle(
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
                      margin: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                      decoration: BoxDecoration(
                        color: open?AppTheme.themeColor.withOpacity(0.10):Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          InkWell(
                            onTap: (){

                              setModalState(() {
                                open=!open;
                              });

                            },
                            child: Container(

                              padding: EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [

                                  SizedBox(width: 5),


                                  Expanded(child: Text('Others (Specify)',style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black

                                  )))


                                ],
                              ),



                            ),
                          ),

                          SizedBox(height: 5),


                          open?

                          Container(
                            margin: EdgeInsets.only(left: 6,right: 6),
                            /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45,width: 1)
                            ),*/
                            child: TextFormField(
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF707070),
                                ),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide:
                                      BorderSide(color: Color(0xFF707070), width: 0.3),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide:
                                        BorderSide(color: Color(0xFF707070), width: 0.3)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(color: Colors.red,width: 0.3)),
                                    //contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    fillColor: Color(0xFFF7F7F7),
                                    filled: true,
                                    contentPadding: EdgeInsets.fromLTRB(10.0, 7.0, 5, 5),
                                    //prefixIcon: fieldIC,
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF707070).withOpacity(0.2),
                                    ))),
                          ):Container(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),




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
              ),
            );
          }),
    );
  }
  void _modalSheetSubmit() {
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
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [



                  const SizedBox(height: 23),

                  Row(
                    children: [

                      Spacer(),

                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },

                        child: Icon(Icons.close)),

                    SizedBox(width: 30),


                    ],
                  ),
                  const SizedBox(height: 15),
                  //success_tick

                  Container(

                    //  transform: Matrix4.translationValues(38.0, 0.0, 0.0),
                    height: 80,
                    child: OverflowBox(
                      minHeight: 160,
                      maxHeight: 160,
                      child:Lottie.asset('assets/success_tick.json',
                      ),
                    ),
                  ),


                  const SizedBox(height: 15),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Your Response has been captured successfully',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),textAlign: TextAlign.center),
                  ),


                  const SizedBox(height: 43),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 51,
                        width:139,

                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.white), // background
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Color(0xFF929292)), // fore
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ))),
                          onPressed: () {
                            if(selectedL2Index!=0)
                              {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }



                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                      SizedBox(width: 15),

                      Container(
                        height: 51,
                        width:139,
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
                         if(selectedL2Index!=l2List.length-1)
                              {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen(widget.huddleID,l2List[selectedL2Index+1]["id"].toString(),l2List,selectedL2Index+1,widget.callbackServiceID)));
                              }










//                            Navigator.push(context,MaterialPageRoute(builder: (context)=>CostOfServiceScreen()));
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),




                  const SizedBox(height: 25),
                ],
              ),
            );
          }),
    );
  }

  fetchL3Data() async {
    setState(() {
      isLoading=true;
    });

 /*   var requestModel = {
      "huddle_id":"1202",
      "l2_id":"1",
    };
*/
    var requestModel = {
      "huddle_id":widget.huddleID,
      "l2_id":l2ID,
    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('customer-response-l2-wise',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    l3List= responseJSON["data"];

    for(int i=0;i<l3List.length;i++)
      {
        resolutionToCustomerController.add(TextEditingController());
        customerRemarkController.add(TextEditingController());
        innerLoopSolutionController.add(TextEditingController());
        rootCauseDrop.add("");
        subRootCauseDrop.add("");
        checkBoxList.add(false);
      }


    setState(() {});

  }


  saveL3Data(int index) async {

    APIDialog.showAlertDialog(context, "Submitting feedback...");

    var requestModel = {
      "call_back_detail_id":widget.callbackServiceID,
      "l2_id":l2ID,
      "l3_id":l3List[index]['id'].toString(),
      "follow_up":"test",
      "resolution_to_customer":resolutionToCustomerController[index].text,
      "customer_remark":customerRemarkController[index].text,
      "root_type":rootCauseDrop[index],
      "inner_resolution":innerLoopSolutionController[index].text,
      "escalate_to_high":checkBoxList[index]==false?0:1,
      "root_sub_type":subRootCauseDrop[index],

    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('save-callback-detail-l2-wise',requestModel,context);
    var responseJSON = json.decode(response.body);

    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON["status"])
      {
        _modalSheetSubmit();
      }
    else
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }

  }



  fetchRootTypes() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('show-root-types',context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    rootList= responseJSON["data"];

    setState(() {});

  }

  fetchSubRootTypes(String id) async {
    APIDialog.showAlertDialog(context,"Please wait...");
    if(subRootList.length==0)
      {
        subRootList.clear();
      }
    var formData={
      "root_id":id

    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('show-root-sub-types',formData,context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    subRootList= responseJSON["data"];

    setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedL2Index=widget.selectedIndex;
    l2List=widget.l2List;
    l2ID=widget.l2ID;
    print("L2 ID is "+widget.l2ID);
    fetchL3Data();
    fetchRootTypes();
  }
}
