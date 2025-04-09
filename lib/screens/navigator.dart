import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_module_app/screens/assignment_detail.dart';
import 'package:learning_module_app/screens/assignment_list.dart';
import 'package:learning_module_app/screens/doubt_page.dart';
import 'package:learning_module_app/screens/home_page.dart';
import 'package:learning_module_app/screens/library_page.dart';
import 'package:learning_module_app/screens/quiz_list.dart';



// Core navigation scaffold that appears on all screens
class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(title, style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.teal),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.teal,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, Icons.library_books, 'Library', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LibraryPage()),
                );
              }),
              _buildNavItem(context, Icons.question_answer, 'Doubts', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoubtsPage()),
                );
              }),
              _buildHomeButton(context),
              _buildNavItem(context, Icons.quiz, 'Quiz', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              }),
              _buildNavItem(context, Icons.assignment, 'Assignment', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssignmentPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildNavItem(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 162, 228, 222),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.teal,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const Icon(
          Icons.home,
          color: Colors.black,
        ),
      ),
    );
  }
}

