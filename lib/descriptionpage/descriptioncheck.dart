import 'package:flutter/material.dart';
import 'package:r05moviefullapi/descriptionpage/MOVIESDESCRIPTIONUI.dart';
import 'package:r05moviefullapi/descriptionpage/TVSERIESDESCRIPTIONUI.dart';
import 'package:r05moviefullapi/descriptionpage/persondescriptionui.dart';
// import 'dart:html';
import 'package:r05moviefullapi/splash.dart';

class descriptioncheckui extends StatefulWidget {
  var id;
  var type;
  descriptioncheckui(this.id, this.type);

  @override
  State<descriptioncheckui> createState() => _descriptioncheckuiState();
}

class _descriptioncheckuiState extends State<descriptioncheckui> {
  checktype() {
    if (widget.type == 'movie') {
      return descriptionui(widget.id);
    } else if (widget.type == 'tv') {
      return tvseriesdescriptionui(widget.id);
    } else if (widget.type == 'person') {
      return persondescriptionui(widget.id);
    } else {
      return errorui(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: checktype(),
    );
  }
}

Widget errorui(context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
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
    ),
    body: Center(
      child: Text('No Enough data for this'),
    ),
  );
}

class deschkui extends StatefulWidget {
  const deschkui({super.key});

  @override
  State<deschkui> createState() => _deschkuiState();
}

class _deschkuiState extends State<deschkui> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
