import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/response_by_ratings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class NpsScoreScreen extends StatefulWidget{
  bool showBack;

  NpsScoreScreen(this.showBack);
  @override
  NpsScoreState createState() => NpsScoreState();
}

class NpsScoreState extends State<NpsScoreScreen>{
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xFFF51818),
      Color(0xFFFFB740),
      Color(0xFF09933B),
    ];
    List<double> widths = [
      0.2,
      0.1,
      0.7,
    ];
    double progressValue = 0.75;
    return Container(
      color: AppTheme.themeNewColor,
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 20.0,
                        percent: progressValue,

                        center: Text(
                          '${(progressValue * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w800,

                          ),
                          textAlign: TextAlign.center,
                        ),

                        progressColor: AppTheme.buttonColor,
                        backgroundColor: AppTheme.lightgrayColor,

                      ),// Set right padding
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NPS Score',
                        style: TextStyle(
                            fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.blueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 8.0),
                      child: Text(
                          'NPS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 40.0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: (widths[0] * 10).toInt(),
                        child: Container(
                          color: colors[0],
                          child: Center(
                            child: Text(
                              (widths[0] * 100).toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: (widths[1] * 10).toInt(),
                        child: Container(
                          color: colors[1],
                          child: Center(
                            child: Text(
                              (widths[1] * 100).toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: (widths[2] * 10).toInt(),
                        child: Container(
                          color: colors[2],
                          child: Center(
                            child: Text(
                              (widths[2] * 100).toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: colors[0],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    SizedBox(width: 8.0),
                    Text('Detractor3763'),
                    SizedBox(width: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 10,),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: colors[1],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text('Passive952'),
                    SizedBox(width: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 10,),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: colors[2],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text('Promoter28864'),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 5,),
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 5,),
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5,),
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5,),
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
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(
                        'About NPS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: const Text(
                          'Net Promoter Score (NPS) is a metric used to measure customer loyalty and satisfaction toward a product, service, or brand.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.grayColor,
                          ),
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
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
                                            NpsResponeScreen(true)));
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
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}