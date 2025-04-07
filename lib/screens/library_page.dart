import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search materials...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 24),
            
            // Textbooks section
            const Text(
              'Textbooks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
                spacing: 10, // space between tiles horizontally
                runSpacing: 10, // space between rows
              children: [
                _buildResourceItem('Physics', Icons.science),
                _buildResourceItem('Chemistry', Icons.science_outlined),
                _buildResourceItem('Maths', Icons.calculate),
                _buildResourceItem('Biology', Icons.biotech),
              ],
            ),
            const SizedBox(height: 24),
            
            // Ncert section
            const Text(
              'Ncert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10, // space between tiles horizontally
              runSpacing: 10, // space between rows
              children: [
                _buildResourceItem('Physics', Icons.science),
                _buildResourceItem('Chemistry', Icons.science_outlined),
                _buildResourceItem('Maths', Icons.calculate),
                _buildResourceItem('Biology', Icons.biotech),
              ],
            ),
            const SizedBox(height: 24),
            
            // PYQS section
            const Text(
              'PYQS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
                spacing: 10, // space between tiles horizontally
                runSpacing: 10, // space between rows
              children: [
                _buildResourceItem('Jee 2020', Icons.book, small: true),
                _buildResourceItem('Jee 2021', Icons.book, small: true),
                _buildResourceItem('Jee 2022', Icons.book, small: true),
                _buildResourceItem('Jee 2023', Icons.book, small: true),
                _buildResourceItem('Jee 2024', Icons.book, small: true),
              ],
            ),
            const SizedBox(height: 24),
            
            // Formula Sheets section
            const Text(
              'Formula Sheets',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
                spacing: 10, // space between tiles horizontally
                runSpacing: 10, // space between rows
              children: [
                _buildResourceItem('Physics', Icons.science),
                _buildResourceItem('Chemistry', Icons.science_outlined),
                _buildResourceItem('Maths', Icons.calculate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String title, IconData icon, {bool small = false}) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 163, 160, 160),
            blurRadius:3,
            spreadRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: title == 'Physics'
                ? const Color.fromARGB(255, 33, 97, 149)
                : title == 'Chemistry'
                    ? Colors.orange
                    : title == 'Maths'
                        ? Colors.red
                        : title == 'Biology'
                            ? Colors.green
                            : Colors.black,
            size: small ? 24 : 32,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: small ? 10 : 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Download',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.file_download,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
