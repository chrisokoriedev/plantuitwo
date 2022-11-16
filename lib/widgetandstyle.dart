import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 25);
const whiteColor = Colors.white;
const kPrimary = Color(0xff214813);
SizedBox sizedHeight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox sizedWidth(double width) {
  return SizedBox(
    width: width,
  );
}

final mediaWith = Get.mediaQuery.size.width;
final mediaHeight = Get.mediaQuery.size.height;