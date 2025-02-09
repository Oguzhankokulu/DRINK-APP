import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_screen.dart';
import 'main.dart'; // Import the main.dart file to navigate back to the home screen

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

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
        {'text': 'Cold', 'image': 'assets/images/ice-cubes.png', 'value': 'cold'},
        {'text': 'Hot', 'image': 'assets/images/hot.png', 'value': 'hot'},
      ],
      'condition': null, // No condition for the first question
    },
    {
      'question': 'Do you want a Coffee?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/yes.png', 'value': 'coffee'},
        {'text': 'NO', 'image': 'assets/images/no.png', 'value': 'not-coffee'},
      ],
      'condition': ['hot'], // Show this question only if the answer is 'hot'
    },
    {
      'question': 'Do you want a sweet drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/yes.png', 'value': 'sweet'},
        {'text': 'NO', 'image': 'assets/images/no.png', 'value': 'not-sweet'},
      ],
      'condition': null,
    },
    {
      'question': 'Do you want chocolate or caramel in your drink? (others aren\'t eliminated)',
      'options': [
        {'text': 'Chocolate', 'image': 'assets/images/chocolate.png', 'value': 'non-caramel'},
        {'text': 'Caramel', 'image': 'assets/images/caramel.png', 'value': 'non-chocolate'},
      ],
      'condition': ['hot','coffee','sweet'], 
    },
    {
      'question': 'Do you want milk in your drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/milk.png', 'value': 'milk'},
        {'text': 'NO', 'image': 'assets/images/glass-bottle.png', 'value': 'no-milk'},
      ],
      'condition': ['hot','not-coffee','sweet'],
    },
    {
      'question': 'Do you want milk in your drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/milk.png', 'value': 'milk'},
        {'text': 'NO', 'image': 'assets/images/glass-bottle.png', 'value': 'no-milk'},
      ],
      'condition': ['hot','coffee','not-sweet'],
    },
    {
      'question': 'Do you want a strong or a light drink?',
      'options': [
        {'text': 'Strong', 'image': 'assets/images/strong.png', 'value': 'strong'},
        {'text': 'Light', 'image': 'assets/images/soft.png', 'value': 'soft'},
      ],
      'condition': ['hot','coffee','not-sweet'],
    },
    {
      'question': 'Do you want aromatic drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/yes.png', 'value': 'aromatic'},
        {'text': 'NO', 'image': 'assets/images/no.png', 'value': 'not-aromatic'},
      ],
      'condition': ['hot','not-coffee','not-sweet'],
    },
    {
      'question': 'Do you want coffee in your drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/yes.png', 'value': 'coffee'},
        {'text': 'NO', 'image': 'assets/images/no.png', 'value': 'not-coffee'},
      ],
      'condition': ['cold','not-sweet'], // Show this question only if the answer is 'cold' and 'sweet'
    },
    {
      'question': 'Do you want milk in your drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/milk.png', 'value': 'milk'},
        {'text': 'NO', 'image': 'assets/images/glass-bottle.png', 'value': 'no-milk'},
      ],
      'condition': ['cold','not-sweet','coffee'], // Show this question only if the answer is 'cold' and 'sweet'
    },
    {
      'question': 'Do you want creamy or fruity drink?',
      'options': [
        {'text': 'Creamy', 'image': 'assets/images/creamy.png', 'value': 'creamy'},
        {'text': 'Fruity', 'image': 'assets/images/fruity.png', 'value': 'fruity'},
      ],
      'condition': ['cold','sweet'], // Show this question only if the answer is 'fruity'
    },
    {
      'question': 'Do you want soda or juice?',
      'options': [
        {'text': 'Soda', 'image': 'assets/images/soda.png', 'value': 'soda'},
        {'text': 'Juice', 'image': 'assets/images/juice.png', 'value': 'juice'},
      ],
      'condition': ['cold','sweet','fruity'], // Show this question only if the answer is 'cold' and 'sweet'
    },
    {
      'question': 'Do you want coffee in your drink?',
      'options': [
        {'text': 'YES', 'image': 'assets/images/yes.png', 'value': 'coffee'},
        {'text': 'NO', 'image': 'assets/images/no.png', 'value': 'not-coffee'},
      ],
      'condition': ['cold','sweet','creamy'], // Show this question only if the answer is 'creamy'
    },
    {
      'question': 'Do you want chocolate or caramel in your drink? (others aren\'t eliminated)',
      'options': [
        {'text': 'Chocolate', 'image': 'assets/images/chocolate.png', 'value': 'non-caramel'},
        {'text': 'Caramel', 'image': 'assets/images/caramel.png', 'value': 'non-chocolate'},
      ],
      'condition': ['cold','sweet','creamy','coffee'],
    },
  ];

 List<Map<String, dynamic>> getFilteredQuestions() {
  List<Map<String, dynamic>> filteredQuestions = [];
  
  for (var question in questions) {
    // If the question has no condition, always include it
    if (question['condition'] == null) {
      filteredQuestions.add(question);
    } else {
      List<String> conditionList = List<String>.from(question['condition']);
      
      // Check if all conditions are met (AND logic)
      bool allConditionsMet = conditionList.every((condition) => answers.contains(condition));
      
      if (allConditionsMet) {
        filteredQuestions.add(question);
      }
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
            const SizedBox(height: 230),
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
