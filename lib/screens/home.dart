import 'package:arqe/data/model_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/model_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelData> models = [
    ModelData(
        'https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Astronaut.glb?v=1649417799534',
        "assets/astro.jpg",
        "Explore Astronaut"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/EarthAR.glb?v=1649417849715",
        "assets/Earth.jpg",
        "Explore Earth"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Jupiter.glb?v=1649427371338",
        "assets/Jupiter.jpg",
        "Explore Jupiter"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Moon.glb?v=1649417827674",
        "assets/Moon.jpg",
        "Explore Moon"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Neptune.glb?v=1649427374512",
        "assets/Neptune.jpg",
        "Explore Neptune"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Saturn.glb?v=1649427376958",
        "assets/Saturn.jpg",
        "Explore Saturn"),
    ModelData(
        "https://cdn.glitch.global/4bf9f3b5-e28d-48f3-aadd-6c11bbfc954f/Sun.glb?v=1649417816009",
        "assets/Sun.jpg",
        "Explore Sun")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text("ARQe"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("WEDNESDAY 6 APRIL",
                  style: TextStyle(
                    fontFamily: "SFBold",
                    color: Colors.grey,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  // SizedBox(
                  //   width: 5.w,
                  // ),
                  Text(
                    "Today",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 23.sp,
                      fontFamily: "SFBold",
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.settings,
                  ),
                  // SizedBox(
                  //   width: 5.w,
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: models.length,
                      itemBuilder: (context, index) => ModelTile(
                          src: models[index].model,
                          img: models[index].img,
                          title: models[index].title))),
            )
          ],
        ),
      ),
    );
  }
}
