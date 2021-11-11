import 'package:animehub/pages/mainPage/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

class PageBarConteiner extends StatelessWidget {
  final int currentPage;

  const PageBarConteiner({Key? key, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i < 5; i++)
              FloatingActionButton(
                  key: Key(i.toString()),
                  child: Text(
                    (i).toString(),
                    style: TextStyle(
                      color: (i == currentPage) ? kblack : kwhite,
                    ),
                  ),
                  backgroundColor: (i == currentPage) ? korange : kdarkGrey,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            int btnID = i;
                            return HomePage(
                              currentPage: btnID,
                            );
                          }),
                        )
                      }),
          ],
        ),
      ),
    );
  }
}
