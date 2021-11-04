import 'package:animehub/globals/styleColors.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information(
      {@required this.studio,
      @required this.launchDate,
      @required this.episodes});

  final studio;
  final launchDate;
  final episodes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Studio: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: korange,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text(
                      studio,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, color: kwhite),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,0,0,8),
                child: Row(
                  children: [
                    Text(
                      "Launch date: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: korange,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text(
                      launchDate,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, color: kwhite),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,0,8,8),
                child: Row(
                  children: [
                    Text(
                      "Episodes: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: korange,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Text(
                      episodes,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, color: kwhite),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: kdarkGrey),
      ),
    );
  }
}
