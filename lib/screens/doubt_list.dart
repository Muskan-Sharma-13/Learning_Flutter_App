import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';
import 'package:learning_module_app/screens/solution_page.dart';

class PastDoubtsPage extends StatefulWidget {
  const PastDoubtsPage({Key? key}) : super(key: key);

  @override
  State<PastDoubtsPage> createState() => _PastDoubtsPageState();
}

class _PastDoubtsPageState extends State<PastDoubtsPage> {
  String selectedFilter = 'Today';
  String selectedCategory='Not Answered';

  List<List<String>> PastDoubts=[
    ['Chemistry','Mole Concept-I','What is stoichiometric ratio in this question:','4th April, 3:00pm'],
    ['Physics','Kinematics-II','What will be the rolling ball projectile length vertically and horizontally:','30th March, 6:00pm'],
    ['Mathematics','Linear Algebra','Solve these equations:','2nd April, 9:00pm']
  ];

  Color getColor(String subject) {
    switch (subject) {
      case 'Physics':
        return Colors.deepPurple.shade500;
      case 'Chemistry':
        return const Color.fromARGB(255, 24, 71, 26);
      case 'Mathematics':
        return const Color.fromARGB(255, 205, 43, 170);
      default:
        return Colors.grey.shade500;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filter tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterTab('Not Answered', selectedCategory == 'Not Answered'),
                _buildFilterTab('Answered', selectedCategory == 'Answered'),
              ],
            ),
            const SizedBox(height: 16),
            
            // Date dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedFilter,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: <String>['Today', 'This Week', 'This Month', 'All']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFilter = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            for(var i=0;i<PastDoubts.length;i++)
              _buildPastDoubtsItem(
                PastDoubts[i][0],
                PastDoubts[i][1],
                PastDoubts[i][2],
                PastDoubts[i][3],
                getColor(PastDoubts[i][0])
              )
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(String text, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.teal : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.teal : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildPastDoubtsItem(String subject, String topic, String question, String deadline,Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>const MathSolutionsScreen()),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedCategory=='Not Answered'?
                Colors.red
                  :Color.fromARGB(255, 32, 71, 103),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.question_mark,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        subject,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width:15),
                      Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text(
                            topic,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:6),
                  Text(
                    question,
                    style: const TextStyle(
                      color:Color.fromARGB(221, 62, 61, 61),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Posted on: $deadline',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
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