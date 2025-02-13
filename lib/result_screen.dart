import 'dart:math';
import 'package:drink/models/drink.dart';
import 'package:drink/services/drink_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart'; // Import the main.dart file to navigate back to the home screen

class ResultScreen extends StatefulWidget {
  final List<String> answers;

  const ResultScreen({super.key, required this.answers});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late List<Drink> filteredDrinks;
  late Drink currentDrink;
  bool isLoading = false;  // Track loading state

  @override
  void initState() {
    super.initState();
    // Filter the drinks based on the user's answers
    filteredDrinks = filterDrinksByAttributes(widget.answers);
    if (filteredDrinks.isNotEmpty) {
      // Choose a random drink from the filtered list
      currentDrink = filteredDrinks[Random().nextInt(filteredDrinks.length)];
      filteredDrinks.remove(currentDrink);  // Remove the chosen drink to prevent repetition
    }
  }

  void returnHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void getRandomDrink() {
    setState(() {
      isLoading = true;  // Start loading
    });

    // Simulate loading by introducing a delay (e.g., network call)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (filteredDrinks.isNotEmpty) {
          // Choose a new random drink from the filtered list
          currentDrink = filteredDrinks[Random().nextInt(filteredDrinks.length)];
          filteredDrinks.remove(currentDrink);  // Remove the chosen drink to prevent repetition
        }

        isLoading = false;  // End loading
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your choices:',
                style: GoogleFonts.ubuntu(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                widget.answers.join(', '),
                style: GoogleFonts.ubuntu(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Display the random drink image inside a CircleAvatar
              CircleAvatar(
                radius: 120, // Set the size of the avatar
                backgroundImage: AssetImage(currentDrink.image), // Set the image
                backgroundColor: Colors.transparent, // Transparent background
              ),
              const SizedBox(height: 20),
              Text(
                currentDrink.name,
                style: GoogleFonts.ubuntu(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              // Only show the "Give Me Another One" button if there are recommendations left
              if (filteredDrinks.isNotEmpty)
                ElevatedButton(
                  onPressed: isLoading ? null : getRandomDrink,  // Disable button while loading
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                    elevation: 10,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator()  // Show loading indicator
                      : const Text('Give Me Another One'),
                ),
              const SizedBox(height: 20),
              // Button to return to home screen
              ElevatedButton.icon(
                onPressed: () => returnHome(context),
                icon: const Icon(Icons.home),
                label: const Text('Return Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
