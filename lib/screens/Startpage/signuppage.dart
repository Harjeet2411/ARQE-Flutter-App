import 'package:arqe/components/utils.dart';
import 'package:arqe/screens/Startpage/verifyemail.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/tosignuppage';

  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  late String email;
  late String password;
  late bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Center(
                      child: Text(
                        "ARQe",
                        style: TextStyle(fontFamily: "SF", fontSize: 30.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    const Center(
                      child: Text(
                        "Register your account",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: "SFBold",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(fontFamily: "SF"),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                        ),
                        hintStyle: const TextStyle(fontFamily: "SF"),
                      ),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min. 6 charecters'
                          : null,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
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
                              // ignore: unnecessary_null_comparison
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
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black, fontFamily: "SF"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
