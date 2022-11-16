
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detailpage.dart';
import 'main.dart';
import 'widgetandstyle.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: kPadding,
        width: mediaWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                image: const AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Green Way is \nOur Way',
              style: TextStyle(
                  height: 1.2,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                  letterSpacing: 1.5),
            ),
            sizedHeight(30),
            const Text(
              'To plant a garden to believe in\ntommorrow',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                  letterSpacing: 1.3),
            ),
            sizedHeight(30),
            GestureDetector(
              onTap: () => Get.to(const DetailScreen()),
              child: Center(
                child: Container(
                  width: mediaWidth * 0.6,
                  height: 45,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Get started',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

