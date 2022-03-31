// library mine_page;

import 'package:flutter/material.dart';
import 'nav.dart';

class LoginPage extends StatefulWidget {
  final title;
  LoginPage(this.title);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, .5),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      hintText: 'Enter your email',
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    // Navigator.popAndPushNamed(context, '/home');
                    Navigator.pop(context);
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          )),
        ));
  }
}
