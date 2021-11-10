import 'dart:convert';

import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String user = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: kdarkGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: kinfoCardTextStyle, labelText: 'username'),
                  style: kbuttonCardTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be blank';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    user = value;
                  },
                ),
              ),
            ),
          ),
          Form(
            key: _formKey2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: kdarkGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: kinfoCardTextStyle, labelText: 'password'),
                  style: kbuttonCardTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be blank';
                    }
                    return null;
                  },
                   onChanged: (value) {
                     // Encoding password
                     var bytes = utf8.encode(value);
                     var digest = sha256.convert(bytes);
                     password = digest.toString();
                     print(password);
                  },
                ),
              ),
            ),
          ),
          Form(
            key: _formKey3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: kdarkGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: kinfoCardTextStyle, labelText: 'email'),
                  style: kbuttonCardTextStyle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be blank';
                    }
                    return null;
                  },
                   onChanged: (value) {
                    email = value;
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  _formKey2.currentState!.validate() &&
                  _formKey3.currentState!.validate()) {

                //TODO POST de cadastro

                await ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Creating user')),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
