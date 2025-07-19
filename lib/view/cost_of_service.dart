import 'package:bajaj_app/view/quality_of_service.dart';
import 'package:bajaj_app/view/servicing_time_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_theme.dart';
import '../widgets/textfield_widget.dart';

class CostOfServiceScreen extends StatefulWidget {
  QualityState createState() => QualityState();
}

class QualityState extends State<CostOfServiceScreen> {
  ExpandedTileController _controller = ExpandedTileController(isExpanded: true);
  ExpandedTileController _controller2 = ExpandedTileController();
  ExpandedTileController _controller3 = ExpandedTileController();
  bool open=false;
  bool check1Status=false;
  bool check2Status=false;
  List<String> inventoryList=[
    "People",
    "Process",
    "Service",
    "Inventory",
    "Pricing",
    "Customer lounge facilities",
    "Others (Specify)",
  ];
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
      body: ListView(
        children: [
          SizedBox(height: 15),


          InkWell(
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

                        Text('L2',style: TextStyle(
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


          SizedBox(height: 10),

          InkWell(
            onTap: (){
            //  Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen()));
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
                            Text('Servicing time',style: TextStyle(
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


          SizedBox(height: 10),
          Container(
            height: 47,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(left: 7, right: 7),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                InkWell(
                    onTap:(){

                   //   Navigator.push(context,MaterialPageRoute(builder: (context)=>ServiceTimeScreen()));


          },

                    child: Icon(Icons.arrow_back_ios, color: AppTheme.themeColor)),
                SizedBox(width: 12),
                Expanded(
                  child: Center(
                    child: Text('Cost of service',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFf929292))
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Color of the shadow
                  spreadRadius: 0, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset of the shadow
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ExpandedTile(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('L3 Selected by Customer',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF00407E))),
                        Spacer(),
                        _controller.isExpanded
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
                            child: Text('01',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Cost of labor',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),

                      TextFieldWidget(
                          'Resolution to customer','Enter Here'
                      ),
                      SizedBox(height: 10),

                      TextFieldWidget(
                          'Customer Remark on resolution','Enter Here'
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
                          _modalBottomSheetInventory();
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

                              Text('Inventory',
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
                          'Sub Root Cause-Type',
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
                          _modalBottomSheetSubInventory();
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

                              Text('Sub root cause',
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




                      TextFieldWidget(
                          'Inner loop resolution','Enter Here'
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
                                  check1Status=!check1Status;
                                });
                              },

                              child: Container(
                                  child: check1Status?
                                  Icon(Icons.check_box,color: AppTheme.themeColor,size: 28):
                                  Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFfD7C8C0),size: 28)
                              ))


                        ],
                      ),




                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                if (_controller2.isExpanded) {
                  _controller2.toggle();
                }
                if (_controller3.isExpanded) {
                  _controller3.toggle();
                }
                setState(() {});
              },
              onLongTap: () {
                debugPrint("long tapped!!");
              },
            ),
          ),



          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Color of the shadow
                  spreadRadius: 0, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset of the shadow
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ExpandedTile(
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
                        Text('L3 Selected by Customer',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF00407E))),
                        Spacer(),
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
                        SizedBox(width: 12),
                        Container(
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Color(0xFf00407E),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text('02',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Cost of Value added service',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),


                      TextFieldWidget(
                          'Resolution to customer','Enter Here'
                      ),
                      SizedBox(height: 10),

                      TextFieldWidget(
                          'Customer Remark on resolution','Enter Here'
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
                          _modalBottomSheetInventory();
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

                              Text('Inventory',
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
                          'Sub Root Cause-Type',
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
                          _modalBottomSheetSubInventory();
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

                              Text('Sub root cause',
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



                      TextFieldWidget(
                          'Inner loop resolution','Enter Here'
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
                                  check2Status=!check2Status;
                                });
                              },

                              child: Container(
                                  child: check2Status?
                                  Icon(Icons.check_box,color: AppTheme.themeColor,size: 28):
                                  Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFfD7C8C0),size: 28)
                              ))


                        ],
                      ),




                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                if (_controller.isExpanded) {
                  _controller.toggle();
                }
                if (_controller3.isExpanded) {
                  _controller3.toggle();
                }
                setState(() {});
              },
              onLongTap: () {
                debugPrint("long tapped!!");
              },
            ),
          ),

          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 57,
                width: 192,
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
                    _modalSheetSubmit();
                  },
                  child: const Text(
                    'Save & Submit',
                    style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 25),


        ],
      ),
    );
  }
  void _modalBottomSheetInventory() {
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
                          itemCount: inventoryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (BuildContext context,int pos)
                          {
                            return InkWell(
                              onTap: (){
                              },
                              child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                                child: Row(
                                  children: [

                                    SizedBox(width: 22),


                                    Expanded(child: Text(inventoryList[pos],style: TextStyle(
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
  void _modalBottomSheetSubInventory() {
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
                          itemCount: inventoryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (BuildContext context,int pos)
                          {
                            return InkWell(
                              onTap: (){
                              },
                              child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),

                                child: Row(
                                  children: [

                                    SizedBox(width: 22),


                                    Expanded(child: Text(inventoryList[pos],style: TextStyle(
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
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
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


}
