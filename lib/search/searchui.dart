import 'dart:convert';
import 'dart:async';
import 'package:r05moviefullapi/descriptionpage/descriptioncheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
// import 'dart:html';

class SearchScreen extends StatefulWidget {
  var anything;
  SearchScreen(this.anything, {super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var jsondata;
  var jsondata1;
  var jsondata2;
  var jsondata3;
  var jsondata4;

  List tittle = [];
  List poster_path = [];
  List backdrop_path = [];
  List language = [];
  List popularity = [];
  List vote_average = [];
  List release_date = [];
  List overview = [];
  List type = [];
  List id = [];
  List index = []; //start from 0
  List number = []; //start from 1

  Future<void> functionname() async {
    var url =
        'https://api.themoviedb.org/3/search/multi?api_key=d78e371a935bd40f2c8418704687ebd8&query=' +
            widget.anything.toString() +
            '&page=1';
    var url1 =
        'https://api.themoviedb.org/3/search/multi?api_key=d78e371a935bd40f2c8418704687ebd8&query=' +
            widget.anything.toString() +
            '&page=2';
    var url2 =
        'https://api.themoviedb.org/3/search/multi?api_key=d78e371a935bd40f2c8418704687ebd8&query=' +
            widget.anything.toString() +
            '&page=3';
    var url3 =
        'https://api.themoviedb.org/3/search/multi?api_key=d78e371a935bd40f2c8418704687ebd8&query=' +
            widget.anything.toString() +
            '&page=4';
    var url4 =
        'https://api.themoviedb.org/3/search/multi?api_key=d78e371a935bd40f2c8418704687ebd8&query=' +
            widget.anything.toString() +
            '&page=5';
    // var allmoviejsonurl =
    //     'https://drive.google.com/drive/u/0/folders/1kYTAZ3lai7-H_o4qGfPfWahaimJljRo9';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body);
      jsondata = temp['results'];
    } else {
      print('error');
    }
    var response1 = await http.get(Uri.parse(url1));
    if (response1.statusCode == 200) {
      var temp1 = jsonDecode(response1.body);
      jsondata1 = temp1['results'];
    } else {
      print('error');
    }
    var response2 = await http.get(Uri.parse(url2));
    if (response2.statusCode == 200) {
      var temp2 = jsonDecode(response2.body);
      jsondata2 = temp2['results'];
    } else {
      print('error');
    }
    // var response3 = await http.get(Uri.parse(url3));
    // if (response3.statusCode == 200) {
    //   var temp3 = jsonDecode(response3.body);
    //   jsondata3 = temp3['results'];
    // } else {
    //   print('error');
    // }
    // var response4 = await http.get(Uri.parse(url4));
    // if (response4.statusCode == 200) {
    //   var temp4 = jsonDecode(response4.body);
    //   jsondata4 = temp4['results'];
    // } else {
    //   print('error');
    // }

    if (jsondata.length == 0) {
      tittle.add('No Result Found for ' + widget.anything.toString());
      poster_path.add(
          'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      backdrop_path.add('');
      language.add('');
      popularity.add('');
      vote_average.add('');
      release_date.add('');
      overview.add('');
      type.add('');
      id.add('');
      index.add('');
      number.add('');
    } else {
      for (var i = 0; i < jsondata.length; i++) {
        if (jsondata[i]['title'] != null) {
          tittle.add(jsondata[i]['title']);
        } else {
          tittle.add(jsondata[i]['name']);
        }
        if (jsondata[i]['poster_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata[i]['poster_path']);
        } else if (jsondata[i]['profile_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata[i]['profile_path']);
        } else {
          poster_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }
        if (jsondata[i]['backdrop_path'] != null) {
          backdrop_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata[i]['backdrop_path']);
        } else {
          backdrop_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }

        if (jsondata[i]['original_language'] != null) {
          language.add(jsondata[i]['original_language']);
        } else if (jsondata[i]['known_for_department'] != null) {
          language.add(jsondata[i]['known_for_department']);
        } else {
          language.add('');
        }
        if (jsondata[i]['popularity'] != null) {
          popularity.add(jsondata[i]['popularity']);
        } else {
          popularity.add('Unknown');
        }

        if (jsondata[i]['vote_average'] != null) {
          vote_average.add(jsondata[i]['vote_average']);
        } else {
          vote_average.add('');
        }
        if (jsondata[i]['release_date'] != null) {
          release_date.add(jsondata[i]['release_date']);
        } else {
          release_date.add('');
        }
        if (jsondata[i]['overview'] != null) {
          overview.add(jsondata[i]['overview']);
        } else {
          overview.add('');
        }
        if (jsondata[i]['media_type'] != null) {
          type.add(jsondata[i]['media_type']);
        } else {
          type.add('Unknown');
        }
        if (jsondata[i]['id'] != null) {
          id.add(jsondata[i]['id']);
        } else {
          id.add('Unknown');
        }
      }
    }

    if (jsondata1.length == 0) {
      tittle.add('No Result Found for ' + widget.anything.toString());
      poster_path.add(
          'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      backdrop_path.add('');
      language.add('');
      popularity.add('');
      vote_average.add('');
      release_date.add('');
      overview.add('');
      type.add('');
      id.add('');
      index.add('');
      number.add('');
    } else {
      for (var i = 0; i < jsondata1.length; i++) {
        if (jsondata1[i]['title'] != null) {
          tittle.add(jsondata1[i]['title']);
        } else {
          tittle.add(jsondata1[i]['name']);
        }
        if (jsondata1[i]['poster_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata1[i]['poster_path']);
        } else if (jsondata1[i]['profile_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata1[i]['profile_path']);
        } else {
          poster_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }
        if (jsondata1[i]['backdrop_path'] != null) {
          backdrop_path.add('https://image.tmdb.org/t/p/w500' +
              jsondata1[i]['backdrop_path']);
        } else {
          backdrop_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }

        if (jsondata1[i]['original_language'] != null) {
          language.add(jsondata1[i]['original_language']);
        } else if (jsondata1[i]['known_for_department'] != null) {
          language.add(jsondata1[i]['known_for_department']);
        } else {
          language.add('');
        }
        if (jsondata1[i]['popularity'] != null) {
          popularity.add(jsondata1[i]['popularity']);
        } else {
          popularity.add('Unknown');
        }

        if (jsondata1[i]['vote_average'] != null) {
          vote_average.add(jsondata1[i]['vote_average']);
        } else {
          vote_average.add('');
        }
        if (jsondata1[i]['release_date'] != null) {
          release_date.add(jsondata1[i]['release_date']);
        } else {
          release_date.add('');
        }
        if (jsondata1[i]['overview'] != null) {
          overview.add(jsondata1[i]['overview']);
        } else {
          overview.add('');
        }
        if (jsondata1[i]['media_type'] != null) {
          type.add(jsondata1[i]['media_type']);
        } else {
          type.add('Unknown');
        }
        if (jsondata1[i]['id'] != null) {
          id.add(jsondata1[i]['id']);
        } else {
          id.add('Unknown');
        }
      }
    }

    if (jsondata2.length == 0) {
      tittle.add('No Result Found for ' + widget.anything.toString());
      poster_path.add(
          'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
      backdrop_path.add('');
      language.add('');
      popularity.add('');
      vote_average.add('');
      release_date.add('');
      overview.add('');
      type.add('');
      id.add('');
      index.add('');
      number.add('');
    } else {
      for (var i = 0; i < jsondata2.length; i++) {
        if (jsondata2[i]['title'] != null) {
          tittle.add(jsondata2[i]['title']);
        } else {
          tittle.add(jsondata2[i]['name']);
        }
        if (jsondata2[i]['poster_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata2[i]['poster_path']);
        } else if (jsondata2[i]['profile_path'] != null) {
          poster_path.add(
              'https://image.tmdb.org/t/p/w500' + jsondata2[i]['profile_path']);
        } else {
          poster_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }
        if (jsondata2[i]['backdrop_path'] != null) {
          backdrop_path.add('https://image.tmdb.org/t/p/w500' +
              jsondata2[i]['backdrop_path']);
        } else {
          backdrop_path.add(
              'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
        }

        if (jsondata2[i]['original_language'] != null) {
          language.add(jsondata2[i]['original_language']);
        } else if (jsondata2[i]['known_for_department'] != null) {
          language.add(jsondata2[i]['known_for_department']);
        } else {
          language.add('');
        }
        if (jsondata2[i]['popularity'] != null) {
          popularity.add(jsondata2[i]['popularity']);
        } else {
          popularity.add('Unknown');
        }

        if (jsondata2[i]['vote_average'] != null) {
          vote_average.add(jsondata2[i]['vote_average']);
        } else {
          vote_average.add('');
        }
        if (jsondata2[i]['release_date'] != null) {
          release_date.add(jsondata2[i]['release_date']);
        } else {
          release_date.add('');
        }
        if (jsondata2[i]['overview'] != null) {
          overview.add(jsondata2[i]['overview']);
        } else {
          overview.add('');
        }
        if (jsondata2[i]['media_type'] != null) {
          type.add(jsondata2[i]['media_type']);
        } else {
          type.add('Unknown');
        }
        if (jsondata2[i]['id'] != null) {
          id.add(jsondata2[i]['id']);
        } else {
          id.add('Unknown');
        }
      }
    }

    // if (jsondata3.length == 0) {
    //   tittle.add('No Result Found for ' + widget.anything.toString());
    //   poster_path.add(
    //       'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //   backdrop_path.add('');
    //   language.add('');
    //   popularity.add('');
    //   vote_average.add('');
    //   release_date.add('');
    //   overview.add('');
    //   type.add('');
    //   id.add('');
    //   index.add('');
    //   number.add('');
    // } else {
    //   for (var i = 0; i < jsondata3.length; i++) {
    //     if (jsondata3[i]['title'] != null) {
    //       tittle.add(jsondata3[i]['title']);
    //     } else if (jsondata3[i]['name'] != null) {
    //       tittle.add(jsondata3[i]['name']);
    //     } else {
    //       tittle.add('Unknown');
    //     }
    //     if (jsondata3[i]['poster_path'] != null) {
    //       poster_path.add(
    //           'https://image.tmdb.org/t/p/w500' + jsondata3[i]['poster_path']);
    //     } else if (jsondata3[i]['profile_path'] != null) {
    //       poster_path.add(
    //           'https://image.tmdb.org/t/p/w500' + jsondata3[i]['profile_path']);
    //     } else {
    //       poster_path.add(
    //           'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //     }
    //     if (jsondata3[i]['backdrop_path'] != null) {
    //       backdrop_path.add('https://image.tmdb.org/t/p/w500' +
    //           jsondata3[i]['backdrop_path']);
    //     } else {
    //       backdrop_path.add(
    //           'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //     }

    //     if (jsondata3[i]['original_language'] != null) {
    //       language.add(jsondata3[i]['original_language']);
    //     } else if (jsondata3[i]['known_for_department'] != null) {
    //       language.add(jsondata3[i]['known_for_department']);
    //     } else {
    //       language.add('');
    //     }
    //     if (jsondata3[i]['popularity'] != null) {
    //       popularity.add(jsondata3[i]['popularity']);
    //     } else {
    //       popularity.add('Unknown');
    //     }

    //     if (jsondata3[i]['vote_average'] != null) {
    //       vote_average.add(jsondata3[i]['vote_average']);
    //     } else {
    //       vote_average.add('');
    //     }
    //     if (jsondata3[i]['release_date'] != null) {
    //       release_date.add(jsondata3[i]['release_date']);
    //     } else {
    //       release_date.add('');
    //     }
    //     if (jsondata3[i]['overview'] != null) {
    //       overview.add(jsondata3[i]['overview']);
    //     } else {
    //       overview.add('');
    //     }
    //     if (jsondata3[i]['media_type'] != null) {
    //       type.add(jsondata3[i]['media_type']);
    //     } else {
    //       type.add('Unknown');
    //     }
    //     if (jsondata3[i]['id'] != null) {
    //       id.add(jsondata3[i]['id']);
    //     } else {
    //       id.add('Unknown');
    //     }
    //   }
    // }

    // if (jsondata4.length == 0) {
    //   tittle.add('No Result Found for ' + widget.anything.toString());
    //   poster_path.add(
    //       'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //   backdrop_path.add('');
    //   language.add('');
    //   popularity.add('');
    //   vote_average.add('');
    //   release_date.add('');
    //   overview.add('');
    //   type.add('');
    //   id.add('');
    //   index.add('');
    //   number.add('');
    // } else {
    //   for (var i = 0; i < jsondata4.length; i++) {
    //     if (jsondata4[i]['title'] != null) {
    //       tittle.add(jsondata4[i]['title']);
    //     } else {
    //       tittle.add(jsondata4[i]['name']);
    //     }
    //     if (jsondata4[i]['poster_path'] != null) {
    //       poster_path.add(
    //           'https://image.tmdb.org/t/p/w500' + jsondata4[i]['poster_path']);
    //     } else if (jsondata4[i]['profile_path'] != null) {
    //       poster_path.add(
    //           'https://image.tmdb.org/t/p/w500' + jsondata4[i]['profile_path']);
    //     } else {
    //       poster_path.add(
    //           'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //     }
    //     if (jsondata4[i]['backdrop_path'] != null) {
    //       backdrop_path.add('https://image.tmdb.org/t/p/w500' +
    //           jsondata4[i]['backdrop_path']);
    //     } else {
    //       backdrop_path.add(
    //           'https://media.istockphoto.com/id/1396039964/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg?b=1&s=170667a&w=0&k=20&c=hzLqz1qI7UtmGgCRRdGXghrNPE8zg8a0D6SgRQ8AiIA=');
    //     }

    //     if (jsondata4[i]['original_language'] != null) {
    //       language.add(jsondata4[i]['original_language']);
    //     } else if (jsondata4[i]['known_for_department'] != null) {
    //       language.add(jsondata4[i]['known_for_department']);
    //     } else {
    //       language.add('');
    //     }
    //     if (jsondata4[i]['popularity'] != null) {
    //       popularity.add(jsondata4[i]['popularity']);
    //     } else {
    //       popularity.add('Unknown');
    //     }

    //     if (jsondata4[i]['vote_average'] != null) {
    //       vote_average.add(jsondata4[i]['vote_average']);
    //     } else {
    //       vote_average.add('');
    //     }
    //     if (jsondata4[i]['release_date'] != null) {
    //       release_date.add(jsondata4[i]['release_date']);
    //     } else {
    //       release_date.add('');
    //     }
    //     if (jsondata4[i]['overview'] != null) {
    //       overview.add(jsondata4[i]['overview']);
    //     } else {
    //       overview.add('');
    //     }
    //     if (jsondata4[i]['media_type'] != null) {
    //       type.add(jsondata4[i]['media_type']);
    //     } else {
    //       type.add('Unknown');
    //     }
    //     if (jsondata4[i]['id'] != null) {
    //       id.add(jsondata4[i]['id']);
    //     } else {
    //       id.add('Unknown');
    //     }
    //   }
    // }

    for (var i = 1; i < 101; i++) {
      number.add(i);
    }

    // print(tittle);
    // print(poster_path);
    // print(backdrop_path);
    // print(language);
    // print(popularity);
    // print(vote_average);
    // print(release_date);
    // print(overview);
    // print(type);
    // print(id);
    // print(jsondata.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 14, 24),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 14, 24),
        title: Text("'" + widget.anything.toString() + "'" + ' Results'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
          future: functionname(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: tittle.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => descriptioncheckui(
                                      id[index],
                                      type[index],
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 27, 3, 36),
                            Color.fromARGB(255, 7, 32, 51),
                          ]),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 200,
                              // child: Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    number[index].toString() +
                                        '   ' +
                                        type[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                poster_path[index]),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                              // ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tittle[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    overview[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //language
                                      Text(
                                        language[index],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      //popularity
                                      Text(
                                        "Popularity :" +
                                            popularity[index].toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //realse date
                                      Text(
                                        release_date[index],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 30,
                                            ),
                                            Text(
                                              vote_average[index].toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
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
            }
          }),
    );
  }
}
