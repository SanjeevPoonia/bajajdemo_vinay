import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


class CustomerDetails extends StatefulWidget{
  bool showBack;
  String customerName = '';
  String mobNo = '';
  String awbNo = '';
  String accountNo = '';
  String npsRating = '';
  String empID = '';
  String empName = '';
  String customerComment = '';
  String touchPoint = '';
  String region = '';
  String location = '';
  String branch = '';
  String serviceCenter = '';
  String triggeredDate = '';
  String responseDate = '';
  String cusAccName = '';
  String cusSegment = '';
  String ticketNumber = '';
  String refNumber = '';
  String destinationArea = '';
  String eventDate = '';
  String eventTime = '';
  String product = '';
  String subProduct = '';
  String compId = '';
  String tpleadEmpId = '';
  String emailId = '';
  String pEmailId = '';
  String pEmpName = '';
  String caltArea = '';
  String orgArea = '';
  String orgReg = '';
  String awbNumber = '';

  CustomerDetails(this.showBack,this.customerName,this.mobNo,this.awbNo,this.accountNo,
      this.npsRating,this.empID,this.empName,this.customerComment,this.touchPoint,this.region,this.location,
      this.branch,this.serviceCenter,this.triggeredDate,this.responseDate,this.cusAccName,this.cusSegment,
      this.ticketNumber,this.refNumber,this.destinationArea
      ,this.eventDate,this.eventTime,this.product,this.subProduct,this.compId,this.tpleadEmpId,this.emailId,this.pEmailId,this.pEmpName,this.caltArea,this.orgArea,this.orgReg);
  @override
  CustomerDetailsState createState() => CustomerDetailsState();
}

class CustomerDetailsState extends State<CustomerDetails> {
  @override

  Widget build(BuildContext context) {
    String originalDate = widget.triggeredDate;
    DateTime dateTime = DateTime.parse(originalDate);
    String triggeredDateFormat = DateFormat("dd-MM-yyyy").format(dateTime);

    // Response date
    String originalDate1 = widget.responseDate;
    DateTime dateTime1 = DateTime.parse(originalDate1);
    String responseDateFormat = DateFormat("dd-MM-yyyy").format(dateTime1);
    print(widget.eventDate);
    return Container(
      color: AppTheme.themeNewColor,
      child: SafeArea(
        child: Scaffold(
          appBar: widget.showBack
              ? AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.0), // Add margin to the right
                  child: const Text('Customer Details',
                      style: TextStyle(
                        color: AppTheme.blueColor,
                      ),
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10.0), // Add margin to the right
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/cross_icon.svg',
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          )
              : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar()),
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                  color: AppTheme.lightgrayColor,
                  height: 50,// Background color of the container
                  width: double.infinity,
                  //alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16), // Add margin to the left
                    child: Text(
                      'Customer Details',
                      style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.customerName,
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
                            color: Colors.white,
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
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.mobNo,
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
                            color: Colors.white,
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
                                      'AWB Number ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.awbNo,
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Account Number',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.accountNo,
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
                            color: Colors.white,
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
                                      'Customer Account Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.cusAccName,
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Customer Segment',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.cusSegment,
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
                SizedBox(height: 10.0),
                Container(
                  color: AppTheme.lightgrayColor,
                  height: 50,// Background color of the container
                  width: double.infinity,
                  //alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16), // Add margin to the left
                    child: Text(
                      'NPS Response',
                      style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0), // Set left and right margin
                              child: Row(
                                children: [
                                  Text(
                                    'NPS rating: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(widget.npsRating,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Customer Comments',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8,),
                                    decoration: const BoxDecoration(
                                        color:
                                        Color(0xFFF7F7F7),
                                        borderRadius: BorderRadius.all(Radius.circular(6))),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 6, bottom: 6,),
                                                child: Text(
                                                  widget.customerComment,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: AppTheme.lightgrayColor,
                  height: 50,// Background color of the container
                  width: double.infinity,
                  //alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16), // Add margin to the left
                    child: Text(
                      'Employee Details',
                      style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Employee ID',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.empID,
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
                            color: Colors.white,
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
                                      'Employee Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.empName,
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
                Container(
                  color: AppTheme.lightgrayColor,
                  height: 50,// Background color of the container
                  width: double.infinity,
                  //alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16), // Add margin to the left
                    child: Text(
                      'Other Details',
                      style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Ticket Number',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.ticketNumber,
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
                            SizedBox(height: 0.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Reference Number',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.refNumber,
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
                            SizedBox(height: 0.0),
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                           ),
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Journey (Touchpoint)',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.touchPoint,
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
                            SizedBox(height: 0.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Region',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.region,
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
                            SizedBox(height: 0.0),
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Service Center',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.serviceCenter,
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
                            SizedBox(height: 0.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Branch',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(
                                      widget.branch,
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
                            SizedBox(height: 0.0),
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Destination Area',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.destinationArea,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Location',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.location,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Event Date',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.eventDate,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Event Time',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.eventTime,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Product',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.product,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'SubProduct',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.subProduct,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'AWBNUMBER',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.awbNo,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'COMPLAINTBY',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.compId,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'TPLEADEMAILID',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.tpleadEmpId,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'EMAILID',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.emailId,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'PEMPLID',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.pEmailId,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'PEMPLNAME',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.pEmpName,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'CALTAREA',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.caltArea,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'ORGAREA',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.orgArea,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'ORGREG',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(widget.orgReg,
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
                        margin: EdgeInsets.only(left: 10, right: 5, top: 12, bottom: 5,),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Survey triggered date',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(triggeredDateFormat,
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
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(height: 0.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: const Text(
                                      'Survey Response date',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
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
                                    child: Text(responseDateFormat,
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
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}