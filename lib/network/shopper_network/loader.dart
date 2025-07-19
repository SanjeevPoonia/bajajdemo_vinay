
import 'package:flutter/material.dart';

import 'package:bajaj_app/utils/shopper_utils/app_theme.dart';


class Loader extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
      ),
    );
  }

}