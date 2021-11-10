import 'package:animehub/globals/styleColors.dart';
import 'package:flutter/material.dart';

/// Widget to create a comment card with user and its text
/// 
class Comment extends StatelessWidget {
  const Comment({@required this.user, @required this.comment});

  final user;
  final comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: kdarkGrey),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: korange, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  comment,
                  style: TextStyle(fontWeight: FontWeight.w500, color: kwhite),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 4))
      ],
    );
  }
}
