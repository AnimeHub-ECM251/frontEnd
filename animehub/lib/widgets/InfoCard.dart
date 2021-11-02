import 'package:animehub/consts.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  /// Widget to show rankings, must give the rank label and its info.
  ///
  /// Info must come from back-end.
  InfoCard({@required this.label, @required this.info});
  final info;
  final label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: Card(
          color: kdarkGrey,
          elevation: 5,
          child: Center(
            child: Text(
              "$label: $info",
              textAlign: TextAlign.center,
              style: kinfoCardTextStyle,
            ),
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: klightGrey,
              blurRadius: 5,
              spreadRadius: -6,
            ),
          ],
        ),
        height: 100,
        width: 150,
      ),
    );
  }
}
