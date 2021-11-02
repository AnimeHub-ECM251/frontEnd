import 'package:flutter/material.dart';

const korange = Color.fromARGB(255, 255, 163, 26);
const klightGrey = Color.fromARGB(255, 128, 128, 128);
const kdarkGrey = Color.fromARGB(255, 41, 41, 41);
const kblack = Color.fromARGB(255, 27, 27, 27);
const kwhite = Colors.white;
const kbuttonStyle =
    TextStyle(color: kwhite, fontWeight: FontWeight.w400, letterSpacing: 1.0);



class ButtonCard extends StatelessWidget {
  ButtonCard({@required this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kdarkGrey,
      shadowColor: klightGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kbuttonStyle,
        ),
      ),
    );
  }
}
