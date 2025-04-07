import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0; // Starting with question 10 as shown in image
  int _timeLeft = 30; // 14 minutes in seconds
  Timer? _timer;
  String? _selectedAnswer;

  final List<QuizQuestion> _questions = [
    QuizQuestion(
      "A car accelerates uniformly from rest at 5 m/s². What is its velocity after 4 seconds?",
      ["10 m/s", "15 m/s", "20 m/s", "25 m/s"],
      "20 m/s",
    ),
    QuizQuestion(
      "What is the acceleration due to gravity on Earth's surface?",
      ["5 m/s²", "8 m/s²", "9.8 m/s²", "11 m/s²"],
      "9.8 m/s²",
    ),
    QuizQuestion(
      "If a 2 kg object experiences a force of 10 N, what is its acceleration?",
      ["2 m/s²", "5 m/s²", "8 m/s²", "12 m/s²"],
      "5 m/s²",
    ),
    QuizQuestion(
      "A projectile is launched at 45° angle with velocity 20 m/s. What is its horizontal range?",
      ["20 m", "30.6 m", "40.8 m", "50 m"],
      "40.8 m",
    ),
    QuizQuestion(
      "What is the period of a pendulum with length 1 meter on Earth?",
      ["1 s", "2 s", "3.14 s", "6.28 s"],
      "2 s",
    ),
    QuizQuestion(
      "A ball is thrown upward with velocity 25 m/s. How high will it go?",
      ["31.9 m", "42.5 m", "52.1 m", "63.8 m"],
      "31.9 m",
    ),
    QuizQuestion(
      "What is the kinetic energy of a 500 kg car moving at 20 m/s?",
      ["50,000 J", "100,000 J", "150,000 J", "200,000 J"],
      "100,000 J",
    ),
    QuizQuestion(
      "Two objects with masses 5 kg and 10 kg collide. If the first object has velocity 4 m/s before collision and both objects stick together, what is their final velocity?",
      ["1 m/s", "1.33 m/s", "2.67 m/s", "4 m/s"],
      "1.33 m/s",
    ),
    QuizQuestion(
      "What is the momentum of a 0.15 kg baseball thrown at 40 m/s?",
      ["3 kg·m/s", "6 kg·m/s", "9 kg·m/s", "12 kg·m/s"],
      "6 kg·m/s",
    ),
    QuizQuestion(
      "A car accelerates uniformly from rest at 5 m/s². What is its velocity after 4 seconds?",
      ["10 m/s", "15 m/s", "20 m/s", "25 m/s"],
      "20 m/s",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          Navigator.pop(context);
          // Handle quiz timeout
        }
      });
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      } else {
        // Quiz completed
        _timer?.cancel();
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _selectedAnswer = null;
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes mins';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [            
            // Question indicators
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: _currentQuestionIndex == index
                          ? Colors.teal
                          : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: _currentQuestionIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Question content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _questions[_currentQuestionIndex].questionText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Answer options
                    ...List.generate(
                      _questions[_currentQuestionIndex].options.length,
                      (index) {
                        final option = _questions[_currentQuestionIndex].options[index];
                        final optionLabel = String.fromCharCode(65 + index); // A, B, C, D
                        final isSelected = _selectedAnswer == option;
                        
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAnswer = option;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.teal : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? Colors.white : Colors.grey.shade400,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      optionLabel,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected ? Colors.teal : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  option,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: _previousQuestion,
                    backgroundColor: const Color.fromARGB(255, 247, 236, 24),
                    child: const Icon(Icons.chevron_left, color:Colors.black),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(_timeLeft),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _nextQuestion,
                    backgroundColor: const Color.fromARGB(255, 247, 236, 24),
                    child: const Icon(Icons.chevron_right, color:Colors.black),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class QuizQuestion {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion(this.questionText, this.options, this.correctAnswer);
}