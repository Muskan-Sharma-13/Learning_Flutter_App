import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';

class DoubtsPage extends StatelessWidget {
  const DoubtsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Solution to all your doubts...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: const Image(
              image: AssetImage('assets/images/doubt.jpeg'),
              height: 150,
            ), 
          ),
          const SizedBox(height: 32),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Type Question here',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 180,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Ask Doubts',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}