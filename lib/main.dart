import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

const kPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 25);
const whiteColor = Colors.white;
const kPrimary = Color(0xff214813);
SizedBox sizedHeight(double height) {
  return SizedBox(
    height: height,
  );
}

final mediaWith = Get.mediaQuery.size.width;
final mediaHeight = Get.mediaQuery.size.height;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

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

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

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
                  const Icon(Icons.favorite_outline),
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
                    const Text(
                      '\$23.4',
                      style: TextStyle(
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
                        letterSpacing: 1.2,
                      ),
                    ),
                    sizedHeight(30),
                    Row(
                      children: [
                        buttonEvent(() {
                          setState(() {
                            quantity--;
                          });
                        }, '-', Colors.grey.withOpacity(0.6)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        buttonEvent(() {
                          setState(() {
                            quantity++;
                          });
                        }, '+', kPrimary)
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
