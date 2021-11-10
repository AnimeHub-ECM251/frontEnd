import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  /// Widget to do card buttons to add or remove to watchlist
  /// Verification must be the boolean from is added endpoint
  ButtonCard({@required this.text, required this.verifyInList, required this.userId});
  final text;
  final bool verifyInList;
  final userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,8,8,2),
      child: ElevatedButton(
        style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kdarkGrey)),
        onPressed: () {
          //TODO POST add or remove watchlist

          (userId == '-1.0') ? print('nao logou') : (verifyInList ? print("remove request") : print("add request"));
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
