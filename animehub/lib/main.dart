import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/animePage/animePage.dart';
import 'package:animehub/pages/registerPage/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: kblack),
    home: RegisterPage(),
  ));
}
