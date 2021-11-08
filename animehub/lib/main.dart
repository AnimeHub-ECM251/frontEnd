import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/animePage/animePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: kblack),
    home: AnimePage(),
  ));
}
