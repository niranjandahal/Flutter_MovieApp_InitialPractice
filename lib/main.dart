// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:r05moviefullapi/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
// import 'dart:html';

void main() {
  runApp(const movieapp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

//fist the HomeUi is called

//then the futurebuilder is called
//then the carouselsliderui is called
//then the descriptioncheckui is called which check the type of the movie and then call the respective description ui
//then either the movie description ui or the tv series description ui is called
//then again future builder is called and loop continues

class movieapp extends StatefulWidget {
  const movieapp({super.key});

  @override
  State<movieapp> createState() => _movieappState();
}

class _movieappState extends State<movieapp> {
  String text = 'Explore';
  String text1 = 'Search';
  double rwidth = 270;
  double rheight = 60;
  Color rcolor = Colors.blue;
  Color scaff_color = Colors.white;
  BorderRadiusGeometry rborderRadius = BorderRadius.circular(20);

  double _width = 85;
  double _height = 85;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(85);
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: intermediatescreen(),
      ),
    );
  }
}

class intermediatescreen extends StatefulWidget {
  const intermediatescreen({super.key});

  @override
  State<intermediatescreen> createState() => _intermediatescreenState();
}

class _intermediatescreenState extends State<intermediatescreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // disableNavigation: true,
      backgroundColor: Color.fromARGB(255, 1, 14, 24),
      duration: 2000,
      nextScreen: splashscreen(),
      splash: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  'By Niranjan dahal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // splash: Image.asset('assets/images/background.jpg'),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
      centered: true,
    );
  }
}


class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}