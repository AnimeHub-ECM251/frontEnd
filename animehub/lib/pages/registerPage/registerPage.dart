import 'dart:convert';

import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:animehub/globals/url.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/mainPage/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String logo =
      'https://cdn.discordapp.com/attachments/822141817520652299/907415173944463420/unknown.png';

  Controller controller = Controller();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String user = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kblack,
          title: Center(
            child: TextButton(
              child: Image.network(
                logo,
                width: 120,
                height: 80,
              ),
              onPressed: () => {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(currentPage: 1),
                  ),
                  (route) => false,
                ),
              },
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  obscureText: true,
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
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(korange)),
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  _formKey2.currentState!.validate() &&
                  _formKey3.currentState!.validate()) {
                //TODO verificar POST de cadastro
                await controller.postRegister(
                    url, 'cadastrar-usuario', user, password, email);
                await ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Creating user')),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(korange)),
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('Ja tenho conta'),
          ),
        ],
      ),
    );
  }
}
