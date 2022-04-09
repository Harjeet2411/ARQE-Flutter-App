import 'package:arqe/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
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
          home: const Home());
    });
  }
}






// const  ARViewer(
//         alt: '3D Model',
//         src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
//         title: 'AR Viewer',
//       ),
