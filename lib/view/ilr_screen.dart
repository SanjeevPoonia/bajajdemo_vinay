

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'ilr_detail_screen.dart';

class ILRScreen extends StatefulWidget
{
  ILRState createState()=>ILRState();
}
class ILRState extends State<ILRScreen>
{
  List<bool> dateRangeSelected = [false, false, false, false, false];
  List<String> dateRangeList = [
    "Week To Date",
    "Month To Date",
    "Previous Month",
    "Year To Date",
    "Previous Year"
  ];
  int selectedIndex = 2;
  bool isLoading=false;
  List<dynamic> ilrList=[];
  List<bool> branchSelected = [];
  List<dynamic> branchList = [];
  bool check1=false;
  List<String> valueList=[
    'People',
    'Customer',
    'Logistics',
    'Policy & Process',
    'System',
    'Shipper',
    'Others'

  ];
  List<String> valueList2=[
    '20',
    '17',
    '10',
    '15',
    '5',
    '3',
    '3'
  ];
  int selectedSelectBranchFilter = 9999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Container(),
          onPressed: () {
            //  _logOut();
            // Add your right button action here
          },
        ),
        title: Text(
          'Inner Loop Resolution',
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

      Column(
        children: [
          SizedBox(height: 10),
          Container(
            //  height: 43,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter',
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

          SizedBox(height: 5),

          Container(
            //  height: 43,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Show Repeated',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.themeColor)),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        check1=!check1;
                      });
                    },

                    child: Container(
                        child: check1?
                        Icon(Icons.check_box,color: AppTheme.themeColor,size: 28):
                        Icon(Icons.check_box_outline_blank_sharp,color: Color(0xFfD7C8C0),size: 28)
                    ))
              ],
            ),
          ),

          SizedBox(height: 10),

          Expanded(child: ListView.builder(
              itemCount: ilrList.length,
              itemBuilder: (BuildContext context,int pos)
          {
            return Column(
              children: [

                check1?

                ilrList[pos]["repeated"]==2?

                InkWell(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ILRDetailScreen(ilrList[pos]["root_type"],ilrList,pos)));

                  },
                  child: Container(
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
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                              color: AppTheme.themeColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [

                                SizedBox(width: 12),
                                Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xFf00407E),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Text('0'+(pos+1).toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                ),


                                ilrList[pos]["repeated"]>1?

                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFfDB0000)
                                  ),

                                  child: Center(
                                    child: Image.asset("assets/refresh_ic.png",width: 15,height: 15,color: Colors.white),
                                  ),

                                ):Container(),
                                Spacer(),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppTheme.themeColor, width: 2)),
                                  child: Center(
                                    child: Icon(Icons.keyboard_arrow_right_rounded,
                                        color: AppTheme.themeColor, size: 21),
                                  ),
                                ),

                                SizedBox(width: 12),


                              ],
                            )
                        ),

                        Container(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [

                                SizedBox(width: 12),

                                Expanded(child: Text(ilrList[pos]["root_type"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))),
                                Text(ilrList[pos]["root_type_count"].toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color:AppTheme.themeColor)),

                                SizedBox(width: 12),


                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ):Container():InkWell(
                  onTap:(){

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ILRDetailScreen(ilrList[pos]["root_type"],ilrList,pos)));


                  },
                  child: Container(
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
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                              color: AppTheme.themeColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [

                                SizedBox(width: 12),
                                Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xFf00407E),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Text('0'+(pos+1).toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                ),


                                ilrList[pos]["repeated"]==2?

                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFfDB0000)
                                  ),

                                  child: Center(
                                    child: Image.asset("assets/refresh_ic.png",width: 15,height: 15,color: Colors.white),
                                  ),

                                ):Container(),
                                Spacer(),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppTheme.themeColor, width: 2)),
                                  child: Center(
                                    child: Icon(Icons.keyboard_arrow_right_rounded,
                                        color: AppTheme.themeColor, size: 21),
                                  ),
                                ),

                                SizedBox(width: 12),


                              ],
                            )
                        ),

                        Container(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [

                                SizedBox(width: 12),

                                Expanded(child: Text(ilrList[pos]["root_type"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))),
                                Text(ilrList[pos]["root_type_count"].toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color:AppTheme.themeColor)),

                                SizedBox(width: 12),


                              ],
                            )
                        ),
                      ],
                    ),
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


  fetchILRData() async {
    setState(() {
      isLoading=true;
    });

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('irl-dashboard',context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    ilrList= responseJSON["data"]['root_type_counts'];
    setState(() {});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchILRData();
    fetchRegionList();
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
                                  selectedIndex == 2
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
                                              Navigator.pop(context);
                                              fetchILRData();

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
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
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
  fetchRegionList() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.get('region-list', context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    branchList = responseJSON["data"];
    branchSelected = List<bool>.filled(branchList.length, false);
    setState(() {});
  }
}