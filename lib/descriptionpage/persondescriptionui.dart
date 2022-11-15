import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:r05moviefullapi/splash.dart';
import 'package:http/http.dart' as http;

class persondescriptionui extends StatefulWidget {
  var id;
  persondescriptionui(this.id, {super.key});

  @override
  State<persondescriptionui> createState() => _persondescriptionuiState();
}

class _persondescriptionuiState extends State<persondescriptionui> {
  var persondata;
  List name = [];
  List profile_path = [];
  List place_of_birth = [];
  List birthday = [];
  List deathday = [];
  List known_for_department = [];
  List biography = [];

  Future<void> personuifunction() async {
    var url = 'https://api.themoviedb.org/3/person/' +
        widget.id.toString() +
        '?api_key=d78e371a935bd40f2c8418704687ebd8';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      persondata = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    for (var i = 0; i < 1; i++) {
      name.add(persondata['name']);
      if (persondata['profile_path'] == null) {
        profile_path.add(
            'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      } else {
        profile_path.add('https://image.tmdb.org/t/p/w500/' +
            persondata['profile_path'].toString());
      }
      if (persondata['place_of_birth'] == null) {
        place_of_birth.add('Place of birth Not Available');
      } else {
        place_of_birth.add(persondata['place_of_birth']);
      }
      if (persondata['birthday'] == null) {
        birthday.add('Birthday Date Not Available');
      } else {
        birthday.add(persondata['birthday']);
      }
      if (persondata['deathday'] == null) {
        deathday.add('');
      } else {
        deathday.add(" to " + persondata['deathday']);
      }
      if (persondata['known_for_department'] == null) {
        known_for_department.add('Known For Department Not Available');
      } else {
        known_for_department.add(persondata['known_for_department']);
      }
      if (persondata['biography'] == null) {
        biography.add('Biography Not Available');
      } else {
        biography.add(persondata['biography']);
      }
    }
    // print(persondata);
    print(name);
    print(profile_path);
    print(place_of_birth);
    print(birthday);
    print(deathday);
    print(known_for_department);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 14, 24),
      body: FutureBuilder(
        future: personuifunction(),
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

  // return Center(
  //           child: SizedBox(
  //             height: 80,
  //             width: 80,
  //             child: CircularProgressIndicator(
  //               color: Colors.white,
  //               backgroundColor: Colors.blue,
  //               strokeWidth: 5,
  //             ),
  //           ),
  //         );


          
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
                backgroundColor: Color.fromARGB(255, 1, 14, 24),
                pinned: true,
                centerTitle: true,
                title: Text(
                  name[0].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height / 2.5,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        image: NetworkImage(profile_path[0].toString()),
                        fit: BoxFit.fill,
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
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              name[0].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              place_of_birth[0].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              birthday[0].toString() + deathday[0].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              known_for_department[0].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              biography[0].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
}
