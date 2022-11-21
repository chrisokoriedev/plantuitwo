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
  double newPrice = 23;
  bool isPressed = false;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    //screen
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: mediaHeight,
        //stack 
        child: Stack(
          children: [
            //image background
            Container(
              width: mediaWith,
              height: mediaHeight * 0.5 + 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg2.jpg'), fit: BoxFit.cover)),
            ),
            // top icon container
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
           //bottom sheet
            Align(          
              alignment: Alignment.bottomCenter,
              child: Container(
                width: mediaWith,
                height: mediaHeight * 0.4 + 40,
                padding: kPadding.copyWith(top: 10),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mediaWith * 0.3,
                          height: 7,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                    sizedHeight(20),
                    const Text(
                      'Fasciated Haworthia',
                      style: TextStyle(
                          fontSize: 22,
                          color: kPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    sizedHeight(15),
                    Text(
                      '\$$newPrice'.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: kPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    sizedHeight(20),
                    const Text(
                      'Haworthia Fasciata is a succulent easy '
                      'to care for that grows well indoors. Haworthia Fasciata plants are o'
                      'ften confused with Haworthia Attenuate because they are very similar.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: kPrimary),
                    ),
                    sizedHeight(30),
                    Row(
                      children: [
                        Row(
                          children: [
                            //minus button
                            buttonEvent(
                              () {
                                setState(() {
                                  if (quantity != 1) {
                                    quantity--;
                                    newPrice = newPrice - price;
                                  } else {
                                    return;
                                  }
                                });
                              },
                              '-',
                              Colors.grey.withOpacity(0.6),
                            ),
                            //quantity
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            //add button
                            buttonEvent(() {
                              setState(() {
                                if (quantity != 10) {
                                  quantity++;
                                  newPrice = price * quantity;
                                } else {
                                  return;
                                }
                              });
                            }, '+', kPrimary)
                          ],
                        ),
                        sizedWidth(20),
                        isAdded
                            ? Expanded(
                                child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        border: Border.all(
                                            color: kPrimary, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.local_grocery_store_rounded,
                                          color: kPrimary,
                                        ),
                                        sizedWidth(5),
                                        const Text(
                                          'Added to cart',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: kPrimary),
                                        ),
                                      ],
                                    )),
                              )
                            : Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isAdded = !isAdded;
                                    });
                                  },
                                  child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: kPrimary,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: whiteColor),
                                      ))),
                                ),
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
        height: 45,
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
