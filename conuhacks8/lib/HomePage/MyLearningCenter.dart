import 'package:flutter/material.dart';
import 'BottomNav.dart';

class MyLearningCenter extends StatefulWidget {
  const MyLearningCenter({super.key});

  @override
  _MyLearningCenterState createState() => _MyLearningCenterState();
}

class _MyLearningCenterState extends State<MyLearningCenter> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is inflation?',
      'answers': [
        {
          'text':
              'Increase in prices and fall in the purchasing value of money',
          'isCorrect': true
        },
        {
          'text':
              'Decrease in prices and rise in the purchasing value of money',
          'isCorrect': false
        },
        {'text': 'A term used in biology', 'isCorrect': false},
      ],
    },
    {
      'question': 'What is the impact of inflation on mortgages??',
      'answers': [
        {
          'text': 'Reduces the principal amount of mortgages',
          'isCorrect': false
        },
        {
          'text': 'Increases the real cost of future mortgage payments',
          'isCorrect': true
        },
        {
          'text': 'No impact, as mortgage rates are independent of inflation',
          'isCorrect': false
        },
      ],
    },
    {
      'question': 'What is the impact of inflation on retirement plans?',
      'answers': [
        {
          'text': 'Increases the value of retirement savings',
          'isCorrect': false
        },
        {
          'text':
              'Decreases the purchasing power of fixed-income retirement benefits',
          'isCorrect': true
        },
        {'text': 'Stops the need for retirement savings', 'isCorrect': false},
      ],
    },
    {
      'question': 'How can we protect ourselves from inflation??',
      'answers': [
        {'text': 'Keeping all savings in physical cash', 'isCorrect': false},
        {'text': 'Avoiding any form of investment', 'isCorrect': false},
        {
          'text':
              'Investing in assets that typically increase in value at a rate higher than inflation, like stocks or real estate',
          'isCorrect': true
        }
      ],
    }
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Learning Center',
          style: TextStyle(
            fontFamily: 'YesevaOne', // Font family as declared in pubspec.yaml
            fontSize: 30, // Adjust the font size as needed
            color: Color.fromARGB(255, 0, 26, 156),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 215, 67),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 241, 113),
              Color.fromARGB(255, 99, 164, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _currentQuestionIndex < _questions.length
            ? _buildQuizQuestion(_questions[_currentQuestionIndex])
            : Center(
                child: Text(
                  'Your score: $_score/${_questions.length}',
                  style: const TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 30, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildQuizQuestion(Map<String, dynamic> question) {
    return Center(
      // Center the content horizontally
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              question['question'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'YesevaOne',
                fontSize: 30,
                color: Color.fromARGB(255, 0, 26, 156),
              ),
            ),
            const SizedBox(height: 80), // Space between text and first button
            ...question['answers'].map<Widget>((answer) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 30), // Space between buttons
                child: ButtonTheme(
                  minWidth: 200.0, // Width of the button
                  height: 50.0, // Height of the button
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(answer['isCorrect']),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Text color of the button
                    ),
                    child: Text(answer['text']),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
