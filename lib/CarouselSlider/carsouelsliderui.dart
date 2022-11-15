import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r05moviefullapi/descriptionpage/descriptioncheck.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'dart:html';

Widget carouselsliderui(
  context,
  String sectiontittle,
  functionname,
  List dataname,
  List dataposter,
  List datarating,
  List datarelease,
  List index,
  List id,
  List type,
) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 18, 2, 24),
              Color.fromARGB(255, 4, 21, 34),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        alignment: Alignment.centerLeft,
        // height: 50,
        child: Text(
          sectiontittle,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 18, 2, 24),
                Color.fromARGB(255, 4, 21, 34),
              ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 18, 2, 24),
                      Color.fromARGB(255, 4, 21, 34),
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              height: 240,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 2),
                  height: 220,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.45,
                  initialPage: 0,
                  autoPlayCurve: Curves.ease,
                  // enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),

                // items:index.map<Widget>((i) {
                items: [
                  0,
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                  16,
                  17,
                  18,
                  19,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(dataposter[i]),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                          ),
                        ),

                        //
                        //
                        //
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  descriptioncheckui(id[i], type[i]),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                child: Text(
                                  index[i].toString() + "  " + dataname[i],
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        // fontWeight: FontWeight.w400,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(
                                  bottom: 12,
                                ),
                                child: Icon(
                                  Icons.star_border,
                                  color: Color.fromARGB(255, 251, 255, 0),
                                  size: 15,
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(bottom: 27),
                                child: Text(
                                  datarating[i].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      // fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  datarelease[i],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
