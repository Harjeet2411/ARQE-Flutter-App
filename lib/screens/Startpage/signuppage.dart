import 'package:arqe/components/constants.dart';
import 'package:arqe/components/utils.dart';
import 'package:arqe/screens/Startpage/verifyemail.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/tosignuppage';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/ARQe.jpg'),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Text(
                    "Welcome to Register Page",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: Text(
                    "Fill up the details to register",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kTextfielddec.copyWith(hintText: 'Enter your email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      kTextfielddec.copyWith(hintText: 'Enter your password'),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min. 6 charecters'
                      : null,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showspinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, VerifyEmail.id);
                          }
                          setState(() {
                            showspinner = false;
                          });
                        } on FirebaseAuthException catch (e) {
                          Utils.showSnackBar(e.message);
                          setState(() {
                            showspinner = false;
                          });
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
