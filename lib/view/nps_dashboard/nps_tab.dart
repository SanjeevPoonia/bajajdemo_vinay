
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NPSTab extends StatefulWidget
{
  ResponseState createState()=>ResponseState();
}
class ResponseState extends State<NPSTab>
{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int pos)
    {
      return Column(
        children: [

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // Color of the shadow
                  spreadRadius: 0, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset of the shadow
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text('Email',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFf00ADEF),
                )),

                Text('abc@gmail.com',style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),



                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text('ID',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFf00ADEF),
                        )),

                        Text('54',style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),


                      ],
                    ),



                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text('Response ID',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFf00ADEF),
                        )),

                        Text('227',style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),


                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text('Rating',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFf00ADEF),
                        )),

                        Text('10',style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color:pos==0?Colors.red:Colors.green,
                        )),


                      ],
                    )



                  ],
                ),

                SizedBox(height: 10),


                Text('Time',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFf00ADEF),
                )),

                Text('17 May 2024',style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),




              ],
            ),
          ),

          SizedBox(height: 15),

        ],
      );
    }


    );
  }

}
