import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:r05moviefullapi/futurebuilder/futurebuilder.dart';
import 'package:r05moviefullapi/homeui.dart';
import 'package:r05moviefullapi/splash.dart';

class descriptionui extends StatefulWidget {
  var id;
  descriptionui(this.id, {super.key});

  @override
  State<descriptionui> createState() => _descriptionuiState();
}

class _descriptionuiState extends State<descriptionui> {
  var moviedetailjson;
  var moviegenerjson;

  var similarmoviesjsonresult;
  var recommendedmoviesjsonresult;

  List mgenere = [];
  List backdrop_path = [];
  List budget = [];
  List homepage = [];
  List imdb_id = [];
  List original_language = [];
  List original_title = [];
  List overview = [];
  List popularity = [];
  List poster_path = [];
  List release_date = [];
  List revenue = [];
  List runtime = [];
  List status = [];
  List tagline = [];
  List title = [];
  List vote_average = [];

  //similar movies
  List smoviename = [];
  List smovieposter = [];
  List smovierating = [];
  List smovierelease = [];
  List smovieid = [];
  List smovieindex = [];
  List smovietype = [];
  //recommended movies
  List rmoviename = [];
  List rmovieposter = [];
  List rmovierating = [];
  List rmovierelease = [];
  List rmovieid = [];
  List rmovieindex = [];
  List rmovietype = [];

  Future<void> getmoviedeatils() async {
    var url = 'https://api.themoviedb.org/3/movie/' +
        widget.id.toString() +
        '?api_key=d78e371a935bd40f2c8418704687ebd8';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      moviedetailjson = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    for (var i = 0; i < moviedetailjson['genres'].length; i++) {
      mgenere.add(moviedetailjson['genres'][i]['name']);
    }
    for (var i = moviedetailjson['genres'].length; i < 5; i++) {
      mgenere.add(' ');
    }
    for (var i = 0; i < 1; i++) {
      if (moviedetailjson['backdrop_path'] == null) {
        backdrop_path.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        backdrop_path.add('https://image.tmdb.org/t/p/w500' +
            moviedetailjson['backdrop_path']);
      }

      budget.add(moviedetailjson['budget']);
      homepage.add(moviedetailjson['homepage']);
      imdb_id.add(moviedetailjson['imdb_id']);
      original_language.add(moviedetailjson['original_language']);
      original_title.add(moviedetailjson['original_title']);
      overview.add(moviedetailjson['overview']);
      popularity.add(moviedetailjson['popularity']);
      poster_path.add(moviedetailjson['poster_path']);
      release_date.add(moviedetailjson['release_date']);
      revenue.add(moviedetailjson['revenue']);
      runtime.add(moviedetailjson['runtime']);
      status.add(moviedetailjson['status']);
      tagline.add(moviedetailjson['tagline']);
      title.add(moviedetailjson['title']);
      vote_average.add(moviedetailjson['vote_average']);
    }
  }

  Future<void> similarmovies() async {
    var similarmovieurl = 'https://api.themoviedb.org/3/movie/' +
        widget.id.toString() +
        '/similar?api_key=d78e371a935bd40f2c8418704687ebd8';
    var response = await http.get(Uri.parse(similarmovieurl));
    if (response.statusCode == 200) {
      var tempjsonresult = jsonDecode(response.body);
      similarmoviesjsonresult = tempjsonresult['results'];
    } else {
      print(response.statusCode);
    }
    for (var i = 0; i < similarmoviesjsonresult.length; i++) {
      smoviename.add(similarmoviesjsonresult[i]['title']);
      if (similarmoviesjsonresult[i]['poster_path'] == null) {
        smovieposter.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        smovieposter.add('https://image.tmdb.org/t/p/w500' +
            similarmoviesjsonresult[i]['poster_path']);
      }
      smovierating.add(similarmoviesjsonresult[i]['vote_average']);
      smovierelease.add(similarmoviesjsonresult[i]['release_date']);
      smovieid.add(similarmoviesjsonresult[i]['id']);
      smovietype.add('movie');
    }
    for (var i = 1; i < smovieid.length + 1; i++) {
      smovieindex.add(i);
    }
  }

  Future<void> recommendedmovies() async {
    var movierecomendurl = 'https://api.themoviedb.org/3/movie/' +
        widget.id.toString() +
        '/recommendations?api_key=d78e371a935bd40f2c8418704687ebd8';
    var response = await http.get(Uri.parse(movierecomendurl));
    if (response.statusCode == 200) {
      var tempjsonresult = jsonDecode(response.body);
      recommendedmoviesjsonresult = tempjsonresult['results'];
      // print(recommendedmoviesjsonresult);
    } else {
      print(response.statusCode);
    }

    for (var i = 0; i < recommendedmoviesjsonresult.length; i++) {
      rmoviename.add(recommendedmoviesjsonresult[i]['title']);
      if (recommendedmoviesjsonresult[i]['poster_path'] == null) {
        rmovieposter.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        rmovieposter.add('https://image.tmdb.org/t/p/w500' +
            recommendedmoviesjsonresult[i]['poster_path']);
      }
      rmovierating.add(recommendedmoviesjsonresult[i]['vote_average']);
      rmovierelease.add(recommendedmoviesjsonresult[i]['release_date']);
      rmovieid.add(recommendedmoviesjsonresult[i]['id']);
      if (recommendedmoviesjsonresult[i]['media_type'] == null) {
        rmovietype.add('null');
      } else {
        rmovietype.add(recommendedmoviesjsonresult[i]['media_type']);
      }
    }
    for (var i = recommendedmoviesjsonresult.length; i < 20; i++) {
      rmoviename.add('unknown');
      rmovieposter.add(
          'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      rmovierating.add('');
      rmovierelease.add('');
      rmovieid.add('');
      rmovietype.add('');
    }
    for (var i = 1; i < recommendedmoviesjsonresult.length + 1; i++) {
      rmovieindex.add(i);
    }
    for (var i = recommendedmoviesjsonresult.length + 1; i < 21; i++) {
      rmovieindex.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return futuredescription(
      getmoviedeatils,
      title,
      poster_path,
      backdrop_path,
      mgenere,
      overview,
      release_date,
      vote_average,
      runtime,
      budget,
      revenue,
      status,
      tagline,
      homepage,
      imdb_id,
      original_language,
      original_title,
      popularity,
      similarmovies,
      smoviename,
      smovieposter,
      smovierating,
      smovierelease,
      smovieid,
      smovieindex,
      smovietype,
      recommendedmovies,
      rmoviename,
      rmovieposter,
      rmovierating,
      rmovierelease,
      rmovieid,
      rmovieindex,
      rmovietype,
    );
  }
}

Widget futuredescription(
  functionname,
  moviename,
  poster_path,
  backdrop_path,
  genre,
  overview,
  release_date,
  vote_average,
  runtime,
  budget,
  revenue,
  status,
  tagline,
  homepage,
  imdb_id,
  original_language,
  original_title,
  popularity,
  functionsimilarmovies,
  smoviename,
  smovieposter,
  smovierating,
  smovierelease,
  smovieid,
  smovieindex,
  smovietype,
  functionrecommendedmovies,
  rmoviename,
  rmovieposter,
  rmovierating,
  rmovierelease,
  rmovieid,
  rmovieindex,
  rmovietype,
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
                    moviename[0],
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(fontSize: 22, letterSpacing: 1.5),
                    ),
                  ),
                  background: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 100),
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
                        image: NetworkImage(backdrop_path[0]),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    //
                    //
                    //
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                        ),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
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
                                  genre[0] + " " + genre[1],
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                ),
                                Text(
                                  genre[2] + " " + genre[3],
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
                                  release_date[0],
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 10),
                      child: Text(
                        "TAGLINE :" + " " + tagline[0],
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 1.25),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Overview",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        overview[0],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.25,
                              height: 1.5),
                        ),
                      ),
                    ),
                    //orginal language
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Original Language" + " : " + original_language[0],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    //
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Status" + " : " + status[0],
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
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Budget" + " : " + '\$' + budget[0].toString(),
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
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Revenue" + " : " + '\$' + revenue[0].toString(),
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
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Runtime" + " : " + runtime[0].toString() + " " + "min",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),

                    //popularity
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Popularity" + " : " + popularity[0].toString(),
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    //homepage
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Homepage" + " : " + homepage[0],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    //imdb id
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                      ),
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        child: Text(
                          "IMDB PAGE" +
                              " : " +
                              "https://www.imdb.com/title/" +
                              imdb_id[0],
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 27, 3, 36),
                          Color.fromARGB(255, 7, 32, 51),
                        ]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                      ),
                    ),

                    //
                    //
                    futurebuilder(
                      context,
                      "Similar Movies",
                      functionsimilarmovies,
                      smoviename,
                      smovieposter,
                      smovierating,
                      smovierelease,
                      smovieindex,
                      smovieid,
                      smovietype,
                    ),

                    futurebuilder(
                      context,
                      "Recommend Movies",
                      functionrecommendedmovies,
                      rmoviename,
                      rmovieposter,
                      rmovierating,
                      rmovierelease,
                      rmovieindex,
                      rmovieid,
                      rmovietype,
                    ),
                    //
                    //
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
