import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
  return IntroductionScreen(
    pages: [
    PageViewModel(
      title: "Welcome",
      body: "If you don't know what do you want to drink, we can help you!",
      image: Image.asset("assets/images/help.png",
      width: 200,  // Specify the width
      height: 200, // Specify the height
      fit: BoxFit.cover,),
      decoration: PageDecoration(
      pageColor: Color.fromARGB(220, 10, 232, 184),
      safeArea: 0.0,
      titleTextStyle: GoogleFonts.caveatBrush(fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w700),
      bodyTextStyle: GoogleFonts.ubuntu(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    ),
    PageViewModel(
      title: "Decide",
      body: "Decide what do you want in a drink and we will find it for you!",
      image: Image.asset("assets/images/decide.png",
      width: 200,  // Specify the width
      height: 200, // Specify the height
      fit: BoxFit.cover,),
      decoration: PageDecoration(
      pageColor: Color.fromARGB(220, 10, 232, 184),
      safeArea: 0.0,
      titleTextStyle: GoogleFonts.caveatBrush(fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w700),
      bodyTextStyle: GoogleFonts.ubuntu(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    ),
    PageViewModel(
      title: "Get Started",
      body: "Get started with our app now! Find what to drink!",
      image: Image.asset("assets/images/start.png",
      width: 200,  // Specify the width
      height: 200, // Specify the height
      fit: BoxFit.cover,),
      decoration: PageDecoration(
      pageColor: Color.fromARGB(220, 10, 232, 184),
      safeArea: 0.0,
      titleTextStyle: GoogleFonts.caveatBrush(fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w700),
      bodyTextStyle: GoogleFonts.ubuntu(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    ),
    ],
    onDone: () {
    // When done button is press
    Navigator.of(context).pushReplacementNamed('/home');
    },
    showSkipButton: false,
    showBackButton: true,
    back: const Icon(Icons.arrow_back),
    next: const Icon(Icons.arrow_forward),
    done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: Theme.of(context).colorScheme.secondary,
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
    ),
  ),
  );
  }
}