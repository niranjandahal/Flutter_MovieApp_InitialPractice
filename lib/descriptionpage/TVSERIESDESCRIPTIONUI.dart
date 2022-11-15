import 'dart:convert';
import 'dart:math';
import 'package:r05moviefullapi/main.dart';
import 'package:r05moviefullapi/splash.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:r05moviefullapi/futurebuilder/futurebuilder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:r05moviefullapi/descriptionpage/descriptioncheck.dart';

class tvseriesdescriptionui extends StatefulWidget {
  var tvid;
  tvseriesdescriptionui(this.tvid, {super.key});

  @override
  State<tvseriesdescriptionui> createState() => _tvseriesdescriptionuiState();
}

class _tvseriesdescriptionuiState extends State<tvseriesdescriptionui> {
  var tvserriesresultjson;
  List nos = [];
  List allsesindex = [];
  var genresjson;
  var seasonjson;

  List genres = [];

  List name = [''];
  List backdrop_path = [''];
  List createdbyname = [''];
  List createdbyprofile_path = [''];
  List inproduction = [''];
  List firstairdate = [''];
  List lastairdate = [''];
  List lastepisodename = [''];
  List lastepisodeairdate = [''];
  List lastepisodenameoverview = [''];
  List lastepisodeoverview = [''];
  List lastepisodestill_path = [''];
  List lastepisodevote_average = [''];
  List numberofepisodes = [''];
  List numberofseasons = [''];
  List orginal_name = [''];
  List overview = [''];
  List popularity = [''];
  List status = [''];
  List tagline = [''];
  List vote_average = [''];

  List allseasonsname = [];
  List allseasonsairdate = [];
  List allseasonsepisodecount = [];
  List allseasonsposter_path = [];
  List allseasonsposter_path1 = [];
  List allseasonsseason_index = [];

  var similarseriesjson;
  List sname = [];
  List sposter = [];
  List srating = [];
  List srelease = [];
  List sindex = [];
  List sid = [];
  List stype = [];

  var recommendseriesjson;
  List rname = [];
  List rposter = [];
  List rrating = [];
  List rrelease = [];
  List rindex = [];
  List rid = [];
  List rtype = [];

  Future<void> tvseriesdescription() async {
    var url = 'https://api.themoviedb.org/3/tv/' +
        widget.tvid.toString() +
        '?api_key=d78e371a935bd40f2c8418704687ebd8';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      tvserriesresultjson = jsonDecode(response.body);
      genresjson = tvserriesresultjson['genres'];
      seasonjson = tvserriesresultjson['seasons'];
    } else {
      print(response.statusCode);
    }

    if (tvserriesresultjson.length == 0) {}

    for (var i = 0; i < 1; i++) {
      name[i] = tvserriesresultjson['name'];
      if (tvserriesresultjson['backdrop_path'] == null) {
        backdrop_path[i] =
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=';
      } else {
        backdrop_path[i] = "https://image.tmdb.org/t/p/w500" +
            tvserriesresultjson['backdrop_path'];
      }

      createdbyname[i] = tvserriesresultjson['created_by'];
      createdbyprofile_path[i] = tvserriesresultjson['created_by'];
      inproduction[i] = tvserriesresultjson['in_production'];
      firstairdate[i] = tvserriesresultjson['first_air_date'];
      lastairdate[i] = tvserriesresultjson['last_air_date'];
      lastepisodename[i] = tvserriesresultjson['last_episode_to_air']['name'];
      lastepisodeairdate[i] =
          tvserriesresultjson['last_episode_to_air']['air_date'];
      lastepisodenameoverview[i] =
          tvserriesresultjson['last_episode_to_air']['episode_number'];
      lastepisodeoverview[i] =
          tvserriesresultjson['last_episode_to_air']['overview'];
      if (tvserriesresultjson['last_episode_to_air']['still_path'] == null) {
        lastepisodestill_path[i] =
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=';
      } else {
        lastepisodestill_path[i] = "https://image.tmdb.org/t/p/w500" +
            tvserriesresultjson['last_episode_to_air']['still_path'];
      }

      lastepisodevote_average[i] =
          tvserriesresultjson['last_episode_to_air']['vote_average'];
      numberofepisodes[i] = tvserriesresultjson['number_of_episodes'];
      numberofseasons[i] = tvserriesresultjson['number_of_seasons'] + 1;
      orginal_name[i] = tvserriesresultjson['original_name'];
      overview[i] = tvserriesresultjson['overview'];
      popularity[i] = tvserriesresultjson['popularity'];
      status[i] = tvserriesresultjson['status'];
      tagline[i] = tvserriesresultjson['tagline'];
      vote_average[i] = tvserriesresultjson['vote_average'];
    }
    for (var i = 0; i < genresjson.length; i++) {
      genres.add(genresjson[i]['name']);
    }
    for (var i = genresjson.length; i < 4; i++) {
      genres.add('');
    }
    for (var i = 0; i < seasonjson.length; i++) {
      allseasonsname.add(seasonjson[i]['name']);
      allseasonsairdate.add(seasonjson[i]['air_date']);
      allseasonsepisodecount.add(seasonjson[i]['episode_count']);
      if (seasonjson[i]['poster_path'] == null) {
        allseasonsposter_path.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        allseasonsposter_path.add(
            "https://image.tmdb.org/t/p/w500/" + seasonjson[i]['poster_path']);
      }
      if (seasonjson[i]['backdrop_path'] == null) {
        allseasonsposter_path1.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        allseasonsposter_path1.add(
            "https://image.tmdb.org/t/p/w500/" + seasonjson[i]['poster_path']);
      }

      allseasonsseason_index.add(i);
    }
    for (var i = 1; i < seasonjson.length + 1; i++) {
      allsesindex.add(i);
    }
    // print(allsesindex);
    // print(allseasonsname);
    // print(allseasonsairdate);
    // print(allseasonsepisodecount);
    // print(allseasonsseason_index);
  }

  Future<void> similarseries() async {
    var url = 'https://api.themoviedb.org/3/tv/' +
        widget.tvid.toString() +
        '/similar?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      similarseriesjson = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }

    for (var i = 0; i < similarseriesjson['results'].length; i++) {
      sname.add(similarseriesjson['results'][i]['name']);
      if (similarseriesjson['results'][i]['poster_path'] == null) {
        sposter.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        sposter.add("https://image.tmdb.org/t/p/w500" +
            similarseriesjson['results'][i]['poster_path']);
      }

      srating.add(similarseriesjson['results'][i]['vote_average']);
      srelease.add(similarseriesjson['results'][i]['first_air_date']);

      stype.add('tv');
      sid.add(similarseriesjson['results'][i]['id']);
    }
    for (var i = 1; i < similarseriesjson['results'].length + 1; i++) {
      sindex.add(i);
    }
    print(sindex);
    print(widget.tvid);
  }

  Future<void> recommendedseries() async {
    var url = 'https://api.themoviedb.org/3/tv/' +
        widget.tvid.toString() +
        '/recommendations?api_key=d78e371a935bd40f2c8418704687ebd8&page=1';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      recommendseriesjson = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }

    if (recommendseriesjson['results'].length == 0) {
      for (var i = 0; i < 20; i++) {
        rname.add('No Recommendations');
        rposter.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        rrelease.add('No Recommendations');
        rrating.add('No Recommendations');
      }
    } else {
      for (var i = 0; i < recommendseriesjson['results'].length; i++) {
        if (recommendseriesjson['results'][i]['name'] == null) {
          rname.add('unknown');
        } else {
          rname.add(recommendseriesjson['results'][i]['name']);
        }

        if (recommendseriesjson['results'][i]['poster_path'] == null) {
          rposter.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        } else {
          rposter.add("https://image.tmdb.org/t/p/w500" +
              recommendseriesjson['results'][i]['poster_path']);
        }
        if (recommendseriesjson['results'][i]['vote_average'] == null) {
          rrating.add('unknown');
        } else {
          rrating.add(recommendseriesjson['results'][i]['vote_average']);
        }

        if (recommendseriesjson['results'][i]['first_air_date'] == null) {
          rrelease.add('unknown');
        } else {
          rrelease.add(recommendseriesjson['results'][i]['first_air_date']);
        }

        rid.add(recommendseriesjson['results'][i]['id']);
        rtype.add('tv');
      }
    }

    for (var i = 1; i < recommendseriesjson['results'].length + 1; i++) {
      rindex.add(i);
    }
    for (var i = recommendseriesjson['results'].length + 1; i < 21; i++) {
      rindex.add(i);
    }
    print(rindex);
  }

  @override
  Widget build(BuildContext context) {
    return futuretvdescription(
      tvseriesdescription,
      name,
      backdrop_path,
      genres,
      createdbyname,
      createdbyprofile_path,
      inproduction,
      firstairdate,
      lastairdate,
      lastepisodename,
      lastepisodeairdate,
      lastepisodenameoverview,
      lastepisodeoverview,
      lastepisodestill_path,
      lastepisodevote_average,
      numberofepisodes,
      numberofseasons,
      orginal_name,
      overview,
      popularity,
      status,
      tagline,
      vote_average,
      allseasonsname,
      allseasonsairdate,
      allseasonsepisodecount,
      allseasonsposter_path,
      allseasonsposter_path1,
      allseasonsseason_index,
      allsesindex,
      nos,
      similarseries,
      sname,
      sposter,
      srating,
      srelease,
      sid,
      stype,
      sindex,
      recommendedseries,
      rname,
      rposter,
      rrating,
      rrelease,
      rid,
      rtype,
      rindex,
    );
  }
}

Widget futuretvdescription(
  functionname,
  name,
  poster_path,
  genres,
  createdbyname,
  createdbyprofile_path,
  inproduction,
  firstairdate,
  lastairdate,
  lastepisodename,
  lastepisodeairdate,
  lastepisodenameoverview,
  lastepisodeoverview,
  lastepisodestill_path,
  lastepisodevote_average,
  numberofepisodes,
  numberofseasons,
  orginal_name,
  overview,
  popularity,
  status,
  tagline,
  vote_average,
  allseasonsname,
  allseasonsairdate,
  allseasonsepisodecount,
  allseasonsposter_path,
  allseasonsposter_path1,
  allseasonsseason_index,
  allsesindex,
  nos,
  similarseries,
  sname,
  sposter,
  srating,
  srelease,
  sid,
  stype,
  sindex,
  recommendedseries,
  rname,
  rposter,
  rrating,
  rrelease,
  rid,
  rtype,
  rindex,
) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 1, 14, 24),
    body: FutureBuilder(
      future: functionname(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.blue,
                strokeWidth: 5,
              ),
            ),
          );
        } else {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => splashscreen(),
                        ),
                      );
                      //
                    },
                  ),
                ],
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Color.fromARGB(255, 1, 14, 24),
                pinned: true,
                toolbarHeight: 50,
                expandedHeight: MediaQuery.of(context).size.height / 2.7,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    name[0],
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(fontSize: 22, letterSpacing: 1.5),
                    ),
                  ),
                  background: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: IconButton(
                            alignment: Alignment.bottomCenter,
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(poster_path[0].toString()),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Genre",
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                                Text(
                                  genres[0].toString() + genres[1].toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                ),
                                Text(
                                  genres[2].toString() + genres[3].toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Release Date",
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                                Text(
                                  firstairdate[0].toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.star_rate_sharp,
                                      color: Colors.amber,
                                      size: 30,
                                    )),
                                Text(
                                  vote_average[0].toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    //
                    //
                    //
                    Container(
                      padding: EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 27, 3, 36),
                                Color.fromARGB(255, 7, 32, 51),
                              ]),
                            ),
                            margin: EdgeInsets.only(top: 5),
                            alignment: Alignment.center,
                            child: Text(
                              "Latest Seasons " +
                                  numberofseasons[0].toString() +
                                  " Details",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 27, 3, 36),
                                Color.fromARGB(255, 7, 32, 51),
                              ]),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              lastepisodename[0].toString() +
                                  " " +
                                  lastepisodenameoverview[0].toString() +
                                  " Episode",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width * 0.85,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(lastepisodestill_path[0]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                firstairdate[0].toString() +
                                    " to " +
                                    lastairdate[0].toString(),
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 1.5),
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.star_rate_sharp,
                                      color: Colors.amber),
                                  Text(
                                    lastepisodevote_average[0].toString(),
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //lastest episode overview
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 27, 3, 36),
                                Color.fromARGB(255, 7, 32, 51),
                              ]),
                            ),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "LATEST EPISODE OVERVIEW : " +
                                  lastepisodeoverview[0].toString() +
                                  "",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    //
                    //
                    //lastest season episode finished
                    //overal overview
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 27, 3, 36),
                                Color.fromARGB(255, 7, 32, 51),
                              ]),
                            ),
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "OVERALL OVERVIEW : " + overview[0].toString(),
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),

                          //popularity
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "OVERALL POPULARITY : " +
                                  popularity[0].toString() +
                                  "        ",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),
                          //status
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "STATUS : " + status[0].toString() + "        ",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),
                          //tagline
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "TAGLINE : " + tagline[0].toString() + "        ",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 27, 3, 36),
                                Color.fromARGB(255, 7, 32, 51),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 41, 6, 54),
                          Color.fromARGB(255, 11, 44, 70),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "All Seasons Details",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 41, 6, 54),
                          Color.fromARGB(255, 11, 44, 70),
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
                        //
                        //
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(milliseconds: 1200),
                          height: 240.0,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.5,
                        ),
                        items: allseasonsseason_index.map<Widget>((j) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                // width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        allseasonsposter_path[j].toString()),
                                    fit: BoxFit.fill,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.darken),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            allseasonsname[j].toString(),
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                        ),

                                        //status
                                        Container(
                                          child: Text(
                                            allseasonsepisodecount[j]
                                                    .toString() +
                                                "  Episodes",
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            allseasonsairdate[j].toString() +
                                                "  ",
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                    //tagline
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                        //
                        //
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    futurebuilder(
                      context,
                      "Similar Series",
                      similarseries,
                      sname,
                      sposter,
                      srating,
                      srelease,
                      sindex,
                      sid,
                      stype,
                    ),
                    Container(
                      height: 10,
                    ),
                    futurebuilder(
                      context,
                      "Recommended Series",
                      recommendedseries,
                      rname,
                      rposter,
                      rrating,
                      rrelease,
                      rindex,
                      rid,
                      rtype,
                    ),
                    Container(
                      height: 20,
                      child: Text(
                        "Created By Niranjan",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    ),
  );
}
