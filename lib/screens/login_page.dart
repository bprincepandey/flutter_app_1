import "package:flutter/material.dart";
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/hey_email.png",
                    fit: BoxFit.cover),
                SizedBox(height: 20),
                Text("Welcome to Reaktion $username",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Username cannot be empty.";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              username = value;
                              setState(() {});
                            },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password cannot be empty.";
                              }
                              if (value.length < 6) {
                                return "Password should be at least 6 characters.";
                              }
                              return null;
                            },
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            onPrimary: Colors.white,
                            minimumSize: Size(150, 40)),
                        onPressed: () => moveToHome(context)
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
