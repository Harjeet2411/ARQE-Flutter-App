import 'package:arqe/screens/Startpage/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  static String id = '/toonboardingpage';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'When we get to this [AR] world',
              body:
                  'a lot of the things we think about today as physical objects, like a TV, will be \$1 apps in an AR app storeay',
              image: buildImage('assets/sp.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Next big step - The ‘device’ to fade away',
              body:
                  'We’re now building the best backend for the most frontend industry of all time',
              image: buildImage('assets/docc.jpg'),
              decoration: getPageDecoration(),
            ),
            // PageViewModel(
            //   title: 'Simple UI',
            //   body: 'For enhanced reading experience',
            //   image: buildImage('assets/manthumbs.png'),
            //   decoration: getPageDecoration(),
            // ),
            // PageViewModel(
            //   title: 'Today a reader, tomorrow a leader',
            //   body: 'Start your journey',
            //   // footer: ButtonWidget(
            //   //   text: 'Start Reading',
            //   //   onClicked: () => goToHome(context),
            //   // ),
            //   image: buildImage('assets/learn.png'),
            //   decoration: getPageDecoration(),
            // ),
          ],
          done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.black54,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomeScreen()),
      );

  Widget buildImage(String path) => Center(
          child: Image.asset(
        path,
        fit: BoxFit.cover,
      ));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.black54,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
