import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/nps_score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class OldDashboardScreen extends StatefulWidget{
  bool showBack;

  OldDashboardScreen(this.showBack);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<OldDashboardScreen>{

  @override
  Widget build(BuildContext context) {
    double progressValue = 0.75;
    return Container(
      color: AppTheme.buttonColor,
      child: SafeArea(
        child: Scaffold(
          appBar: widget.showBack
              ? AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/profile_icon.svg',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                // Add your right button action here
              },
            ),

            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/filter.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: (){},

              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/logout.svg',
                  width: 25,
                  height: 25,
                ),
                onPressed: () => Navigator.pop(context),

              ),
            ],

            title: Image.asset('assets/brand_logo.png',
              height: 40,
              width: 220,),
            centerTitle: true,
          )
              : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar()),
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 6.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Data Triggered',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('0',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    percent: progressValue,
                                    center: Text(
                                      '${(progressValue * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: AppTheme.buttonColor,
                                    backgroundColor: Colors.white,
                                  ),// Set right padding
                                )
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10,),
                                  child: SvgPicture.asset(
                                    'assets/survey_inc.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text('+14% Inc',
                                    style: TextStyle(
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 6.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Delivered',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('4',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    percent: progressValue,
                                    center: Text(
                                      '${(progressValue * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: AppTheme.buttonColor,
                                    backgroundColor: Colors.white,
                                  ),// Set right padding
                                )
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10,),
                                  child: SvgPicture.asset(
                                    'assets/survey_inc.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text('+14% Inc',
                                    style: TextStyle(
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 6.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Response Count',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('107',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    percent: progressValue,
                                    center: Text(
                                      '${(progressValue * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: AppTheme.buttonColor,
                                    backgroundColor: Colors.white,
                                  ),// Set right padding
                                )
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10,),
                                  child: SvgPicture.asset(
                                    'assets/survey_inc.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text('+14% Inc',
                                    style: TextStyle(
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 6.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Response %',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('96%',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    percent: progressValue,
                                    center: Text(
                                      '${(progressValue * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: AppTheme.buttonColor,
                                    backgroundColor: Colors.white,
                                  ),// Set right padding
                                )
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10,),
                                  child: SvgPicture.asset(
                                    'assets/survey_inc.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text('+14% Inc',
                                    style: TextStyle(
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 6.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Survey Link Clicked',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('25',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    percent: progressValue,
                                    center: Text(
                                      '${(progressValue * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: AppTheme.buttonColor,
                                    backgroundColor: Colors.white,
                                  ),// Set right padding
                                )
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10,),
                                  child: SvgPicture.asset(
                                    'assets/survey_inc.svg',
                                    height: 14,
                                    width: 14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text('+14% Inc',
                                    style: TextStyle(
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(left:10, right: 10),
                          width: double.infinity,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NpsScoreScreen(true)));
                              },
                              style: ElevatedButton.styleFrom(
                                //color: isButtonClicked ? Colors.blue : Colors.green,
                                backgroundColor: AppTheme.blueColor.withOpacity(0.90),// Set the desired background color
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/img_resolved.png', width: 20, height: 20),
                                  SizedBox(width: 12),
                                  Text('NPS Score',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text('74.75',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(left:10, right: 10),
                          width: double.infinity,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                //color: isButtonClicked ? Colors.blue : Colors.green,
                                backgroundColor: AppTheme.blueColor.withOpacity(0.90),// Set the desired background color
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/img_resolved.png', width: 20, height: 20),
                                  SizedBox(width: 12),
                                  Text('NPS Responses By Rating',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}