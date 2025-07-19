

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

import '../network/api_dialog.dart';
import '../network/api_helper.dart';
import '../network/loader.dart';
import '../utils/app_theme.dart';
import 'all_huddle_screen.dart';

class HuddleDetailsScreen extends StatefulWidget
{
  final String huddleID;
  HuddleDetailsScreen(this.huddleID);
  HuddleState createState()=>HuddleState();
}
class HuddleState extends State<HuddleDetailsScreen>
{
  bool isLoading=false;
  List<dynamic> huddleDetails=[];
  var finalClosureController=TextEditingController();
  List<TextEditingController> controllerList=[];
  List<TextEditingController> verbatimControllerList=[];
  List<TextEditingController> dealerRemarkControllerList=[];
  List<dynamic> feedbackList=[];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
         'Huddle Description',
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
      // padding: EdgeInsets.symmetric(horizontal: 11),
       children: [


         SizedBox(height: 18),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 11),
           child: Row(
             children: [

               Expanded(child: Container(
                 height: 90,
                 padding: EdgeInsets.all(12),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [


                     Text('Upload Artefact',style: TextStyle(
                         fontSize: 11,
                         fontWeight: FontWeight.bold,
                         color: AppTheme.themeColor

                     )),

                     SizedBox(height: 10),

                     Row(
                       children: [

                         Padding(
                           padding: const EdgeInsets.only(top: 3),
                           child: Image.asset("assets/view_ic.png",width: 69,height: 30),
                         ),

                         Spacer(),
                         Image.asset("assets/camera_ic.png",width:34 ,height: 31,),

                         SizedBox(width: 2)


                       ],
                     )

                   ],
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Color(0xFfE9EFFA),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.6), // Color of the shadow
                         spreadRadius: 1, // Spread radius of the shadow
                         blurRadius: 5, // Blur radius of the shadow
                         offset: Offset(0, 0), // Offset of the shadow
                       ),
                     ],
                   border: Border.all(color: Color(0xFf2C68C9),width: 0.3)
                 ),


               ),flex: 1),

               SizedBox(width: 16),

               Expanded(child: Container(
                 height: 90,
                 padding: EdgeInsets.all(12),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   //  SizedBox(height: 4),

                     Text('View PDF',style: TextStyle(
                         fontSize: 11,
                         fontWeight: FontWeight.bold,
                         color: AppTheme.themeColor

                     )),

                     SizedBox(height: 10),

                     Row(
                       children: [

                         Padding(
                           padding: const EdgeInsets.only(top: 3),
                           child: Image.asset("assets/arrow12.png"),
                         ),

                         Spacer(),
                         Image.asset("assets/pdf_screen.png",width: 31,height: 37.68),

                         SizedBox(width: 2)


                       ],
                     )

                   ],
                 ),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Color(0xFfE9EFFA),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.6), // Color of the shadow
                         spreadRadius: 1, // Spread radius of the shadow
                         blurRadius: 5, // Blur radius of the shadow
                         offset: Offset(0, 0), // Offset of the shadow
                       ),
                     ],
                     border: Border.all(color: Color(0xFf2C68C9),width: 0.3)
                 ),


               ),flex: 1)


             ],
           ),
         ),


         SizedBox(height: 5),

         Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
             margin: EdgeInsets.symmetric(vertical: 2),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
             ),
             child: Row(
               children: [

                 Text('Huddle date',
                     style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w700,
                         color: AppTheme.themeColor)),
                 Spacer(),
                 Text(parseServerFormatDate(huddleDetails[0]["date"].toString()),
                     style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w700,
                         color: Colors.black)),





               ],
             )
         ),


         Container(
           height: 1,
           margin: const EdgeInsets.symmetric(horizontal: 11),
           color: Colors.grey.withOpacity(0.4),
           width: double.infinity,
         ),



         Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
             margin: EdgeInsets.symmetric(vertical: 2),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
             ),
             child: Row(
               children: [

                 Text('Status',
                     style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w700,
                         color: AppTheme.themeColor)),
                 Spacer(),
                 Text("Submitted",
                     style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                         color:
                         huddleDetails[0]["status"]==0?
                             Colors.green:
                     AppTheme.themeColor

                     )),





               ],
             )
         ),


         Container(
           height: 1,
           margin: EdgeInsets.symmetric(horizontal: 11),
           color: Colors.grey.withOpacity(0.4),
           width: double.infinity,
         ),

         Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
             margin: EdgeInsets.symmetric(vertical: 2),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft:Radius.circular(6)),
             ),
             child: Row(
               children: [

                 Text('Total Feedbacks',
                     style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w700,
                         color: AppTheme.themeColor)),
                 Spacer(),
                 Text(huddleDetails[0]["this_week_feedback"].toString(),
                     style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w700,
                         color: Colors.black)),





               ],
             )
         ),


         SizedBox(height: 5),

         Container(
           height: 1,
           margin: EdgeInsets.symmetric(horizontal: 11),
           color: Colors.grey.withOpacity(0.4),
           width: double.infinity,
         ),
         SizedBox(height: 15),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 11),
           child: Row(
             children: [

               Text('Feedbacks Listing',
                   style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w700,
                       color: AppTheme.themeColor)),
               Spacer(),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AllHuddleScreen(widget.huddleID)));
                 },
                 child: Text('View All',
                     style: TextStyle(
                         fontSize: 13,
                         fontWeight: FontWeight.w700,
                         color: Color(0xFFAAAAAA))),
               ),





             ],
           ),
         ),


        // SizedBox(height: 12),





         ExpandedTileList.builder(
             maxOpened: 1,
             padding: EdgeInsets.zero,
             itemCount:feedbackList.length, itemBuilder: (context,index,controller)

         {
           return  ExpandedTile(
             contentseparator: 1,
             trailing: Container(),
             theme: ExpandedTileThemeData(
               headerColor: Colors.white,
               headerRadius: 10,
               titlePadding: EdgeInsets.symmetric(horizontal: 7),
               trailingPadding: EdgeInsets.zero,
               leadingPadding: EdgeInsets.zero,
               headerPadding:
               EdgeInsets.only(top: 12,left: 0, right: 0),
               headerSplashColor: AppTheme.themeColor.withOpacity(0.4),
               contentBackgroundColor: Colors.white,
               contentPadding: EdgeInsets.zero,
             ),
             controller: controller,
             title: Container(

               decoration:  BoxDecoration(
                   color: Colors.white,

                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.4), // Color of the shadow
                       spreadRadius: 0, // Spread radius of the shadow
                       blurRadius: 5, // Blur radius of the shadow
                       offset: Offset(0, 0), // Offset of the shadow
                     ),
                   ],


                   borderRadius:

                   controller.isExpanded?

                       BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)):

                   BorderRadius.circular(20)
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [



                   Container(
                       height: 51,
                       margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                       decoration: BoxDecoration(
                         color: AppTheme.themeColor.withOpacity(0.23),
                         borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20)),
                       ),
                       child: Row(
                         children: [

                           SizedBox(width: 9),

                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 7),
                                 Text('Feedback Date',
                                     style: TextStyle(
                                         fontSize: 11,
                                         fontWeight: FontWeight.w500,
                                         color: Color(0xFf707070))),

                                 Text(parseServerDate(feedbackList[index]["created_at"]),
                                     style: TextStyle(
                                         fontSize: 13.5,
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black)),
                               ],
                             ),
                           ),

                           Image.asset("assets/expand_ic.png",width: 27,height: 27),



                           SizedBox(width: 11),


                         ],
                       )
                   ),

                   SizedBox(height: 5),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 12),
                         child: Text('Customer Name',
                             style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w700,
                                 color: AppTheme.themeColor)),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(right: 12),
                         child: Text(feedbackList[index]["customer_name"],
                             style: TextStyle(
                                 fontSize: 13,
                                 fontWeight: FontWeight.w700,
                                 color: Colors.black)),
                       ),
                     ],
                   ),

                   SizedBox(height: 10),
                 ],
               ),
             ),
             content: Container(
               margin: EdgeInsets.symmetric(horizontal: 11,vertical: 5),
               padding: EdgeInsets.symmetric(horizontal: 8),

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
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
               ),

               child: Padding(
                   padding: const EdgeInsets.only(
                       left: 3, top: 10, right: 3, bottom: 5),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 2),
                       Container(
                         child:   Padding(
                           padding: const EdgeInsets.only(left: 0),
                           child: Text('Call Back-Verbatim',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w700,
                                   color: AppTheme.themeColor)),
                         ),

                       ),
                       SizedBox(
                         height: 7,
                       ),
                       Container(
                         child: TextFormField(
                           controller: verbatimControllerList[index],
                           enabled: false,
                             style: const TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w700,
                               color: Color(0xFF707070),
                             ),
                           //  maxLines: 3,
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
                                 hintText:'',
                                 hintStyle: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w400,
                                     color: Color(0xFF707070)))),
                       ),


                       SizedBox(height: 10),


                       Container(
                         child:   Padding(
                           padding: const EdgeInsets.only(left: 0),
                           child: Text('Dealer Remark',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w700,
                                   color: AppTheme.themeColor)),
                         ),

                       ),
                       SizedBox(
                         height: 7,
                       ),
                       Container(
                         child: TextFormField(
                           enabled: false,
                             controller: dealerRemarkControllerList[index],
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
                                 hintText:'',
                                 hintStyle: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w400,
                                     color: Color(0xFF707070)))),
                       ),


                       SizedBox(height: 10),


                       Container(
                         child:   Padding(
                           padding: const EdgeInsets.only(left: 0),
                           child: Text('Enter Closure Remark',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w700,
                                   color: AppTheme.themeColor)),
                         ),

                       ),
                       SizedBox(
                         height: 7,
                       ),
                       Container(
                         child: TextFormField(
                           controller: controllerList[index],
                             style: const TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w700,
                               color: Color(0xFF707070),
                             ),
                             maxLines: 3,
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
                                     fontSize: 12,
                                     fontWeight: FontWeight.w400,
                                     color: Color(0xFF707070)))),
                       ),


                       SizedBox(height: 22),


                       Center(
                         child: Container(
                           height: 45,
                           width: 135,
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


                               if(controllerList[index].text=="")
                                 {
                                   Toast.show("Please enter closure remark",
                                       duration: Toast.lengthLong,
                                       gravity: Toast.bottom,
                                       backgroundColor: Colors.red);
                                 }
                               else
                                 {

                                   submitClosure(controllerList[index].text,feedbackList[index]["id"].toString());
                                   //submit API
                                 }




                              // _modalBottomSheetClosure();
                             },
                             child: const Text(
                               'Save',
                               style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),
                             ),
                           ),
                         ),
                       ),


                       SizedBox(
                         height: 16,
                       ),
                     ],
                   ),
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


         SizedBox(height: 20),



         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: 57,
               width: 240,
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
                   _modalBottomSheetClosure();
                 },
                 child: const Text(
                   'Enter Final Closure',
                   style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),
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
  void _modalBottomSheetClosure() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(

              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFf707070),width: 1),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
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


                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Final Huddle Closure',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeColor

                      )),
                    ),

                    SizedBox(height: 2),

                    Divider(),

                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                          controller: finalClosureController,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF707070),
                          ),
                          maxLines: 5,
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF707070)))),
                    ),



                    SizedBox(height: 15),


                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: TextButton(
                          child: Text(
                              "Save and mark as Complete",
                              style: TextStyle(fontSize: 14)
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(AppTheme.themeColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                      side: BorderSide(color: AppTheme.themeColor,width: 1)
                                  )
                              )
                          ),
                          onPressed: () {

                            _modalSheetSubmit();


                          }
                      ),
                    ),




                    const SizedBox(height: 14),
                  ],
                ),
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

                  SizedBox(
                    height: 150,
                    child: Lottie.asset('assets/check2.json',
                    ),
                  ),


                  const SizedBox(height: 15),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Are you sure you want to save and submit this huddle report ?',style: TextStyle(
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



                            if(finalClosureController.text=="")
                              {
                                Toast.show("Final closure cannot be left as empty",
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom,
                                    backgroundColor: Colors.red);
                              }
                            else
                              {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                submitClosure(finalClosureController.text,"");


                                //submit API
                              }




                          //  submitFeedback();

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHuddleDetails();
  }

  submitClosure(String closureText,String feedbackID) async {

    APIDialog.showAlertDialog(context,"Saving details..");

    var requestModel = {
      "closer_remark":closureText,
      "huddle_id":widget.huddleID,
      "feedback_id":feedbackID==""?"":feedbackID,
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('save-closure-remark',requestModel,context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON['status'])
    {
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




  fetchHuddleDetails() async {
    setState(() {
      isLoading=true;
    });

    var requestModel={
      "huddle_id":widget.huddleID
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('get-huddle',requestModel,context);
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print("HUDDD");

    log(responseJSON.toString());



    huddleDetails= responseJSON['huddle_details'];
    feedbackList= responseJSON['feedback_listing'];
    for(int i=0;i<feedbackList.length;i++)
      {
        controllerList.add(TextEditingController());
        verbatimControllerList.add(TextEditingController());
        dealerRemarkControllerList.add(TextEditingController());
      }

    for(int i=0;i<feedbackList.length;i++)
    {
      verbatimControllerList[i].text=feedbackList[i]["customer_feedback"]!=null?feedbackList[i]["customer_feedback"]:"NA";
      dealerRemarkControllerList[i].text=feedbackList[i]["dealer_feedback"]!=null?feedbackList[i]["dealer_feedback"]:"NA";
    }
    setState(() {});

  }

  String parseServerFormatDate(String serverDate) {
    var date = DateTime.parse(serverDate);
    final dateformat = DateFormat.yMMMd();
    final clockString = dateformat.format(date);
    return clockString.toString();
  }
  String parseServerDate(String serverDate) {
    var date = DateTime.parse(serverDate);
    final dateformat = DateFormat.yMd();
    final clockString = dateformat.format(date);
    return clockString.toString();
  }

}