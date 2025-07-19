
import 'dart:convert';

import 'package:bajaj_app/network/shopper_network/api_helper.dart';
import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/customer_details_screen.dart';
import 'package:bajaj_app/widgets/shopper_widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'HistoryDetails.dart';


class CustomerScreen extends StatefulWidget{
  bool showBack;
  String npsRating = '';
  List<dynamic> journeyListData = [];
  int pos = 0;
  String id = '';
  String userID = '';
  String empID = '';
  CustomerScreen(this.showBack, this.id, this.userID,this.empID);
  @override
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<CustomerScreen> {
  String selectedValue = '';
  int selectedIndex=0;
  int selectIndex=-1;
  int selectIndexRoots=-1;
  int selectIndexStatus=-1;
  int selectIndexResStatus=-1;
  bool attempt1=false;
  bool attempt2=true;
  bool attempt3=true;
  bool isButtonClicked = false;
  bool _isContainerVisible = false;
  bool _isVisible = false;
  bool _isVisibleNew = false;
  String customerName = '';
  String mob = '';
  String npsRating = '';
  String awbNumber = '';
  String accountNo = '';
  String empID = '';
  String empName = '';
  String customerComment = '';
  String customerComm = '';
  String customerID = '';
  String touchPoint = '';
  String region = '';
  String location = '';
  String branch = '';
  String serviceCenter = '';
  String triggeredDate = '';
  String responseDate = '';
  String rootsType = '11';
  String resolutionStatus = '12';
  String flagStatus = '13';
  String rootCauseType = '';
  String statusType = '';
  String resStatusType = '';
  String formattedDate = '';
  String attemptStatus = '';
  String cusAccName = '';
  String cusSegment = '';
  String ticketNumber = '';
  String refNumber = '';
  String destinationArea = '';
  String eventDate = '';
  String eventTime = '';
  String product = '';
  String subProduct = '';
  String selectDate1 = '25';
  String selectDate2 = '26';
  String selectDate3 = '27';
  String selectDateTime = '';
  String attemptDate = '';
  String compId = '';
  String tpleadEmpId = '';
  String emailId = '';
  String pEmailId = '';
  String pEmpName = '';
  String caltArea = '';
  String orgArea = '';
  String orgReg = '';
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var freeTextController = TextEditingController();
  var resolutionTextController = TextEditingController();
  var feedbackTextController = TextEditingController();
  List<dynamic> rootCauseList = [];
  List<dynamic> rootCauseSubTypeList = [];
  List<dynamic> attemptList = [];
  Color _currentColor = Colors.white;
  final List<String> customerResponseList = [
    'Customer not reachable',
    'Customer asked to callback',
    'Customer refused to talk',
    'Internal resolution awaited',
  ];
  List<Map<String, dynamic>> items = [
    {'id': 3, 'name': 'Resolved'},
    {'id': 4, 'name': 'Not Resolved'},
  ];
  List<Map<String, dynamic>> statusItems = [
    {'id': 1, 'name': 'Flagged for customer service attention'},
    {'id': 2, 'name': 'Flagged for improvement'},
  ];

  DateTime selectedDateTime = DateTime.now();
  Future<void> _selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override

  Widget build(BuildContext context) {
    ToastContext().init(context);
    DateTime currentDate = DateTime.now();
    // Format the date to day-month-year format
    formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
    attemptDate = DateFormat('yyyy-MM-dd').format(currentDate);
    DateTime parsedTime = DateFormat("HH:mm:ss.SSS").parse("${selectedDateTime.toLocal()}".split(' ')[1],);

    // Format the time as "HH:mm"
    String formattedTime = DateFormat("HH:mm:ss").format(parsedTime);
    selectDateTime = "${selectedDateTime.toLocal()}".split(' ')[0] + ' '+"$formattedTime";
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
                'assets/cross_icon.svg',
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
            body:Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16.0),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Customer Details',
                              style: TextStyle(
                                color: AppTheme.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                            'Customer Name',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Text(customerName,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blackColor,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
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
                              margin: EdgeInsets.only(left: 5, right: 10, top: 12, bottom: 5,),
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
                                            'Mobile No./Unique ID',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Text(mob,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blackColor,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
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
                                            'NPS Rating',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Text(npsRating,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.red,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
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
                                            'AWB Number',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Text(awbNumber,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blackColor,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
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
                              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5,),
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
                                            'Customer Comment :',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Text(customerComm,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
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
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 125,
                                height: 45,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0, right: 10.0),
                                  child: ElevatedButton(
                                    onPressed: ()
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerDetails(true,customerName,mob,awbNumber,accountNo,npsRating,
                                                      empID,empName,customerComm,touchPoint,region,location,branch,
                                                      serviceCenter,triggeredDate,responseDate,cusAccName,cusSegment,ticketNumber,
                                                    refNumber,destinationArea,eventDate,eventTime,product,subProduct,compId,tpleadEmpId,emailId,pEmailId,pEmpName,caltArea,orgArea,orgReg)));

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.buttonColor, // Set the desired background color
                                    ),
                                    child: const Text('View More',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(left:10, right: 5),
                                width: 125,
                                height: 45,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex=0;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: selectedIndex==0 ? AppTheme.buttonColor : AppTheme.lightgrayColor, // Set the desired background color
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(selectedIndex==0 ? 'assets/open.png' : 'assets/open_gray.png', width: 16, height: 16),
                                        SizedBox(width: 6),
                                        Text('Open',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: selectedIndex==0 ? Colors.white : AppTheme.grayColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(left:5, right: 5),
                                width: 127,
                                height: 45,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex=1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: selectedIndex==1 ? AppTheme.buttonColor : AppTheme.lightgrayColor,// Set the desired background color
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(selectedIndex==1 ? 'assets/wip.png' : 'assets/wip_gray.png', width: 16, height: 16),
                                        SizedBox(width: 6),
                                        Text('WIP',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: selectedIndex==1 ? Colors.white : AppTheme.grayColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(left:5, right: 10),
                                width: 130,
                                height: 45,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex=2;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      //color: isButtonClicked ? Colors.blue : Colors.green,
                                      backgroundColor: selectedIndex==2 ? AppTheme.buttonColor : AppTheme.lightgrayColor,// Set the desired background color
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 0),
                                          child: Image.asset(selectedIndex==2 ? 'assets/img_resolved.png' : 'assets/img_resolved_gray.png', width: 16, height: 16),),
                                        SizedBox(width: 5),
                                        Text('Resolved',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: selectedIndex==2 ? Colors.white : AppTheme.grayColor,
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
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left:10, right: 10),
                                height: 45,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return HistoryDetails(true, widget.id);
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.blueColor, // Set the desired background color
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/calender.png', width: 20, height: 20),
                                        SizedBox(width: 12),
                                        const Text('Ticket History',
                                          style: TextStyle(
                                            fontSize: 12,
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

                      SizedBox(height:5),

                      selectedIndex==0?
                      Column(
                        children: [
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Case is Open (Allocation done, Action pending)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Case will get auto-closed in Open (more than 7 days)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Overall :- Case will get closed after 7 days of allocation (TAT is 96 hours from the date of allocation) Closed by system (Not attempted)',
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
                          SizedBox(height: 60.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0, bottom: 20),
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                backgroundColor: AppTheme.blueColor,
                                child: Icon(Icons.home,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ):
                      selectedIndex==1?
                          attemptList.length == 3 ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16), // Set left and right margins
                                child: Text(
                                  'All 3 attempts have been submitted',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          attemptList.length>=1 ?Container():
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left:10, right: 10),
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // onTap: () {

                                            if (!attempt1)
                                              {
                                                setState(() {
                                                  _isContainerVisible = !_isContainerVisible;
                                                });
                                              }

                                            //},
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:attempt1==false?AppTheme.lightgrayColor: Colors.black26, // Set the desired background color
                                          ),
                                          child: Row(
                                            children: [
                                              const Text('Attempt1',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Image.asset('assets/calendar_blue.png', width: 20, height: 20),
                                              SizedBox(width: 12),
                                              Text(formattedDate,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
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
                          ),

                          attemptList.length>=1?Container():
                          _isContainerVisible?
                            attempt1 ? AnimatedContainer(duration: Duration(milliseconds: 300)) :
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: AppTheme.orangeColor, // Color of the container
                                borderRadius: BorderRadius.circular(8), // Set the corner radius here
                              ),
                              width: double.infinity,
                              child:Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                          child: const Text(
                                            'Select customer response',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  ListView.builder(
                                      itemCount: customerResponseList.length,
                                      shrinkWrap: true,
                                      //scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int pos) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 8.0,),
                                          child: Row(
                                            children: [
                                              selectIndex == pos
                                                  ? Image.asset('assets/radio_enable.png',
                                                  width: 24, height: 24)
                                                  : InkWell(
                                                child: Image.asset(
                                                    'assets/radio_disable.png',
                                                    width: 24,
                                                    height: 24),
                                                onTap: () {
                                                  setState(() {
                                                    selectIndex = pos;
                                                    print(selectIndex + 1);
                                                  });
                                                },
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(customerResponseList[pos],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.grey)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  SizedBox(height: 16.0),
                                  selectIndex == 1 ?
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                              child: const Text(
                                                'Select a callback date',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppTheme.blueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.0),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        //color: const Color(0xFfFFFFFF),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDateAndTime(context);
                                                  //sendCaseDialog(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color: const Color(0xFfF6F6F6),
                                                      border: Border.all(
                                                          width: 0.6, color: const Color(0XFFB9B9B9))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 8),
                                                        child: Text(
                                                            selectedDateTime == null
                                                                ? 'DD-MM-YYYY hh:mm'
                                                                : selectDateTime,
                                                            style: TextStyle(
                                                              fontSize: 13.5,
                                                              color: Colors.black,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(right: 8),
                                                        child: Icon(Icons.calendar_month_outlined,
                                                            color: Colors.black),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                    ],
                                  ): Container(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.0),
                                        height: 45,
                                        width: 115,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _saveHandler();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.buttonColor, // Set the desired background color
                                          ),
                                          child: const Text('Save',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ):Container(),

                          SizedBox(height: 5.0),
                          attemptList.length>=2 ?Container():
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left:10, right: 10),
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: ElevatedButton(
                                          onPressed: () {

                                            if (!attempt2)
                                            {
                                              setState(() {
                                                _isVisible = !_isVisible;
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:attempt2==false?AppTheme.lightgrayColor: Colors.black26, // Set the desired background color
                                          ),
                                          child: Row(
                                            children: [
                                              const Text('Attempt2',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Image.asset('assets/calendar_blue.png', width: 20, height: 20),
                                              SizedBox(width: 12),
                                              Text(formattedDate,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
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
                          ),
                          attemptList.length>=2?Container():
                          _isVisible?
                            attempt2 ? AnimatedContainer(duration: Duration(milliseconds: 300)) :
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: AppTheme.orangeColor, // Color of the container
                                borderRadius: BorderRadius.circular(8), // Set the corner radius here
                              ),
                              width: double.infinity,
                              //height: 470,
                              child:Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                          child: const Text(
                                            'Select customer response',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  ListView.builder(
                                      itemCount: customerResponseList.length,
                                      shrinkWrap: true,
                                     // scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int pos) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 8.0,),
                                          child: Row(
                                            children: [
                                              selectIndex == pos
                                                  ? Image.asset('assets/radio_enable.png',
                                                  width: 24, height: 24)
                                                  : InkWell(
                                                child: Image.asset(
                                                    'assets/radio_disable.png',
                                                    width: 24,
                                                    height: 24),
                                                onTap: () {
                                                  setState(() {
                                                    selectIndex = pos;
                                                  });
                                                },
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(customerResponseList[pos],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.grey)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  SizedBox(height: 16.0),
                                  selectIndex == 1? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                              child: const Text(
                                                'Select a callback date',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppTheme.blueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.0),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        //color: const Color(0xFfFFFFFF),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDateAndTime(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color: const Color(0xFfF6F6F6),
                                                      border: Border.all(
                                                          width: 0.6, color: const Color(0XFFB9B9B9))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 8),
                                                        child: Text(
                                                            selectedDateTime == null
                                                                ? 'DD-MM-YYYY hh:mm'
                                                                : selectDateTime,
                                                            style: TextStyle(
                                                              fontSize: 13.5,
                                                              color: Colors.black,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(right: 8),
                                                        child: Icon(Icons.calendar_month_outlined,
                                                            color: Colors.black),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                    ],
                                  ):Container(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.0),
                                        height: 45,
                                        width: 115,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _saveHandler1();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.buttonColor, // Set the desired background color
                                          ),
                                          child: const Text('Save',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ):Container(),
                          SizedBox(height: 5.0),
                          attemptList.length==3 ?Container():
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left:10, right: 10),
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (!attempt3)
                                            {
                                              setState(() {
                                                _isVisibleNew = !_isVisibleNew;
                                              });
                                            }
                                            //},
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:attempt3==false?AppTheme.lightgrayColor: Colors.black26, // Set the desired background color
                                          ),
                                          child: Row(
                                            children: [
                                              const Text('Attempt3',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Image.asset('assets/calendar_blue.png', width: 20, height: 20),
                                              SizedBox(width: 12),
                                              Text(formattedDate,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.blueColor,
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
                          ),
                          attemptList.length==3?Container():
                          _isVisibleNew?
                            attempt3 ? AnimatedContainer(duration: Duration(milliseconds: 300)) :
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: AppTheme.orangeColor, // Color of the container
                                borderRadius: BorderRadius.circular(8), // Set the corner radius here
                              ),
                              width: double.infinity,
                             // height: 470,
                              child:Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                          child: const Text(
                                            'Select customer response',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppTheme.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  ListView.builder(
                                      itemCount: customerResponseList.length,
                                      shrinkWrap: true,
                                      //scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int pos) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 8.0,),
                                          child: Row(
                                            children: [
                                              selectIndex == pos
                                                  ? Image.asset('assets/radio_enable.png',
                                                  width: 24, height: 24)
                                                  : InkWell(
                                                child: Image.asset(
                                                    'assets/radio_disable.png',
                                                    width: 24,
                                                    height: 24),
                                                onTap: () {
                                                  setState(() {
                                                    selectIndex = pos;
                                                  });
                                                },
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(customerResponseList[pos],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.grey)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  SizedBox(height: 16.0),
                                  selectIndex == 1 ?
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                              child: const Text(
                                                'Select a callback date',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppTheme.blueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.0),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        //color: const Color(0xFfFFFFFF),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                onTap: () {
                                                  _selectDateAndTime(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color: const Color(0xFfF6F6F6),
                                                      border: Border.all(
                                                          width: 0.6, color: const Color(0XFFB9B9B9))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 8),
                                                        child: Text(
                                                            selectedDateTime == null
                                                                ? 'DD-MM-YYYY hh:mm'
                                                                : selectDateTime,
                                                            style: TextStyle(
                                                              fontSize: 13.5,
                                                              color: Colors.black,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(right: 8),
                                                        child: Icon(Icons.calendar_month_outlined,
                                                            color: Colors.black),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                    ],
                                  ): Container(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.0),
                                        height: 45,
                                        width: 115,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _saveHandler2();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.buttonColor, // Set the desired background color
                                          ),
                                          child: const Text('Save',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ):Container(),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 16.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  backgroundColor: AppTheme.blueColor,
                                  child: const Icon(Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ):
                          attemptStatus == "3"? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16), // Set left and right margins
                                child: Text(
                                  'Response was submitted',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],):
                      Column(
                        children: [
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Root Cause-Type',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            height: 50,
                            width: double.infinity,
                            color: const Color(0xFfFFFFFF),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      sendCaseDialog(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: const Color(0xFfF6F6F6),
                                          border: Border.all(
                                              width: 0.6, color: const Color(0XFFB9B9B9))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(
                                                rootsType == '11'
                                                    ? 'Select type'
                                                    : rootsType,
                                                style: TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          Icon(Icons.keyboard_arrow_down_outlined,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Root Cause-Subtype',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          ListView.builder(
                              itemCount: rootCauseSubTypeList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              //scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int pos) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 8.0,),
                                  child: Row(
                                    children: [
                                      selectIndex == rootCauseSubTypeList[pos]["id"]
                                          ? Image.asset('assets/radio_enable.png',
                                          width: 24, height: 24)
                                          : InkWell(
                                        child: Image.asset(
                                            'assets/radio_disable.png',
                                            width: 24,
                                            height: 24),
                                        onTap: () {
                                          setState(() {
                                            selectIndex = rootCauseSubTypeList[pos]["id"];
                                            print(selectIndex);
                                            print(rootCauseType);
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(rootCauseSubTypeList[pos]["name"],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Resolution Status',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            height: 50,
                            width: double.infinity,
                            color: const Color(0xFfFFFFFF),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      sendResolutionStatus(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: const Color(0xFfF6F6F6),
                                          border: Border.all(
                                              width: 0.6, color: const Color(0XFFB9B9B9))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(
                                                resolutionStatus == '12'
                                                    ? 'Select status'
                                                    : resolutionStatus,
                                                style: TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          Icon(Icons.keyboard_arrow_down_outlined,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Flag Status',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            height: 50,
                            width: double.infinity,
                            color: const Color(0xFfFFFFFF),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      sendFlagStatus(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: const Color(0xFfF6F6F6),
                                          border: Border.all(
                                              width: 0.6, color: const Color(0XFFB9B9B9))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(
                                                flagStatus == '13'
                                                    ? 'Select flag status'
                                                    : flagStatus,
                                                style: TextStyle(
                                                  fontSize: 13.5,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          Icon(Icons.keyboard_arrow_down_outlined,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: const Text(
                                    'Resolution to Customer',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                                  child: TextFieldFeedBack(
                                    controller: resolutionTextController,
                                    validator: checkResolutionCustomer,
                                    labeltext: 'Resolution to Customer',
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
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16.0),
                                height: 45,
                                width: 125,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //submitApi();
                                    _submitHandler();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.blueColor, // Set the desired background color
                                  ),
                                  child: const Text('Submit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 16.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  backgroundColor: AppTheme.blueColor,
                                  child: const Icon(Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                        ],
                      )
                    ],
                  ),
                )
            )
          ),
        ),
    );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                        'Root Cause-Type',
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
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: rootCauseList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          // if(rootCauseSubTypeList.length!=0)
                          //   {
                          //     rootCauseSubTypeList.clear();
                          //   }
                          rootCauseSubTypeList=rootCauseList[pos]["subtypes"];
                          rootsType = rootCauseList[pos]["name"];
                          rootCauseType = rootCauseList[pos]["id"].toString();
                          selectIndexRoots = pos;
                          bottomSheetState(() {
                            _currentColor = Colors.grey;
                          });
                        },
                        child: Container(
                          color: selectIndexRoots == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(rootCauseList[pos]["name"].toString(),
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
                //SizedBox(height: 15),

                Container(
                    height: 50,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {

                        });
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
                              child: Text('Select',
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
  void sendFlagStatus(BuildContext context) {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                        'Flag Status',
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
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: statusItems.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          // if(rootCauseSubTypeList.length!=0)
                          // {
                          //   rootCauseSubTypeList.clear();
                          // }
                          //rootCauseSubTypeList=rootCauseList[pos]["subtypes"];
                          flagStatus = statusItems[pos]["name"];
                          statusType = statusItems[pos]["id"].toString();
                          selectIndexStatus = pos;
                          print('Status ID' + statusType);
                          print(selectIndexStatus);
                          bottomSheetState(() {
                            _currentColor = Colors.grey;
                          });
                        },
                        child: Container(
                          color: selectIndexStatus == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(statusItems[pos]["name"].toString(),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 10),
                Container(
                    height: 50,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {

                        });
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
                              child: Text('Select',
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
  void sendResolutionStatus(BuildContext context) {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                        'Resolution Status',
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
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          // if(rootCauseSubTypeList.length!=0)
                          // {
                          //   rootCauseSubTypeList.clear();
                          // }
                          //rootCauseSubTypeList=rootCauseList[pos]["subtypes"];
                          resolutionStatus = items[pos]["name"];
                          resStatusType = items[pos]["id"].toString();
                          selectIndexResStatus = pos;
                          print("Status ID" + resStatusType);
                          print(selectIndexResStatus);
                          bottomSheetState(() {
                            _currentColor = Colors.grey;
                          });
                        },
                        child: Container(
                          color: selectIndexResStatus == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(items[pos]["name"].toString(),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 10),
                Container(
                    height: 50,
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {

                        });
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
                              child: Text('Select',
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
  getData() async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('sc/action/'+widget.id,context);
    var responseJSON = json.decode(response.body);
    attemptStatus = responseJSON["record"]["status"].toString();
    customerName = responseJSON["survey"]["customer"]["cust_name"];
    mob = responseJSON["survey"]["customer"]["phone"];
    accountNo = responseJSON["survey"]["customer"]["cust_acc_no"];
    customerID = responseJSON["survey"]["customer"]["id"].toString();
    awbNumber = responseJSON["survey"]["AWBNUMBER"] ?? "--";
    npsRating = responseJSON["record"]["nps_score"].toString();
    customerComment = responseJSON["nps_question_slug"] ?? "NA";
    customerComm = responseJSON["survey"][customerComment] ?? "NA";
    empID = responseJSON["record"]["employee"]["EMPLID"] ?? "NA";
    empName = responseJSON["record"]["employee"]["EMPLNAME"] ?? "NA";
    touchPoint = responseJSON["record"]["journey"] ?? "NA";
    region = responseJSON["survey"]["REGION"] ?? "NA";
    branch = responseJSON["survey"]["BRANCH"] ?? "NA";
    location = responseJSON["survey"]["LOCATION"] ?? "NA";
    serviceCenter = responseJSON["survey"]["SERVICECENTRE"] ?? "NA";
    triggeredDate = responseJSON["survey"]["created_at"] ?? "NA";
    responseDate = responseJSON["survey"]["updated_at"] ?? "NA";
    rootCauseList = responseJSON["root_causes"];
    attemptList = responseJSON["record"]["attempt"];
    cusAccName = responseJSON["record"]["user"]["cust_acc_name"] ?? "NA";
    cusSegment = responseJSON["record"]["user"]["cust_segment"] ?? "NA";
    ticketNumber = responseJSON["record"]["ticket_number"];
    refNumber = responseJSON["record"]["referance_id"] ?? "NA";
    destinationArea = responseJSON["survey"]["DESTAREA"] ?? "NA";
    eventDate = responseJSON["survey"]["EVENTDATE"] ?? "NA";
    eventTime = responseJSON["survey"]["EVENTTIME"] ?? "NA";
    product = responseJSON["survey"]["PRODUCT"] ?? "NA";
    subProduct = responseJSON["survey"]["SUBPRODUCT"] ?? "NA";
    compId = responseJSON["survey"]["COMPLAINTBY"] ?? "--";
    tpleadEmpId = responseJSON["survey"]["TPLEADEMAILID"] ?? "--";
    emailId = responseJSON["survey"]["EMAILID"] ?? "--";
    pEmailId = responseJSON["survey"]["PEMPLID"] ?? "--";
    pEmpName = responseJSON["survey"]["PEMPLNAME"] ?? "--";
    caltArea = responseJSON["survey"]["CULTAREA"] ?? "--";
    orgArea = responseJSON["survey"]["ORGAREA"] ?? "--";
    orgReg = responseJSON["survey"]["ORGREG"] ?? "--";

    if(attemptList.length==1){
        attempt2=false;
      }else if (attemptList.length==2){
       attempt3 = false;
    }
    //rootCauseSubTypeList = responseJSON["root_causes"]["subtypes"];
    print(rootCauseList.length);
    setState(() {});
  }

  submitApi() async {
    if (rootsType == '11') {
      Toast.show("Please select a root types",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else if (selectIndex == -1) {
      Toast.show("Please select a root cause subtypes",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else if (flagStatus == '13') {
      Toast.show("Please select flag status",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else if (resolutionStatus == '12') {
      Toast.show("Please select resolution status",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else{
      isLoading = true;
      setState(() {});
      var requestModel = {
        "root_cause_type": rootCauseType,
        "id": widget.id,
        "customer_id": customerID,
        "emp_id": widget.empID,
        "user_id": widget.userID,
        "root_cause_subtype": selectIndex,
        "root_cause_text": freeTextController.text,
        "other_reason_text": "",
        "resolution_to_customer": resolutionTextController.text,
        "feedback_to_bluedart": feedbackTextController.text,
        "flag_status":statusType,
        "status":resStatusType
      };

      print(requestModel);

      ApiBaseHelper helper = ApiBaseHelper();
      var response =
      await helper.postAPI('sc/save-response', requestModel, context);
      isLoading = false;
      var responseJSON = json.decode(response.body);
      print(responseJSON);

      if (responseJSON["status"]) {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
        //Navigator.pop(context);
        Navigator.of(context).pop('5');
      } else {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }

      setState(() {});
    }
  }
  saveApi(int clickedIndex) async {
   // String formattedDate1 = DateFormat('yyyy-MM-dd').format(formattedDate as DateTime);

    if (selectIndex == -1) {
      Toast.show("Please select customer response",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else{
      isLoading = true;
      setState(() {});
      var requestModel = {
        "attempt_date": attemptDate,
        "id": widget.id,
        "customer_response": selectIndex+1,
        "callback_date" : selectIndex == 1 ? selectDateTime : '',
      };

      print(requestModel);

      ApiBaseHelper helper = ApiBaseHelper();
      var response =
      await helper.postAPI('sc/save-attempt', requestModel, context);
      isLoading = false;
      var responseJSON = json.decode(response.body);
      print(responseJSON);

      if (responseJSON["status"]) {

        if(clickedIndex==1)
          {
            attempt1=true;
            setState(() {
              _isContainerVisible = !_isContainerVisible;
            });
            attempt2 = false;
          }else if(clickedIndex==2){
          attempt2=true;
          setState(() {
            _isContainerVisible = !_isContainerVisible;
          });
          attempt3 = false;
        }else{
          attempt3=true;
          setState(() {
            _isContainerVisible = !_isContainerVisible;
          });
          //attempt3 = false;
        };
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
       // Navigator.pop(context);
      } else {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }

      setState(() {});
    }
  }

  void _submitHandler() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    submitApi();

    //
  }
  void _saveHandler() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    saveApi(1);

    //
  }
  void _saveHandler1() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    saveApi(2);

    //
  }
  void _saveHandler2() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    saveApi(3);

    //
  }
  String? checkFreeText(String? value) {
    if (value!.isEmpty) {
      return 'Free text is required';
    }
    return null;
  }
  String? checkResolutionCustomer(String? value) {
    if (value!.isEmpty) {
      return 'Resolution to customer is required';
    }
    return null;
  }
  String? checkFeedback(String? value) {
    if (value!.isEmpty) {
      return 'Feedback to BlueDart is required';
    }
    return null;
  }
}


