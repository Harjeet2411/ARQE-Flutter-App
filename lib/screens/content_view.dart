import 'package:arqe/screens/ar_viewer.dart';
import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  final String? img;
  final String? src;
  final String? title;
  const ContentView(
      {Key? key, required this.src, required this.img, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Colors.white,
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ARViewer(
                        alt: "",
                        src: src,
                        title: title,
                      )))),
          child: const Icon(
            Icons.view_in_ar_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(children: [
        Hero(tag: src!, child: Image.asset(img!)),
        Text(title!)
      ]),
    );
  }
}
