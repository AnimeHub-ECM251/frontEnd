import 'package:animehub/consts.dart';
import 'package:flutter/material.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({@required this.synopsis});
  final synopsis;
  
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
                        Text(
                          "Sinopse",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: korange, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(synopsis,
                        style: TextStyle(fontWeight: FontWeight.w500, color: kwhite),)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: kdarkGrey),
                ),
              );
  }
}