


import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class TextFieldWidget extends StatelessWidget
{
  final String label;
  final String hint;

  TextFieldWidget(this.label,this.hint);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          child:  Text(
            label,
            style: TextStyle(
              color: AppTheme.themeColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: TextFormField(
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
                  hintText:hint,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF707070)))),
        ),

      ],
    );
  }

}