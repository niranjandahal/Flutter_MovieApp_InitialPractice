import 'dart:convert';

import 'package:r05moviefullapi/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:r05moviefullapi/futurebuilder/futurebuilder.dart';
import 'package:r05moviefullapi/search/searchui.dart';
// import 'dart:html';

class homeui extends StatefulWidget {
  const homeui({super.key});

  @override
  State<homeui> createState() => _homeuiState();
}

class _homeuiState extends State<homeui> {
  TextEditingController movietext = TextEditingController();

  var apikey = 'd78e371a935bd40f2c8418704687ebd8';
  var globaltrendingweekurl =
      'https://api.themoviedb.org/3/trending/all/week?api_key=d78e371a935bd40f2c8418704687ebd8';
  var globaltrendingdayurl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=d78e371a935bd40f2c8418704687ebd8';
  var globalupcomingurl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
  var globalpopularmoviesurl =
      'https://api.themoviedb.org/3/movie/popular?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
  var globalpopulartvseriesurl =
      'https://api.themoviedb.org/3/tv/popular?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
  var globaltopratedmoviesurl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
  var globalpopulartvseriesurl1 =
      'https://api.themoviedb.org/3/tv/popular?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
  var globaltrendingweekjsonlistresult; //global week trending json list
  var globaltrendingdayjsonlistresult; //global day trending json list
  var globalpopularmoviejsonlistresult; //global popular json list
  var globalpopulartvseriesjsonlistresult; //global popular tv series json list
  var globaltopratedmoviesjsonlistresult; //global top rated movies json list
  //global trending week lists
  List gtweekname = [],
      gtweekposter = [],
      gtweekrating = [],
      gtweektype = [],
      gtweekorglan = [],
      gtweekoverview = [],
      gtweekrelease = [],
      gtweekid = [],
      gtweekindex = [];
  // global trending day lists
  List gtdayname = [];
  List gtdayposter = [];
  List gtdayrating = [];
  List gtdaytype = [];
  List gtdayorglan = [];
  List gtdayoverview = [];
  List gtdayrelease = [];
  List gtdayid = [];
  List gtdayindex = [];
  //global popular lists
  List gpopname = [];
  List gpopposter = [];
  List gpoprating = [];
  List gpoptype = [];
  List gpoporglan = [];
  List gpopoverview = [];
  List gpoprelease = [];
  List gpopid = [];
  List gpopindex = [];
  //global popular tv series lists
  List gptvname = [];
  List gptvposter = [];
  List gptvrating = [];
  List gptvtype = [];
  List gptvorglan = [];
  List gptvoverview = [];
  List gptvrelease = [];
  List gptvid = [];
  List gptvindex = [];
  //global top rated movies lists
  List gtrname = [];
  List gtrposter = [];
  List gtrrating = [];
  List gtrtype = [];
  List gtrorglan = [];
  List gtroverview = [];
  List gtrrelease = [];
  List gtrid = [];
  List gtrindex = [];

  Future<void> globaltrendingweek() async {
    var response = await http.get(Uri.parse(globaltrendingweekurl));
    if (response.statusCode == 200) {
      var globaltrendingweekjsonlist = jsonDecode(response.body);
      globaltrendingweekjsonlistresult = globaltrendingweekjsonlist['results'];
    } else {
      print(response.statusCode);
    }
//converting json to list
    for (var i = 0; i < globaltrendingweekjsonlistresult.length; i++) {
      var tempname = globaltrendingweekjsonlistresult[i]['title'];
      var tempname2 = globaltrendingweekjsonlistresult[i]['name'];
      if (tempname == null) {
        gtweekname.add(tempname2);
      } else {
        gtweekname.add(tempname);
      }
      var tempposter = globaltrendingweekjsonlistresult[i]['poster_path'];
      gtweekposter.add("https://image.tmdb.org/t/p/original" + tempposter);
      var temprating = globaltrendingweekjsonlistresult[i]['vote_average'];
      gtweekrating.add(temprating);
      var temptype = globaltrendingweekjsonlistresult[i]['media_type'];
      gtweektype.add(temptype);
      var temporglan = globaltrendingweekjsonlistresult[i]['original_language'];
      gtweekorglan.add(temporglan);
      var tempoverview = globaltrendingweekjsonlistresult[i]['overview'];
      gtweekoverview.add(tempoverview);
      var tempid = globaltrendingweekjsonlistresult[i]['id'];
      gtweekid.add(tempid);
      var temprelease = globaltrendingweekjsonlistresult[i]['release_date'];
      var temprelease2 = globaltrendingweekjsonlistresult[i]['first_air_date'];
      if (temprelease == null) {
        gtweekrelease.add(temprelease2);
      } else {
        gtweekrelease.add(temprelease);
      }
    }
    for (var i = 1; i < globaltrendingweekjsonlistresult.length + 1; i++) {
      gtweekindex.add(i);
    }
  }

  Future<void> globaltrendingday() async {
    var response = await http.get(Uri.parse(globaltrendingdayurl));
    if (response.statusCode == 200) {
      var globaltrendingdayjsonlist = jsonDecode(response.body);
      globaltrendingdayjsonlistresult = globaltrendingdayjsonlist['results'];
      // print(globaltrendingdayjsonlistresult);
    } else {
      print(response.statusCode);
    }

    for (var i = 0; i < globaltrendingdayjsonlistresult.length; i++) {
      var tempname = globaltrendingdayjsonlistresult[i]['title'];
      var tempname2 = globaltrendingdayjsonlistresult[i]['name'];
      if (tempname == null) {
        gtdayname.add(tempname2);
      } else {
        gtdayname.add(tempname);
      }
      var tempposter = globaltrendingdayjsonlistresult[i]['poster_path'];
      gtdayposter.add("https://image.tmdb.org/t/p/original" + tempposter);
      var temprating = globaltrendingdayjsonlistresult[i]['vote_average'];
      gtdayrating.add(temprating);
      var temptype = globaltrendingdayjsonlistresult[i]['media_type'];
      gtdaytype.add(temptype);
      var temporglan = globaltrendingdayjsonlistresult[i]['original_language'];
      gtdayorglan.add(temporglan);
      var tempoverview = globaltrendingdayjsonlistresult[i]['overview'];
      gtdayoverview.add(tempoverview);
      var tempid = globaltrendingdayjsonlistresult[i]['id'];
      gtdayid.add(tempid);
      var temprelease = globaltrendingdayjsonlistresult[i]['release_date'];
      var temprelease2 = globaltrendingdayjsonlistresult[i]['first_air_date'];
      if (temprelease == null) {
        gtdayrelease.add(temprelease2);
      } else {
        gtdayrelease.add(temprelease);
      }
    }
    for (var i = 1; i < globaltrendingdayjsonlistresult.length + 1; i++) {
      gtdayindex.add(i);
    }
  }

  Future<void> globalpopular() async {
    var response = await http.get(Uri.parse(globalpopularmoviesurl));
    if (response.statusCode == 200) {
      var globalpopularjsonlist = jsonDecode(response.body);
      globalpopularmoviejsonlistresult = globalpopularjsonlist['results'];
      // print(globalpopularjsonlistresult);
    } else {
      print(response.statusCode);
    }

    for (var i = 0; i < globalpopularmoviejsonlistresult.length; i++) {
      var tempname = globalpopularmoviejsonlistresult[i]['title'];
      var tempname2 = globalpopularmoviejsonlistresult[i]['name'];
      if (tempname == null) {
        gpopname.add(tempname2);
      } else {
        gpopname.add(tempname);
      }
      var tempposter = globalpopularmoviejsonlistresult[i]['poster_path'];
      gpopposter.add("https://image.tmdb.org/t/p/original" + tempposter);
      var temprating = globalpopularmoviejsonlistresult[i]['vote_average'];
      gpoprating.add(temprating);

      gpoptype.add('movie');
      var temporglan = globalpopularmoviejsonlistresult[i]['original_language'];
      gpoporglan.add(temporglan);
      var tempoverview = globalpopularmoviejsonlistresult[i]['overview'];
      gpopoverview.add(tempoverview);
      var tempid = globalpopularmoviejsonlistresult[i]['id'];
      gpopid.add(tempid);
      var temprelease = globalpopularmoviejsonlistresult[i]['release_date'];
      var temprelease2 = globalpopularmoviejsonlistresult[i]['first_air_date'];
      if (temprelease == null) {
        gpoprelease.add(temprelease2);
      } else {
        gpoprelease.add(temprelease);
      }
    }
    for (var i = 1; i < globalpopularmoviejsonlistresult.length + 1; i++) {
      gpopindex.add(i);
    }
  }

  Future<void> globaltv() async {
    var response = await http.get(Uri.parse(globalpopulartvseriesurl));
    if (response.statusCode == 200) {
      var globaltvjsonlist = jsonDecode(response.body);
      globalpopulartvseriesjsonlistresult = globaltvjsonlist['results'];
      // print(globaltvjsonlistresult);
    } else {
      print(response.statusCode);
    }
    for (var i = 0; i < 20; i++) {
      if (globalpopulartvseriesjsonlistresult[i]['name'] != null) {
        gptvname.add(globalpopulartvseriesjsonlistresult[i]['name']);
      } else {
        gptvname.add('null');
      }
      if (globalpopulartvseriesjsonlistresult[i]['poster_path'] != null) {
        gptvposter.add("https://image.tmdb.org/t/p/original" +
            globalpopulartvseriesjsonlistresult[i]['poster_path']);
      } else {
        gptvposter.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      }
      if (globalpopulartvseriesjsonlistresult[i]['vote_average'] != null) {
        gptvrating.add(globalpopulartvseriesjsonlistresult[i]['vote_average']);
      } else {
        gptvrating.add('null');
      }
      if (globalpopulartvseriesjsonlistresult[i]['first_air_date'] != null) {
        gptvrelease
            .add(globalpopulartvseriesjsonlistresult[i]['first_air_date']);
      } else {
        gptvrelease.add('null');
      }
      gptvid.add(globalpopulartvseriesjsonlistresult[i]['id']);
      gptvtype.add('tv');
      gptvindex.add(i + 1);
    }
    // print(gptvid);
  }

  Future<void> globaltoprated() async {
    var response = await http.get(Uri.parse(globaltopratedmoviesurl));
    if (response.statusCode == 200) {
      var globaltopratedjsonlist = jsonDecode(response.body);
      globaltopratedmoviesjsonlistresult = globaltopratedjsonlist['results'];
      // print(globaltopratedjsonlistresult);
    } else {
      print(response.statusCode);
    }

    for (var i = 0; i < globaltopratedmoviesjsonlistresult.length; i++) {
      var tempname = globaltopratedmoviesjsonlistresult[i]['title'];
      var tempname2 = globaltopratedmoviesjsonlistresult[i]['name'];
      if (tempname == null) {
        gtrname.add(tempname2);
      } else {
        gtrname.add(tempname);
      }
      var tempposter = globaltopratedmoviesjsonlistresult[i]['poster_path'];
      gtrposter.add("https://image.tmdb.org/t/p/original" + tempposter);
      var temprating = globaltopratedmoviesjsonlistresult[i]['vote_average'];
      gtrrating.add(temprating);
      gtrtype.add('movie');
      var temporglan =
          globaltopratedmoviesjsonlistresult[i]['original_language'];
      gtrorglan.add(temporglan);
      var tempoverview = globaltopratedmoviesjsonlistresult[i]['overview'];
      gtroverview.add(tempoverview);
      var tempid = globaltopratedmoviesjsonlistresult[i]['id'];
      gtrid.add(tempid);
      var temprelease = globaltopratedmoviesjsonlistresult[i]['release_date'];
      var temprelease2 =
          globaltopratedmoviesjsonlistresult[i]['first_air_date'];
      if (temprelease == null) {
        gtrrelease.add(temprelease2);
      } else {
        gtrrelease.add(temprelease);
      }
    }
    for (var i = 1; i < globaltopratedmoviesjsonlistresult.length + 1; i++) {
      gtrindex.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 28, 19, 64),
          actions: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              // padding: EdgeInsets.only(left: 25, right: 25, top: 2, bottom: 5),
              height: 10,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 10,
                top: 10,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 18, 2, 24),
                    Color.fromARGB(255, 4, 21, 34),
                  ],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        movietext.text,
                      ),
                    ),
                  );
                },
                controller: movietext,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey.shade100,
                      letterSpacing: 1.35),
                ),
                cursorColor: Colors.blue,
                // autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.blue.shade300),
                  hintText: ' Search Movies Series Anime',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
          toolbarHeight: 60,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "       Explore Movies WebSeries....",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            background: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.75), BlendMode.darken),
                  // opacity: .8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        //
        //
        SliverList(
          delegate: SliverChildListDelegate(
            [
              futurebuilder(
                context,
                "Global Trending Weekly",
                globaltrendingweek,
                gtweekname,
                gtweekposter,
                gtweekrating,
                gtweekrelease,
                gtweekindex,
                gtweekid,
                gtweektype,
              ),
              futurebuilder(
                context,
                "Global Trending Today",
                globaltrendingday,
                gtdayname,
                gtdayposter,
                gtdayrating,
                gtdayrelease,
                gtdayindex,
                gtdayid,
                gtdaytype,
              ),
              futurebuilder(
                context,
                "Popular Movies",
                globalpopular,
                gpopname,
                gpopposter,
                gpoprating,
                gpoprelease,
                gpopindex,
                gpopid,
                gpoptype,
              ),
              futurebuilder(
                  context,
                  "Popular TV Series",
                  globaltv,
                  gptvname,
                  gptvposter,
                  gptvrating,
                  gptvrelease,
                  gptvindex,
                  gptvid,
                  gptvtype),
              futurebuilder(
                context,
                "Top Rated Movies",
                globaltoprated,
                gtrname,
                gtrposter,
                gtrrating,
                gtrrelease,
                gtrindex,
                gtrid,
                gtrtype,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
