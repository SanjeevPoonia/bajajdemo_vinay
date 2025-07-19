import 'package:bajaj_app/utils/app_theme.dart';
import 'package:bajaj_app/view/nps_dashboard/response_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'nps_tab.dart';

class NPSDashboardScreen extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<NPSDashboardScreen> with TickerProviderStateMixin{
  ExpandedTileController _controller = ExpandedTileController();
  ExpandedTileController _controller2 = ExpandedTileController();
  ExpandedTileController _controller3 = ExpandedTileController();
  ExpandedTileController _controller4 = ExpandedTileController();
  ExpandedTileController _controller5 = ExpandedTileController();
  ExpandedTileController _controller6 = ExpandedTileController();
  int selectedTab = 1;
  int selectedTab2 = 1;

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColor,
        leading: IconButton(
          icon: Image.asset(
            'assets/logout.png',
            width: 25,
            height: 25,
          ),
          onPressed: () {
            //  _logOut();
            // Add your right button action here
          },
        ),
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
                  transform: Matrix4.translationValues(27.0, 10.0, 0.0),
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFf5619D1)),
                  child: Center(
                    child: Text('12+,',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ))
            ],
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: 10),
                    color: Color(0xFfF9F9F9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Color(0xFfF9F9F9),
                      ),
                      height: 93,
                      width: 180,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 7),
                              Expanded(
                                child: Text('Survey invitations sent',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1D2226),
                                    )),
                              ),
                              Image.asset("assets/tiles_1.png")
                            ],
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -5.0, 0.0),
                            child: Row(
                              children: [
                                SizedBox(width: 7),
                                Text('5484',
                                    style: TextStyle(
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
                  ),
                  flex: 1),
              SizedBox(width: 10),
              Expanded(
                  child: Card(
                    margin: EdgeInsets.only(right: 10),
                    color: Color(0xFfF9F9F9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Color(0xFfF9F9F9),
                      ),
                      height: 93,
                      width: 180,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 7),
                              Expanded(
                                child: Text('Contacts Responded to the survey ',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1D2226),
                                    )),
                              ),
                              Image.asset("assets/tiles_2.png")
                            ],
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -7.0, 0.0),
                            child: Row(
                              children: [
                                SizedBox(width: 7),
                                Text('1894',
                                    style: TextStyle(
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
                  ),
                  flex: 1)
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                Expanded(
                    child: Card(
                      color: Color(0xFfF9F9F9),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Color(0xFfF9F9F9),
                        ),
                        // height: 93,
                        width: 180,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text('Response Status',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1D2226),
                                    )),
                              ],
                            ),


                            SizedBox(height: 10),
                            Row(
                              children: [


                                SizedBox(width: 10),


                                CircularPercentIndicator(
                                  radius: 50.0,
                                  lineWidth: 19.0,
                                  animation: true,
                                  backgroundColor: Color(0xFfD6D6D6),
                                  percent: 0.4,
                                  circularStrokeCap: CircularStrokeCap.square,
                                  progressColor: Color(0xFF00AFEE),
                                ),


                                SizedBox(width: 20),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                   Row(
                                       children: [


                                         Container(
                                           margin: EdgeInsets.only(top: 0),
                                           width: 18,
                                           height: 9,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(2),
                                               color: Color(0xFf00ADEF)
                                           ),
                                         ),

                                         SizedBox(width: 5),
                                         Text('Completed',style: TextStyle(
                                           fontSize: 11.0,
                                           fontWeight: FontWeight.w600,
                                           color: Color(0xFF1D2226),
                                         )),



                                       ],
                                   ),

                                  SizedBox(height: 4),

                                  Row(
                                        children: [


                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            width: 18,
                                            height: 9,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(2),
                                                color: Color(0xFfD6D6D6)
                                            ),
                                          ),

                                          SizedBox(width: 5),
                                          Text('No Response',style: TextStyle(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1D2226),
                                          )),



                                        ],
                                      )

                                    ],
                                )


                              ],
                            ),


                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    flex: 1),
              ],
            ),
          ),
          SizedBox(height: 15),


          Card(
            color: Color(0xFfF9F9F9),
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Color(0xFfF9F9F9),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('ESAT',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                  SizedBox(height: 8),


                  Text('8.61',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),


                  SizedBox(height: 13),



                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context,int pos)
                    {
                      return Row(
                        children: [

                          Column(
                            children: [

                              Container(
                                width: 60,
                                height: 47,
                                color: Color(0xFF00AFEE),
                                child: Center(
                                  child:    Text((pos+1).toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                                ),
                              ),

                              SizedBox(height: 5),


                              Text('0.8%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),



                            ],
                          ),
                          SizedBox(width: 7),

                        ],
                      );
                    }


                    ),
                  ),


                //  SizedBox(height: 13),

                  Row(
                    children: [

                      Image.asset("assets/check_ic.png"),
                      SizedBox(width: 5),

                      Text('Employee satisfaction score',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          )),



                    ],
                  )





                ],
              ),
            ),
          ),


          SizedBox(height: 15),


          Card(
            color: Color(0xFfF9F9F9),
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Color(0xFfF9F9F9),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Employee net Promoter Score',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                  SizedBox(height: 8),


                  Text('55.75',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),


                  SizedBox(height: 13),


                  Container(
                    height: 46,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [


                        //Total Percent 88.7%

                        Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width*0.435,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))
                          ),

                          child: Row(
                            children: [

                              SizedBox(width: 5),

                              Text('55.75%',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),

                            ],
                          )


                        ),

                        Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width*0.30,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                             // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5))
                          ),

                            child: Row(
                              children: [

                                SizedBox(width: 5),

                                Text('35.75%',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),

                              ],
                            )
                        ),


                        Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width*0.151,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                          ),

                            child: Row(
                              children: [

                                SizedBox(width: 5),

                                Text('25.75%',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),

                              ],
                            )
                        )







                      ],
                    ),

                  ),



                  SizedBox(height: 13),







                  Row(
                    children: [

                      Image.asset("assets/check_ic.png"),
                      SizedBox(width: 5),

                      Text('Customers are likely to recommend us',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          )),



                    ],
                  ),

                    SizedBox(height: 13),

                 Padding(
                   padding: const EdgeInsets.only(right: 55),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [


                       Row(
                         children: [

                           Container(
                             width: 8,
                             height: 8,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.green
                             ),
                           ),
                           SizedBox(width: 5),

                           Text('Promoter',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black
                               )),



                         ],
                       ),

                       Row(
                         children: [

                           Container(
                             width: 8,
                             height: 8,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Color(0xFFFFB73E)
                             ),
                           ),
                           SizedBox(width: 5),

                           Text('Passive',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black
                               )),



                         ],
                       ),

                       Row(
                         children: [

                           Container(
                             width: 8,
                             height: 8,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.red
                             ),
                           ),
                           SizedBox(width: 5),

                           Text('Detractor',
                               style: TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black
                               )),



                         ],
                       ),


                     ],
                   ),
                 )




                ],
              ),
            ),
          ),


          SizedBox(height: 15),


          Container(
            height: 53,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(bottom: 5),
            child: AppBar(
              backgroundColor: Color(0xFF00ADEF),
              bottom: TabBar(
                indicatorColor: AppTheme.themeColor,
                unselectedLabelColor: const Color(0xFFB9B9B9),
                labelColor: Colors.white,
                labelStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Overall Response',
                  ),
                  Tab(
                    text: 'NPS Questions',
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 350,
            //color: Colors.red,
            child: TabBarView(
              controller: tabController,
              children: [
                ResponseTab(),
                NPSTab(),
              ],
            ),
          ),












        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }
}
