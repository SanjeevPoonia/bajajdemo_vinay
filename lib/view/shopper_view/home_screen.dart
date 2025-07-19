import 'dart:convert';

import 'package:bajaj_app/network/shopper_network/Utils.dart';
import 'package:bajaj_app/network/shopper_network/api_helper.dart';
import 'package:bajaj_app/network/shopper_network/loader.dart';
import 'package:bajaj_app/utils/shopper_utils/app_modal.dart';
import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/new_landing_screen.dart';
import 'package:bajaj_app/view/shopper_view/HistoryDetails.dart';
import 'package:bajaj_app/view/shopper_view/customer_screen.dart';
import 'package:bajaj_app/view/shopper_view/filter_screen.dart';
import 'package:bajaj_app/widgets/shopper_widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

import 'appHome.dart';
class HomeScreen extends StatefulWidget {
  bool showBack;
  bool status;
  int selectIdx;
  HomeScreen(this.showBack,this.selectIdx,this.status);
  @override
  HomeState createState() => HomeState();

}
class HomeState extends State<HomeScreen> {
  int selectedIndex=-1;
  String totalAssigned='';
  String openTicket ='';
  String wip = '';
  String resolved = '';
  String notContactable = '';
  String autoClose = '';
  String attempt1 ='';
  String attempt2 ='';
  String attempt3 ='';
  bool isLoading = false;
  String ID = '';
  String userID = '';
  String userName = '';
  String userPos = '';
  int datat = -1;
  int selectIndexRoots=-1;
  Color _currentColor = Colors.white;
  var remarkController = TextEditingController();
  var emailController = TextEditingController();
  var commentController = TextEditingController();
  List<dynamic> journeyList = [];
  List<dynamic> agentList = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Container(

      color: AppTheme.themeNewColor,

      child: SafeArea(
        child: Scaffold(
          appBar: widget.showBack
              ? AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon:Image.asset(
                'assets/leftarrowblack.png',
                width: 22,
                height: 22,
              ),
              onPressed: () {

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NewLandingScreen()),
                        (Route<dynamic> route) => false);
              },
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                    'assets/logout.svg',
                  width: 20,
                  height: 20,
                ),
                onPressed: () =>  showLogOutDialog(context),

              ),
            ],
            title:Image.asset('assets/brand_logo.png',
              height: 40,
              width: 220,),
            centerTitle: true,
          )
              : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar()),
          backgroundColor: Colors.white,
          extendBody: true,
          body:
          isLoading?
              Center(
                child:Loader()
              ):
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                             Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Total Tickets Assigned (MTD)',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(totalAssigned,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold// Set the desired font size
                                    )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/equal.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 26.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Today Tickets',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                    child: Text('NA',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                      ),
                                    ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 10, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Tickets open from last 7 days',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(openTicket,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/img_ticket_open.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 26.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Tickets Open Today',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text('NA',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
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
                        margin: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'WIP',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(wip,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/img_wip.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 26.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Attempt 1',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text(attempt1,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Attempt 2',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text(attempt2,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Resolved',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(resolved,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/img_right.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 26.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Within TAT',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text('NA',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 4.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Outside TAT',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text('NA',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
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
                        margin: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Not Contactable (3 Attempts)',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(notContactable,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/img_call_not_attempt.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 26.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Total 3rd Attempts',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text('NA',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.buttonColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Auto Close',
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
                            SizedBox(height: 10.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text(autoClose,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Image.asset('assets/img_ticket_open.png',
                                    height: 30,
                                    width: 30,), // Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 2.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: AppTheme.grayColor,
                                thickness: 0.5,
                                height: 16.0,
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Open',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text('NA',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Attempt 1',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text(attempt1,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0), // Set left padding
                                  child: Text('Attempt 2',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0), // Set right padding
                                  child: Text(attempt2,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
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
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color:
                            AppTheme.blueColor.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 3.0), // Add vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0), // Set left padding
                                  child: Text('My Cases',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal// Set the desired font size
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40.0, // Set the desired width
                                  height: 40.0, // Set the desired height
                                 // padding: EdgeInsets.only(right: 2.0), // Set the desired padding
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FilterScreen(true,"123")));
                                    },
                                    style: ButtonStyle(
                                      //backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set the button background color
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0.0)), // Remove default button padding
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 6.0, top: 3, bottom: 3), // Set the desired spacing between image and text
                                          child: Image.asset('assets/img_filter.png',
                                            ),// Replace with your desired image
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                           // SizedBox(height: 3.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                journeyList.length !=0?ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: journeyList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      String originalDate = journeyList[pos]["survey_date"];

                      DateTime dateTime = DateTime.parse(originalDate);
                      String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);

                      return Container(
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 3,),
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0.5),
                                blurRadius: 2,
                                spreadRadius: 0.5,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0), // Add vertical spacing
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0), // Set left padding
                                  child: Text('Date',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: AppTheme.blueColor,
                                        fontWeight: FontWeight.bold,// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12.0), // Set right padding
                                  child: Text('Journey',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.blueColor,
                                        fontWeight: FontWeight.bold,// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            SizedBox(height: 3.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0), // Set left padding
                                  child: Text(formattedDate,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey// Set the desired font size
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12.0), // Set right padding
                                  child: Text(journeyList[pos]["journey"],
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey// Set the desired font size
                                    ),
                                  ),// Replace with actual image path
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0), // Set left padding
                                  child: Text('NPS Rating : ' + journeyList[pos]["nps_score"].toString(),
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: AppTheme.blueColor,
                                        fontWeight: FontWeight.bold,// Set the desired font size
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 29, // Set the desired width for the button
                                      height: 29,
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      child: ElevatedButton(
                                        onPressed: () {

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return HistoryDetails(true, journeyList[pos]["id"].toString());
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: AppTheme.buttonColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Image.asset(
                                          'assets/calender.png', // Replace with your image asset path
                                          height: 18, // Set the desired height for the image
                                          width: 18, // Set the desired width for the image
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 80, // Set the desired width for the button
                                      height: 30,
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: journeyList[pos]["status"] == 0 ? AppTheme.blueColor :
                                          journeyList[pos]["status"] == 1 ? AppTheme.buttonColor :
                                          journeyList[pos]["status"] == 2 ? Colors.red :
                                          journeyList[pos]["status"] == 3 ? Colors.grey :
                                          journeyList[pos]["status"] == 4 ? AppTheme.buttonColor : AppTheme.lightgrayColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          journeyList[pos]["status"] == 0 ? 'Open':
                                          journeyList[pos]["status"] == 1 ? 'Assigned':
                                          journeyList[pos]["status"] == 2 ? 'wip':
                                          journeyList[pos]["status"] == 3 ? 'Resolved':
                                          journeyList[pos]["status"] == 4 ? 'Auto close':'System close',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white// Set the desired font size
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 30, // Set the desired width for the button
                                      height: 30,
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ID = journeyList[pos]['id'].toString();
                                          userID = journeyList[pos]['user_id'].toString();

                                          guestLoginDialog(context);                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: AppTheme.blueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Image.asset(
                                          'assets/share.png', // Replace with your image asset path
                                          height: 18, // Set the desired height for the image
                                          width: 18, // Set the desired width for the image
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 45, // Set the desired width for the button
                                      height: 30,
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      child: ElevatedButton(
                                        onPressed: ()
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CustomerScreen(true, journeyList[pos]["id"].toString(),journeyList[pos]["user_id"].toString(),
                                                          journeyList[pos]["employee_id"].toString()))).then((value) {
                                            gatDashboardData();
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: AppTheme.blueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Image.asset(
                                          'assets/right_arrow.png', // Replace with your image asset path
                                          height: 22, // Set the desired height for the image
                                          width: 28, // Set the desired width for the image
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }):Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'No cases are available.',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void guestLoginDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,    // Set the desired width
                      height: 2,     // Set the desired height
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
                            color: AppTheme.blueColor
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
                SizedBox(height: 15),
                Container(
                    height: 55,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        bottomSheetState(() {
                          selectedIndex=0;
                        });
                        sendCaseExternalDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        //backgroundColor: AppTheme.lightblueColor,
                        backgroundColor: selectedIndex==0 ? AppTheme.blueColor : AppTheme.lightblueColor, // Set the desired background colorr
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 14.0),
                            child: Image.asset(selectedIndex==0 ? 'assets/external_white.png' : 'assets/external.png', width: 20, height: 20),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Externally',
                                style: TextStyle(
                                  color: selectedIndex==0 ? AppTheme.orangeColor : AppTheme.blueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                ),
                SizedBox(height: 15),
                Container(
                    height: 55,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                        bottomSheetState(() {
                          selectedIndex=1;
                        });
                        Navigator.of(context).pop();
                        gatData();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        //backgroundColor: AppTheme.lightblueColor,
                        backgroundColor: selectedIndex==1 ? AppTheme.blueColor : AppTheme.lightblueColor, // Set the desired background colorr
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 14.0),
                            child: Image.asset(selectedIndex==1 ? 'assets/internal_white.png' : 'assets/internal.png', width: 20, height: 20),

                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Internally',
                                style: TextStyle(
                                  color: selectedIndex==1 ? AppTheme.orangeColor : AppTheme.blueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                ),
                //SizedBox(height: 15),
                // Container(
                //     height: 55,
                //     width: double.infinity,
                //     child:ElevatedButton(
                //       onPressed: () {
                //         //Navigator.of(context).pop();
                //         bottomSheetState(() {
                //           selectedIndex=2;
                //         });
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: EdgeInsets.zero,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8.0),
                //         ),
                //         //backgroundColor: AppTheme.lightblueColor,
                //
                //         backgroundColor: selectedIndex==2 ? AppTheme.blueColor : AppTheme.lightblueColor, // Set the desired background colorr
                //       ),
                //       child: Row(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(left: 14.0),
                //             child: Image.asset(selectedIndex==2 ? 'assets/customer_white.png' : 'assets/customer.png', width: 20, height: 20),
                //
                //           ),
                //           Expanded(
                //             child: Align(
                //               alignment: Alignment.center,
                //               child: Text('To Customer',
                //                 style: TextStyle(
                //                   color: selectedIndex==2 ? AppTheme.orangeColor : AppTheme.blueColor,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //
                // ),
                // SizedBox(height: 15),
                // Container(
                //     height: 50,
                //     width: double.infinity,
                //     child:ElevatedButton(
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //         sendCaseDialog(context);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: EdgeInsets.zero,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(16.0),
                //         ),
                //         backgroundColor: AppTheme.blueColor, // Set the background color of the button
                //       ),
                //       child: const Row(
                //         children: [
                //           Expanded(
                //             child: Align(
                //               alignment: Alignment.center,
                //               child: Text('Select',
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //
                // ),
                SizedBox(height: 30),
              ],
            ),
          );
        }


        );
      },
    );
  }
  void sendCaseDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,    // Set the desired width
                      height: 2,     // Set the desired height
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Send Case Internally',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppTheme.blueColor
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
                SizedBox(height: 15),
                Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppTheme.lightgrayColor,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search user',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/Search.png', // Replace with your SVG icon path
                        color: Colors.grey,
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        // Perform search
                      },
                    ),
                  ],
                ),
              ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: agentList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          userName = agentList[pos]["name"];
                          userPos = agentList[pos]["id"].toString();
                          selectIndexRoots = pos;
                          bottomSheetState(() {
                            _currentColor = Colors.grey;
                            agentList.clear();
                            Navigator.of(context).pop();
                            sendCaseInternalDialog(context);
                          });
                          print(agentList.length);

                        },
                        child:Container(
                          color: selectIndexRoots == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(agentList[pos]['name'],
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      );
                    }),
                // SizedBox(height: 15),
                // Container(
                //     height: 50,
                //     width: double.infinity,
                //     child:ElevatedButton(
                //       onPressed: () {
                //           agentList.clear();
                //           Navigator.of(context).pop();
                //           sendCaseInternalDialog(context);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: EdgeInsets.zero,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(16.0),
                //         ),
                //         backgroundColor: AppTheme.blueColor, // Set the background color of the button
                //       ),
                //       child: const Row(
                //         children: [
                //           Expanded(
                //             child: Align(
                //               alignment: Alignment.center,
                //               child: Text('Select',
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //
                // ),
                SizedBox(height: 30),
              ],
            ),
          );
        }
        );
      },
    );
  }
  void sendCaseInternalDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,    // Set the desired width
                      height: 2,     // Set the desired height
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Send Case Internally',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppTheme.blueColor
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
                SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppTheme.blueColor,
                      ),
                    ),
                    Text(
                      'ID',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppTheme.blueColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppTheme.blackColor,
                      ),
                    ),
                    Text(
                    userID,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppTheme.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //margin: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFieldFeedBack(
                          controller: remarkController,
                         // validator: checkFeedback,
                          labeltext: 'Enter Remark',
                          fieldIC: const Icon(Icons.abc,
                            size: 0,),
                          suffixIc: const Icon(
                            Icons.abc,
                            size: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                    height: 50,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                          internalSend();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: AppTheme.blueColor, // Set the background color of the button
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Send',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                ),
                SizedBox(height: 15),
                Container(
                    height: 50,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: AppTheme.grayColor, // Set the background color of the button
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                ),
                SizedBox(height: 30),
              ],
            ),
          );
        }

        );
      },
    );
  }
  void sendCaseExternalDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,    // Set the desired width
                          height: 2,     // Set the desired height
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Send Case Externally',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppTheme.blueColor
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
                    SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter Email',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppTheme.blueColor,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            //margin: EdgeInsets.only(left: 12.0, right: 12.0),
                            child: TextFieldEmail(
                              controller: emailController,
                              validator: checkEmail,
                              labeltext: 'Enter email here',
                              fieldIC: const Icon(Icons.abc,
                                size: 0,),
                              suffixIc: const Icon(
                                Icons.abc,
                                size: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter Remark',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppTheme.blueColor,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            //margin: EdgeInsets.only(left: 12.0, right: 12.0),
                            child: TextFieldFeedBack(
                              controller: commentController,
                              validator: checkComment,
                              labeltext: 'Leave a comment here',
                              fieldIC: const Icon(Icons.abc,
                                size: 0,),
                              suffixIc: const Icon(
                                Icons.abc,
                                size: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child:ElevatedButton(
                          onPressed: () {
                            _submitExternal();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            backgroundColor: AppTheme.blueColor, // Set the background color of the button
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Send',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ));
        }

        );
      },
    );
  }

  _logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    AppModel.setLoginStatus(false);
    MyUtils.saveSharedPreferencesInt('id', 0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NewLandingScreen()),
            (Route<dynamic> route) => false);
  }
  showLogOutDialog(BuildContext context) {
    Widget cancelButton = GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Text("Cancel"));
    Widget continueButton = GestureDetector(
        onTap: (){
          Navigator.pop(context);
          _logOut();
        },

        child: Text("Logout",style: TextStyle(
            color: Colors.red
        ),));

    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to Log out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    gatDashboardData();
  }

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Toast message from Bottom Sheet'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  gatDashboardData() async {
    isLoading = true;
    setState(() {});
    var requestModel = {};
    int? Id = await MyUtils.getSharedPreferencesInt("id")??0;

    if (widget.status == true){
      requestModel = {
         "status" : [widget.selectIdx],
         "id":Id
      };
    }else{
       requestModel = {
         "id":Id
         
      };
    }


    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sc/dashboard', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    journeyList = responseJSON["records"];
    totalAssigned=responseJSON["total_assigned"].toString();
    openTicket = responseJSON["ticket_open_today"].toString();
    wip = responseJSON["wip"].toString();
    resolved = responseJSON["resolved"].toString();
    notContactable = responseJSON["not_contactable"].toString();
    autoClose = responseJSON["autoclose"].toString();
    attempt1 = responseJSON["attempt_1"].toString();
    attempt2 = responseJSON["attempt_2"].toString();
    attempt3 = responseJSON["attempt_3"].toString();

    setState(() {});
  }
  gatData() async {
    isLoading = true;
    setState(() {});
    var requestModel = {
      "id" : ID,
      "user_id" : userID
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sc/get-internal-agents', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    agentList = responseJSON["data"];

    if (responseJSON["status"]) {

      selectedIndex = -1;
      _currentColor = Colors.white;
      sendCaseDialog(context);
    } else {

    }

    setState(() {});
  }
  internalSend() async {
    isLoading = true;
    setState(() {});
    var requestModel = {
      "id" : ID,
      "user_id" : userID,
      "remark" : remarkController.text
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sc/send-case-internal', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if (responseJSON["status"]) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseJSON["message"]),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
      remarkController.text = '';
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseJSON["message"]),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    setState(() {});
  }
  externalSend() async {
    isLoading = true;
    setState(() {});
    var requestModel = {
      "id" : ID,
      "external_email" : emailController.text,
      "remark" : commentController.text
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sc/send-case-external', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if (responseJSON["status"]) {
      selectedIndex = -1;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseJSON["message"]),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
      emailController.text = '';
      commentController.text = '';
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseJSON["message"]),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    setState(() {});
  }
  void _submitExternal() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

     externalSend();

    //
  }
  String? checkEmail(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(value)) {
      return 'Email should be valid Email address.';
    }
    return null;
  }
  String? checkComment(String? value) {
    if (value!.isEmpty) {
      return 'Enter comment here';
    }
    return null;
  }
}
