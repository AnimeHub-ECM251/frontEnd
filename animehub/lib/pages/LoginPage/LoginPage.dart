import 'dart:convert';

import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:animehub/globals/variables.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/LoginPage/widgets/login_title.dart';
import 'package:animehub/pages/registerPage/registerPage.dart';
import 'package:animehub/pages/mainPage/mainPage.dart';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Controller controller = Controller();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool _isObscure = true;
  var respLogin;
  String user = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*###################################################
      #                       AppBar                      #
      ###################################################*/
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
        ),
      ),
      /*###################################################
      #                       Body                        #
      ###################################################*/
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PageTitle(),
              /*###################################################
              #                      INPUTS                       #
              ###################################################*/
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 500,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelStyle: kinfoCardTextStyle,
                          labelText: 'Username'),
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
                    width: 500,
                    child: TextFormField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        focusColor: kwhite,
                        labelStyle: kinfoCardTextStyle,
                        labelText: 'password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kwhite,
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
              /*###################################################
              #                       BTNS                        #
              ###################################################*/
              Padding(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 24, right: 24), // btn aling
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*###################################################
                    #                    BTN  Login                     #
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
                              _formKey2.currentState!.validate()) {
                            respLogin = await controller.postLogin(
                                url, 'logar-usuario', user, password);
                            // update current user
                            print('antes de logar' + userID);
                            userID = respLogin.body.toString();
                            print('depois de logar' + userID);
                            // return to main page and clear Nav
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomePage(currentPage: 1),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    /*###################################################
                    #                    cadastrar                      #
                    ###################################################*/
                    SizedBox(
                      height: 16,
                    ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text('Fazer cadastro'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
