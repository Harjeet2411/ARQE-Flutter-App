import 'package:arqe/screens/content_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/ar_viewer.dart';

class ModelTile extends StatelessWidget {
  final String? img;
  final String? title;
  final String? src;
  const ModelTile({
    Key? key,
    required this.img,
    required this.title,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContentView(
                      src: src,
                      title: title,
                      img: img!,
                    ))),
        child: Container(
          height: 35.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              Hero(
                tag: img!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    img!,
                    height: 35.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.bottomLeft,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            fontFamily: "SFBold",
                            color: Colors.white,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ARViewer(
                                      alt: "",
                                      src: src,
                                      title: title,
                                    )))),
                        child: const Icon(
                          Icons.view_in_ar,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
