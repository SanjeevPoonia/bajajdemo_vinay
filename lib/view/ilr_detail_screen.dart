

import 'dart:convert';

import 'package:bajaj_app/network/api_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';

class ILRDetailScreen extends StatefulWidget
{
  final String rootType;
  List<dynamic>ilrList;
  int selectedIndex;
  ILRDetailScreen(this.rootType,this.ilrList,this.selectedIndex);
  ILRState createState()=>ILRState();
}
class ILRState extends State<ILRDetailScreen>
{
  bool check1=false;
  List<dynamic> feedbackList=[];
  List<dynamic>ilrList=[];
  int selectedIndex=0;
  bool isLoading=false;
  List<dynamic> l2List=[];
  var loopController=TextEditingController();
  List<dynamic> l3List=[];
  List<dynamic> rootTypeCounts=[];
  List<String> valueList=[
    'Final Inspection not done',
    'Appointment not Schdule',
    'Unprofessional Interaction',
  ];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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


      ListView(
        children: [
          SizedBox(height: 13),

          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              decoration: BoxDecoration(
                color: AppTheme.themeColor.withOpacity(0.20),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [

                  SizedBox(width: 4),


                  selectedIndex==0?

                  Icon(Icons.arrow_back_ios_new,color: Colors.grey):

                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child: Icon(Icons.arrow_back_ios_new,color: AppTheme.themeColor))

                  ,


                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RCA',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.themeColor)),

                      Text(ilrList[selectedIndex]["root_type"],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),

                    ],
                  ),

                  Spacer(),





                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Intensity',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.themeColor)),

                      Text(ilrList[selectedIndex]["root_type_count"].toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),

                    ],
                  ),

                  SizedBox(width: 15),

                  selectedIndex==ilrList.length-1?

                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey):

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ILRDetailScreen(ilrList[selectedIndex]["root_type"],ilrList,selectedIndex)));

                    },

                    child: Icon(Icons.arrow_forward_ios_rounded,color: AppTheme.themeColor),
                  )

                  ,


                  SizedBox(width: 4),


                ],
              )
          ),

          Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Divider()),

          Container(
              padding: EdgeInsets.symmetric(vertical: 9),
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Color of the shadow
                    spreadRadius: 0, // Spread radius of the shadow
                    blurRadius: 5, // Blur radius of the shadow
                    offset: Offset(0, 0), // Offset of the shadow
                  ),
                ],
              ),
              child: Row(
                children: [

                  SizedBox(width: 9),
                  Text('Contributing L2s & L3s',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      _modalBottomSheet();
                    },
                    child: Image.asset("assets/rrr.png")
                  ),


                  SizedBox(width: 12),


                ],
              )
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Inner Loop Resolution',
              style: TextStyle(
                color: AppTheme.themeColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 4),

          Container(
            margin: EdgeInsets.only(left: 8,right: 8),
            /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45,width: 1)
                            ),*/
            child: TextFormField(
                maxLines: 3,
                controller: loopController,
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
                      color: Color(0xFF929292).withOpacity(0.4),
                    ))),
          ),

          SizedBox(height: 10),

          ListView.builder(
              itemCount: rootTypeCounts.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

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
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            color: AppTheme.themeColor.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 12),
                              Text('Sub Root Case',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.themeColor)),
                              Spacer(),
                              Text(rootTypeCounts[pos]["sub_root_count"].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.themeColor)),


                              SizedBox(width: 12),


                            ],
                          )
                      ),

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
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
                              SizedBox(width: 8),

                              Expanded(child:   Text(rootTypeCounts[pos]["root_sub_type"].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))),


                              InkWell(
                                onTap: (){
                                  fetchFeedbacks(rootTypeCounts[pos]["root_sub_type"]);                            },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppTheme.themeColor, width: 2)),
                                  child: Center(
                                    child: Icon(Icons.keyboard_arrow_down_sharp,
                                        color: AppTheme.themeColor, size: 21),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),


                            ],
                          )
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12)

              ],
            );
          }

          ),

          SizedBox(height: 30),

          Container(
            height: 48,
            width: 192,
            margin: EdgeInsets.symmetric(horizontal: 40),
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

               if(loopController.text=="")
                 {
                   Toast.show("Inner loop resolution cannot be empty !",
                       duration: Toast.lengthLong,
                       gravity: Toast.bottom,
                       backgroundColor: Colors.red);
                 }
               else
                 {
                   _modalSheetSubmit();
                 }


              },
              child: const Text(
                'Save and mark as complete',
                style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),
              ),
            ),
          ),

          SizedBox(height: 20),

        ],
      ),
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

                  SizedBox(
                    height: 150,
                    child: Lottie.asset('assets/check2.json',
                    ),
                  ),


                  const SizedBox(height: 15),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Are you sure you want to save and submit this ILR ?',style: TextStyle(
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



                           Navigator.pop(context);
                           submitFeedback();

                            // Navigator.push(context,MaterialPageRoute(builder: (context)=>CostOfServiceScreen()));
                          },
                          child: const Text(
                            'Save',
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



  void _modalBottomSheet() {
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
                      child: Text('L2 & L3',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),


                    SizedBox(height: 10),


                    Container(
                      height: 306,
                      child: Scrollbar(
                        child:ListView(


                          children: [

                            Container(
                              //    margin: EdgeInsets.symmetric(horizontal: 8),
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
                                        color: AppTheme.themeColor.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [

                                          SizedBox(width: 10),
                                          Text('L2',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),


                                        ],
                                      )
                                  ),



                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: l2List.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context,int pos)
                                  {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          // height: 43,
                                          child: Row(
                                            children: [

                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(l2List[pos],
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black)),
                                              ),


                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 1,
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(horizontal: 8),
                                          color: Color(0xFfF2F2F2),
                                        ),

                                      ],
                                    );
                                  }


                                  ),



                                ],
                              ),
                            ),


                            SizedBox(height: 10),

                            Container(
                              //    margin: EdgeInsets.symmetric(horizontal: 8),
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
                                        color: AppTheme.themeColor.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [

                                          SizedBox(width: 10),
                                          Text('L3',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),


                                        ],
                                      )
                                  ),

                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: l3List.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context,int pos)
                                      {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 10),
                                             // height: 43,
                                              child: Row(
                                                children: [

                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(l3List[pos],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black)),
                                                  ),


                                                ],
                                              ),
                                            ),

                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              margin: EdgeInsets.symmetric(horizontal: 8),
                                              color: Color(0xFfF2F2F2),
                                            ),

                                          ],
                                        );
                                      }


                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        )

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

  fetchFeedbacks(String name) async {

    if(feedbackList.length!=0)
      {
        feedbackList.clear();
      }


    APIDialog.showAlertDialog(context,"Fetching feedbacks...");

    var formData={
      "root_sub_type":name
    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('feedback-by-root-cause',formData,context);
    var responseJSON = json.decode(response.body);

    Navigator.pop(context);
    print(responseJSON);
    feedbackList= responseJSON["data"]['feedbacks'];
    setState(() {});

    _modalBottomSheetArrow();
  }


  submitFeedback() async {

    APIDialog.showAlertDialog(context,"Saving data...");

    var formData={
      "root_type":widget.rootType,
      "inner_loop_text":loopController.text
    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('save-inner-loop-resolution',formData,context);
    var responseJSON = json.decode(response.body);

    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON["status"])
    {
      Navigator.pop(context);
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


  void _modalBottomSheetArrow() {
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
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Feedbacks',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.themeColor

                    )),
                  ),

                  SizedBox(height: 2),

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider()),


                  SizedBox(height: 2),




                  Expanded(child: Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8),
                        itemCount: feedbackList.length,
                        itemBuilder: (BuildContext context,int pos)
                        {
                          return Column(
                            children: [



                              Container(
                                height:130,
                                child: PageView(

                                  onPageChanged: (v) {
                                    //  tabIndex = v;
                                  },
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(9),
                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(6),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                                spreadRadius: 1, // Spread radius of the shadow
                                                blurRadius: 5, // Blur radius of the shadow
                                                offset: Offset(0, 0), // Offset of the shadow
                                              ),
                                            ],



                                          ),

                                          child: Column(
                                            children: [
                                              Row(
                                                children: [

                                                  Text(feedbackList[pos]["customer_name"],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black)),

                                                  Spacer(),

                                                  Text(parseServerFormatDate(feedbackList[pos]["created_at"]),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xFf929292))),

                                                ],
                                              ),
                                              SizedBox(height: 7),

                                              Container(
                                                height: 33,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(feedbackList[pos]["customer_remark"],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: Color(0xFf707070))),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(height: 10),


                                              Row(

                                                children: [

                                                  Container(
                                                    width: 25,
                                                    height: 25,
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

                                                  Spacer(),

                                                  Text('SWIPE TO VIEW TICKET',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppTheme.themeColor)),


                                                  SizedBox(width: 55),





                                                ],
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),






                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Container(
                                              transform: Matrix4.translationValues(0.0, 29.0, 0.0),
                                              //margin:EdgeInsets.only(top:35),
                                              child: RotatedBox(
                                                quarterTurns: 3,
                                                child:  SizedBox(
                                                  height: 80,
                                                  width:150,
                                                  child: OverflowBox(
                                                    minHeight: 90,
                                                    maxHeight: 90,
                                                    child:Lottie.asset('assets/swipe.json',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(9),
                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(6),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                                spreadRadius: 1, // Spread radius of the shadow
                                                blurRadius: 5, // Blur radius of the shadow
                                                offset: Offset(0, 0), // Offset of the shadow
                                              ),
                                            ],



                                          ),

                                          child: Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                children: [

                                                  Text('Customer name',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppTheme.themeColor)),

                                                  Spacer(),

                                                  Text('Status',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppTheme.themeColor)),

                                                ],
                                              ),
                                              SizedBox(height: 5),

                                              Row(
                                                children: [

                                                  Text(feedbackList[pos]["customer_name"],
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black)),

                                                  Spacer(),

                                                  Text(feedbackList[pos]["ticket_status"]==1?'Open':"Closed",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: feedbackList[pos]["ticket_status"]==1?Colors.green:Colors.red)),

                                                ],
                                              ),

                                              SizedBox(height: 9),


                                              Row(

                                                children: [

                                                  SizedBox(width: 47),


                                                  Text(
                                                      feedbackList[pos]["nps"],
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.w600,
                                                          color:  Color(0xFfDB0000)
                                                      )),


                                                  Spacer(),

                                                  Image.asset("assets/rrr.png")
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),






                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(0.0, 25.0, 0.0),
                                          //margin:EdgeInsets.only(top:35),
                                          child: RotatedBox(
                                            quarterTurns: 3,
                                            child:  SizedBox(
                                              height: 80,
                                              width:150,
                                              child: OverflowBox(
                                                minHeight: 90,
                                                maxHeight: 90,
                                                child:Lottie.asset('assets/swipe.json',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),




                            //  SizedBox(height: 12),
                            ],
                          );
                        }

                    ),
                  )),



                  const SizedBox(height: 10),
                ],
              ),
            );
          }),
    );
  }

  fetchILRData() async {
    setState(() {
      isLoading=true;
    });

    var formData={
      "root_type":widget.rootType
    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('irl-sub-root',formData,context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    rootTypeCounts= responseJSON["data"]['root_type_counts'];
    l2List= responseJSON["data"]['l2_titles'];
    l3List= responseJSON["data"]['l3_titles'];
    setState(() {});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ilrList=widget.ilrList;
    selectedIndex=widget.selectedIndex;
    fetchILRData();
  }
  String parseServerFormatDate(String serverDate) {
    var date = DateTime.parse(serverDate);
    final dateformat = DateFormat.yMMMEd();
    final clockString = dateformat.format(date);
    return clockString.toString();
  }




}