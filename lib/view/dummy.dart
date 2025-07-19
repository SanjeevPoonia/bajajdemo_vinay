
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_theme.dart';

class CustomerScreen extends StatefulWidget
{
  CustomerState createState()=>CustomerState();
}
class CustomerState extends State<CustomerScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 23),
          onPressed: () {

            //  _logOut();
            // Add your right button action here
          },
        ),

        title: Text('Customer Issues',style: TextStyle(
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
                    child:   Text('10',style: TextStyle(
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

          Container(
            height: 43,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Color(0xFFEBEBEB),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('27-11-2023-27 - 11-2023',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black

                )),

                Image.asset("assets/calender_ic.png")


              ],
            ),
          ),




          SizedBox(height: 20),


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

            child: Column(
              children: [

                SizedBox(height: 12),


                Card(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  color: Color(0xFfF9F9F9),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Color(0xFfF9F9F9),
                    ),
                    // height: 93,
                    // width: 180,
                    child: Column(
                      children: [



                        Row(
                          children: [

                            SizedBox(width: 7),
                            Expanded(
                              child: Text('Total Tickets Received',style: TextStyle(
                                fontSize: 11.0,
                                color: Color(0xFF707070),
                              )),
                            ),
                            Stack(
                              children: [

                                Image.asset("assets/tiles_1.png"),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 15),

                                    Text('L2 Drilldown',style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppTheme.themeColor,
                                        fontWeight: FontWeight.w800
                                    )),
                                    /* SizedBox(
                                      height: 80,
                                      child: Lottie.asset('assets/info_anim.json',
                                      ),
                                    ),*/

                                    /*  SizedBox(
                                      height: 80,
                                      child: OverflowBox(
                                        minHeight: 60,
                                        maxHeight: 60,
                                        child:Lottie.asset('assets/info_anim.json',
                                        ),
                                      ),
                                    ),*/

                                    /*  SizedBox(
                                      height: 60,
                                      child: Lottie.asset('assets/info_anim.json'),
                                    ),*/


                                  ],
                                )








                              ],
                            )
                          ],
                        ),


                        Container(
                          child:  Row(
                            children: [
                              SizedBox(width: 7),
                              Text('24,886',style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.themeColor,
                              )),
                            ],
                          ),
                        ),







                      ],
                    ),
                  ),
                )

              ],
            ),
          )


        ],
      ),


    );
  }

}