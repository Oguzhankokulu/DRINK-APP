import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_screen.dart';
import 'main.dart'; // Import the main.dart file to navigate back to the home screen

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  
  // Store the user's answers to dynamically shape the questions
  final List<String> answers = [];

  // Define the list of questions with conditions
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Do you want a cold or hot drink?',
      'options': [
        {'text': 'Cold', 'image': 'assets/images/cold_drink.png', 'value': 'cold'},
        {'text': 'Hot', 'image': 'assets/images/hot_drink.png', 'value': 'hot'},
      ],
      'condition': null, // No condition for the first question
    },
    {
      'question': 'Do you want tea or coffee?',
      'options': [
        {'text': 'Tea', 'image': 'assets/images/tea.png', 'value': 'tea'},
        {'text': 'Coffee', 'image': 'assets/images/coffee.png', 'value': 'coffee'},
      ],
      'condition': 'hot', // Show this question only if the answer is 'hot'
    },
    {
      'question': 'Do you want a fruity or a creamy cold drink?',
      'options': [
        {'text': 'Fruity', 'image': 'assets/images/fruity.png', 'value': 'fruity'},
        {'text': 'Creamy', 'image': 'assets/images/creamy.png', 'value': 'creamy'},
      ],
      'condition': 'cold', // Show this question only if the answer is 'cold'
    },
  ];

  // Filter the questions based on the user's previous answers
  List<Map<String, dynamic>> getFilteredQuestions() {
    List<Map<String, dynamic>> filteredQuestions = [];
    
    for (var question in questions) {
      // If the question has no condition or the condition matches the user's answer
      if (question['condition'] == null || answers.contains(question['condition'])) {
        filteredQuestions.add(question);
      }
    }
    
    return filteredQuestions;
  }

  // Move to the next question
  void nextQuestion(String answer) {
    setState(() {
      answers.add(answer); // Store the user's answer
      List<Map<String, dynamic>> filteredQuestions = getFilteredQuestions();
      
      // Update the current question index based on the filtered questions
      if (currentQuestionIndex < filteredQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        // All questions are answered, show the result screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(answers: answers),
          ),
        );
      }
    });
  }

  // Go back to the previous question
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        answers.removeLast();
        currentQuestionIndex--;
      });
    }
  }

  // Return to the home screen
  void returnHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredQuestions = getFilteredQuestions();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Text(
              filteredQuestions[currentQuestionIndex]['question'],
              style: GoogleFonts.ubuntu(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: filteredQuestions[currentQuestionIndex]['options']
                    .map<Widget>((option) {
                  return GestureDetector(
                    onTap: () => nextQuestion(option['value']),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 20),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            option['image'],
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            option['text'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            if (currentQuestionIndex > 0)
              ElevatedButton.icon(
                onPressed: previousQuestion,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  elevation: 10,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: returnHome,
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
    );
  }
}
