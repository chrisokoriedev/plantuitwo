import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          children: [Text('Green way is out way')],
        ),
      ),
    );
  }
}
