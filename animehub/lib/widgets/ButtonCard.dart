import 'package:animehub/consts.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  /// Widget to do card buttons to add to fav or watch list
  /// 
  /// To add must use back-end
  ButtonCard({@required this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,8,8,2),
      child: ElevatedButton(
        style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kdarkGrey)),
        onPressed: () {
          print("added");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kbuttonCardTextStyle,
          ),
        ),
      ),
    );
  }
}
