import 'package:arqe/screens/Startpage/loginpage.dart';
import 'package:arqe/screens/Startpage/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'towelcomescreen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "ARQe",
                style: TextStyle(fontFamily: "SF", fontSize: 30.sp),
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),

            // SizedBox(
            //   height: 48.0,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0.h),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  height: 6.0.h,
                  child: const Text('Log In',
                      style:
                          TextStyle(color: Colors.black, fontFamily: "SFBold")),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 10.0.h),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  height: 6.0.h,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontFamily: "SFBold"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
