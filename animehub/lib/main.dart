import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/mainPage/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: kblack,
    ),
    home: MainPage(),
  ));
}
