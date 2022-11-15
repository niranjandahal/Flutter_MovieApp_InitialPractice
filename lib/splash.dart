import 'package:flutter/material.dart';
import 'package:r05moviefullapi/homeui.dart';
import 'package:r05moviefullapi/search/searchui.dart';
// import 'dart:html';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 14, 24),
      body: homeui(),
      //   // body:tvseriesdescriptionui(90462),
      // body: SearchScreen('black'),
      //   // body: uiscreen(),
    );
  }
}
