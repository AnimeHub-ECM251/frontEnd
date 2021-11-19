import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(
            'Login',
            style: TextStyle(
              color: korange,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
