import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  /// Widget to show rankings, must give the rank label and its info.
  InfoCard({@required this.label, @required this.info});
  final info;
  final label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Expanded(
        child: Container(
          child: Card(
            color: kdarkGrey,
            elevation: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$label:\n $info",
                  textAlign: TextAlign.center,
                  style: kinfoCardTextStyle,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: klightGrey,
                blurRadius: 3,
                spreadRadius: -4,
              ),
            ],
          ),
          height: 80,
        ),
      ),
    );
  }
}
