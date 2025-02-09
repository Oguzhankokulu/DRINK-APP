import 'package:drink/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
    '/': (context) => IntroductionScreenPage(),
    '/home': (context) => HomeScreen(), // Define your HomeScreen widget
    },
  );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: AppBar(
          title: Text(
            'DRINK',
            style: GoogleFonts.caveatBrush(
              fontSize: 45.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    ),
    body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  SizedBox(height: 225),
                  Text('Welcome to the home screen!',textAlign: TextAlign.center, style: GoogleFonts.ubuntu(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      elevation: 15.0,
                      shadowColor: Colors.indigo,
                      side: BorderSide(color: const Color.fromARGB(255, 28, 13, 236), width: 5.0),
                    ),
                    child: Text('Let\'s Decide!', style: GoogleFonts.ubuntu(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.w700)),
                  ),
                ],
              );
            },
        ),
      ),
    ),
  );
  }
}