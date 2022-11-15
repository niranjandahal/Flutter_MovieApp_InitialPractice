import 'package:flutter/material.dart';
import 'package:r05moviefullapi/CarouselSlider/carsouelsliderui.dart';
// import 'dart:html';

Widget futurebuilder(
  context,
  sectiontittle,
  functionname,
  List dataname,
  List dataposter,
  List datarating,
  List datarelease,
  List index,
  List id,
  List type,
) {
  return FutureBuilder(
    future: functionname(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SizedBox(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        );
      } else {
        return carouselsliderui(context, sectiontittle, functionname, dataname,
            dataposter, datarating, datarelease, index, id, type);
      }
    },
  );
}
