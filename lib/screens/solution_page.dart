import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:learning_module_app/screens/navigator.dart';

class MathSolutionsScreen extends StatelessWidget {
  const MathSolutionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Question:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'Compute f(x)',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      // Math.tex(
                      //   r'f(x) = (x^2 - x) \cdot f'(x), \text{ where } f''(x) = 0',
                      //   textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                      // ),
                      const SizedBox(height: 8),
                      const Text(
                        'Compute f(x)',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '(a) ∫x² f\'(x) dx',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '(b) ∫x f\'(x) dx',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '(c) ∫f\'(x) dx',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '(d) ∫(x² + x) f\'(x) dx',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Solutions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text('If we apply step by step integration we get ...'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Solution',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8.0,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.home_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.book_outlined),
      //         onPressed: () {},
      //       ),
      //       const SizedBox(width: 48),
      //       IconButton(
      //         icon: const Icon(Icons.chat_bubble_outline),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.settings_outlined),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.teal,
      //   child: const Icon(Icons.home),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}