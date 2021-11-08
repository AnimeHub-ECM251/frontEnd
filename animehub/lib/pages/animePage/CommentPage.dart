import 'package:animehub/globals/styleColors.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleText.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comment = null;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kdarkGrey,
                      blurRadius: 3,
                      spreadRadius: -4,
                    ),
                  ],
                ),
                child: TextField(
                  maxLines: 10,
                  style: kbuttonCardTextStyle,
                  onChanged: (value) {
                    comment = value;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(korange)),
                  child: Text('Send comment', style: TextStyle(color: kblack),),
                  onPressed: () {
                    Navigator.pop(context, comment);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
