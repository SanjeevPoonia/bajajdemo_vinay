import 'dart:convert';

import 'package:bajaj_app/network/shopper_network/Utils.dart';
import 'package:bajaj_app/network/shopper_network/api_helper.dart';
import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';
import 'package:bajaj_app/view/shopper_view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class FilterScreen extends StatefulWidget{
  bool showBack;
  String userID;

  FilterScreen(this.showBack,this.userID);
  @override
  FilterScreenState createState() => FilterScreenState();
}

class FilterScreenState extends State<FilterScreen>{
  int _selectedIndex = 0;
  int selectedCaseIndex = -1;
  int _isCheckedIndex = 9999;
  int count = 0;
  bool isLoading = false;
  List<dynamic> journeyList = [];
  List<dynamic> journeyListOpen = [];
  List<dynamic> journeyListWip = [];
  List<dynamic> journeyListClosed = [];
  List<dynamic> journeyListAssigned = [];
  bool filterApplied=false;
  String openStatusCount = '';
  String wipStatusCount = '';
  String closedStatusCount = '';
  String assignedStatusCount = '';
  final List<Map<String, String>> dataArray = [
    {"name": "Open"},
    {"name": "Assigned"},
    {"name": "WIP"},
    {"name": "Closed"},
    // Add more users here...
  ];

  void updateStatus(int pos, String status) {
    dataArray[pos]["status"] = status;
  }

  DateTime _startDate =  DateTime.now();
  DateTime _endDate =  DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      setState(() {
        _startDate = pickedStartDate;
        _isCheckedIndex = -1;
        gatFilterData();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedEndDate != null && pickedEndDate != _endDate) {
      setState(() {
        _endDate = pickedEndDate;

      });
    }
  }
  @override
  Widget build(BuildContext context){
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
                   margin: EdgeInsets.only(right: 10.0),
                   child: Text('Filters',
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
           body: Column(
             children: [
               SizedBox(height: 8.0),
               Container(
                 color: AppTheme.lightgrayColor,
                 height: 50,// Background color of the container
                 width: double.infinity,
                 //alignment: Alignment.center,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10.0),
                         child: Image.asset('assets/calendar_blue.png', width: 20, height: 20),
                       ),
                       SizedBox(width: 8.0),
                       InkWell(
                         onTap: () {
                           _selectStartDate(context);
                          print('hey');
                         },
                         child: Text(
                           _startDate == null
                               ? 'No date selected'
                               : _startDate.toString().substring(0, 10),
                           style: TextStyle(
                             fontSize: 14.0,
                             color: AppTheme.blueColor,
                             decoration: TextDecoration.underline,
                           ),
                         ),
                       ),
                       // Padding(
                       //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                       //   child: Image.asset('assets/arrow.png', width: 20, height: 20),
                       // ),
                       // InkWell(
                       //   onTap: () {
                       //     _selectEndDate(context);
                       //    print('hello');
                       //   },
                       //   child: Text(
                       //     _endDate == null
                       //         ? 'No date selected'
                       //         : _endDate.toString().substring(0, 10),
                       //     style: TextStyle(
                       //       fontSize: 14.0,
                       //       color: AppTheme.blueColor,
                       //       decoration: TextDecoration.underline,
                       //     ),
                       //   ),
                       // ),
                     ],
                   ),

               ),
               const SizedBox(height: 4),
               Expanded(
                 child: Row(
                   children: [
                     Container(
                       color: AppTheme.lightgrayColor,
                       width: MediaQuery.of(context).size.width * 0.45,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           //const SizedBox(height: 15),
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 //_selectedIndex = 0;
                               });
                             },
                             child: Container(
                               padding: const EdgeInsets.only(top: 16, left: 10),
                               height: 50,
                               width: MediaQuery.of(context).size.width * 0.45,
                               color: _selectedIndex == 0
                                   ? AppTheme.blueColor
                                   : AppTheme.buttonColor,
                               child: Text('Select Cases Status',
                                   style: TextStyle(
                                     fontSize: 14,
                                     color: _selectedIndex == 0
                                         ? Colors.white
                                         : Colors.black,
                                   )),
                             ),
                           ),
                           const SizedBox(height: 15),
                         ],
                       ),
                     ),
                     Expanded(
                         child: Container(
                           color: Colors.white,
                           child: Column(
                             children: [
                               Expanded(
                                   child: ListView.builder(
                                       itemCount: dataArray.length,
                                       itemBuilder:
                                           (BuildContext context, int pos) {
                                         return Padding(
                                           padding: EdgeInsets.only(
                                               left: 10, top: 10, bottom: 5,right: 10),
                                             child: Row(
                                               children: [
                                               GestureDetector(
                                               onTap: () {
                                                 setState(() {
                                                   _isCheckedIndex = pos;

                                                   if ((closedStatusCount == "0") && (wipStatusCount == "0") && (assignedStatusCount == "0") && (openStatusCount == "0")){
                                                     selectedCaseIndex = -1;
                                                   }else{
                                                     selectedCaseIndex = pos;
                                                   }
                                                   print("Position: $closedStatusCount");
                                                 });
                                                 filterApplied=true;
                                                 // Example: On tap, update the status of the user with a dynamic value
                                                 if (pos == 0) {
                                                   updateStatus(pos, openStatusCount);
                                                 } else if (pos == 1) {
                                                   updateStatus(pos, assignedStatusCount);
                                                 } else if (pos == 2) {
                                                   updateStatus(pos, wipStatusCount);
                                                 } else {
                                                   updateStatus(pos, closedStatusCount);
                                                 }
                                               },
                                                 child: Container(
                                                   color: _isCheckedIndex == pos ? AppTheme.lightgrayColor : Colors.white,
                                                   height: 25,
                                                   width: 185,
                                                   child:Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Padding(
                                                         padding: EdgeInsets.only(left: 10.0),
                                                         child: Text(dataArray[pos]['name']!,
                                                             style: TextStyle(
                                                               fontSize: 13,
                                                               color: Colors.black,
                                                             )),
                                                       ),
                                                       Padding(
                                                         padding: EdgeInsets.only(right: 10.0),
                                                         child: Text(dataArray[pos]['status'] ?? '',
                                                             style: TextStyle(
                                                               fontSize: 13,
                                                               color: Colors.black,
                                                             )),
                                                       ),


                                                     ],
                                                   ),
                                                 ),

                                             ),
                                               ],
                                             ),
                                          // ),
                                         );
                                       })),
                               const SizedBox(height: 15),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(
                                     child: Align(
                                       alignment: Alignment.centerRight,
                                       child: Container(
                                         margin: EdgeInsets.only(right:10),
                                         width: 100,
                                         height: 50,
                                         child: Padding(
                                           padding: EdgeInsets.only(top: 8.0),
                                           child: ElevatedButton(
                                             onPressed: () {
                                               Navigator.push(
                                                   context,
                                                   MaterialPageRoute(
                                                       builder: (context) =>
                                                           HomeScreen(true,selectedCaseIndex,true,)));
                                             },
                                             style: ElevatedButton.styleFrom(
                                               backgroundColor: AppTheme.buttonColor, // Set the desired background color
                                             ),
                                             child: Center(
                                               child: Text(
                                                 'Apply',
                                                 style: TextStyle(
                                                   fontSize: 16.0,
                                                   color: Colors.white,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),

                                 ],
                               ),
                               const SizedBox(height: 30),
                             ],
                           ),
                         ))
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
     );
   }

  void initState() {
    // TODO: implement initState
    super.initState();
    gatFilterData();
  }
  gatFilterData() async {
    isLoading = true;
    setState(() {});
    int? Id = await MyUtils.getSharedPreferencesInt("id")??0;
    var requestModel = {
      "id":Id,
      "date":_startDate.toString().substring(0, 10)
    };

    print(requestModel);
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('sc/dashboard', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    journeyList = responseJSON["records"];
    journeyListOpen = journeyList.where((item) => item['status'] == 0).toList();
    journeyListAssigned = journeyList.where((item) => item['status'] == 1).toList();
    journeyListWip = journeyList.where((item) => item['status'] == 2).toList();
    journeyListClosed = journeyList.where((item) => item['status'] == 3).toList();
    print("Filtered Data: $journeyListOpen");
    openStatusCount = journeyListOpen.length.toString();
    assignedStatusCount = journeyListAssigned.length.toString();
    wipStatusCount = journeyListWip.length.toString();
    closedStatusCount = journeyListClosed.length.toString();
    print(journeyList.length);
    setState(() {});
  }
}