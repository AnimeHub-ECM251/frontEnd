import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/animePage/widgets/Comment.dart';
import 'package:flutter/material.dart';

class CommentList extends StatefulWidget {
  const CommentList({@required this.comments});
  
  final comments;

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: klightGrey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var item in widget.comments)
                Comment(
                    user: item['userName'].toString(), comment: item['text'])
            ],
          ),
        ),
      ),
    );
  }
}
