import 'dart:convert';

import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:animehub/globals/variables.dart';
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
  Controller controller = Controller();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String respLogin = '';
  String user = '';
  String password = '';
  String email = '';
  bool _isObscure = true;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: korange,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            /*###################################################
            #                      INPUTS                       #
            ###################################################*/
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
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
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: TextFormField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelStyle: kinfoCardTextStyle,
                      labelText: 'password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
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
                    },
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
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
            /*###################################################
            #                       BTNS                        #
            ###################################################*/
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*###################################################
                  #                     BTN Cadastrar                 #
                  ###################################################*/
                  SizedBox(
                    width: 450,
                    height: 50,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: korange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _formKey2.currentState!.validate() &&
                            _formKey3.currentState!.validate()) {
                          await controller.postRegister(
                              url, 'cadastrar-usuario', user, password, email);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(respLogin != '-1'
                                    ? 'Cadastrado com sucesso'
                                    : 'Erro no cadastro')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /*###################################################
                  #                    BTN  Login                     #
                  ###################################################*/
                  SizedBox(
                    width: 450,
                    height: 50,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kdarkGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: const Text('Já tenho conta'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
