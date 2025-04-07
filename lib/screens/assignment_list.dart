import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';
import 'package:learning_module_app/screens/assignment_detail.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  String selectedFilter = 'Today';
  String selectedCategory='Assigned';

  List<List<String>> assignments=[
    ['Chemistry','Mole Concept-I','3:00pm'],
    ['Physics','Kinematics-II','6:00pm'],
    ['Mathematics','Linear Algebra','9:00pm']
  ];
  
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
                _buildFilterTab('Assigned', selectedCategory == 'Assigned'),
                _buildFilterTab('Missing', selectedCategory == 'Missing'),
                _buildFilterTab('Done', selectedCategory == 'Done'),
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
            for(var i=0;i<assignments.length;i++)
              _buildAssignmentItem(
                assignments[i][0],
                assignments[i][1],
                assignments[i][2]
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

  Widget _buildAssignmentItem(String subject, String topic, String deadline) {
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
            MaterialPageRoute(builder: (context)=>const AssignmentDetailsPage()),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedCategory=='Assigned'?
                Colors.teal
                  :selectedCategory=='Missing'?
                  Colors.red
                  :const Color.fromARGB(255, 32, 71, 103),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.assignment,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    topic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Color.fromARGB(221, 62, 61, 61),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Deadline: $deadline',
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