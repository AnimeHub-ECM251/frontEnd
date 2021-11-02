import 'package:flutter/material.dart';
import 'package:animehub/consts.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kblack),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Boku no Pico"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "https://www.animesgratisbr.biz/wp-content/uploads/2021/03/bokunohero5.jpg",
                height: 500,
              ),
              ButtonCard(text: "Add to favorites",),
              ButtonCard(text: "Add to watch list",),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Card(
                      color: kdarkGrey,
                      shadowColor: klightGrey,
                      elevation: 5,
                      child: Center(
                        child: Text(
                          "Rating: 4.6",
                          textAlign: TextAlign.center,
                          style: kbuttonStyle,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 200,
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  SizedBox(
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          "Popularity: 9",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
