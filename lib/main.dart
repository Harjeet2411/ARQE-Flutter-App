import 'package:arqe/components/utils.dart';
import 'package:arqe/screens/Startpage/loginpage.dart';
import 'package:arqe/screens/Startpage/onboarding_page.dart';
import 'package:arqe/screens/Startpage/signuppage.dart';
import 'package:arqe/screens/Startpage/verifyemail.dart';
import 'package:arqe/screens/Startpage/welcome_screen.dart';
import 'package:arqe/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        initialRoute: OnBoardingPage.id,
        title: 'ARQe',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: "SF",
              fontSize: 20.sp,
            ),
          ),
          primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: "SF",
            ),
            bodyText2: TextStyle(
              color: Colors.black,
              fontFamily: "SF",
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        routes: {
          OnBoardingPage.id: (context) => StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const VerifyEmail();
                  } else {
                    return const OnBoardingPage();
                  }
                },
              ),
          Home.homeid: (context) => const Home(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
          VerifyEmail.id: (context) => const VerifyEmail(),
        },
        //home: const Home()
      );
    });
  }
}

// const  ARViewer(
//         alt: '3D Model',
//         src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
//         title: 'AR Viewer',
//       ),
