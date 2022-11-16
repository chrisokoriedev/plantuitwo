import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgetandstyle.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  double price = 23;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: mediaHeight,
        child: Stack(
          children: [
            Container(
              width: mediaWith,
              height: mediaHeight * 0.5 + 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg2.jpg'), fit: BoxFit.cover)),
            ),
            Container(
              padding: kPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back)),
                  IconButton(
                    icon: Icon(
                      isPressed ? Icons.favorite : Icons.favorite_outline,
                      color: isPressed ? kPrimary : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: mediaWith,
                height: mediaHeight * 0.4 + 40,
                padding: kPadding,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Fasciated Haworthia',
                      style: TextStyle(
                          fontSize: 25,
                          color: kPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    sizedHeight(15),
                    Text(
                      '\$$price'.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: kPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    sizedHeight(10),
                    const Text(
                      'Haworthia Fasciata is a succulent easy '
                      'to care for that grows well indoors. Haworthia Fasciata plants are o'
                      'ften confused with Haworthia Attenuate because they are very similar.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: kPrimary),
                    ),
                    sizedHeight(30),
                    Row(
                      children: [
                        Row(
                          children: [
                            buttonEvent(
                              () {
                                setState(() {
                                  if (quantity != 1) {
                                    price = price / quantity;

                                    quantity--;
                                  } else {
                                    return;
                                  }
                                });
                              },
                              '-',
                              Colors.grey.withOpacity(0.6),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            buttonEvent(() {
                              setState(() {
                                if (quantity != 10) {
                                  quantity++;
                                  price = price * quantity;
                                } else {
                                  return;
                                }
                              });
                            }, '+', kPrimary)
                          ],
                        ),
                        sizedWidth(20),
                        Expanded(
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: kPrimary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor),
                              ))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  buttonEvent(VoidCallback press, String symbol, Color color) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: symbol == '+' ? whiteColor : Colors.black),
          ),
        ),
      ),
    );
  }
}