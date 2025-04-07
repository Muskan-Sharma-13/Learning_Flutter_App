import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';
import 'package:learning_module_app/screens/assignment_detail.dart';
import 'package:learning_module_app/screens/quiz_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<List<String>> UpcomingTests = [
    ['PHYSICS','Kinematics','9:00 AM','30 mins','20 Questions'],
    ['CHEMISTRY','Mole Concept','9:00 AM','30 mins','20 Questions'],
    ['MATHEMATICS','Integration','9:00 AM','30 mins','20 Questions'],
  ];

    final List<List<String>> Submissions = [
    ['PHYSICS','NLM Assignment 1','28 March, 9:00 AM'],
    ['CHEMISTRY','NLM Assignment 1','30 March, 9:00 AM'],
    ['MATHEMATICS','NLM Assignment 1','8 April, 9:00 AM'],
  ];

  Color getColor(String subject) {
    switch (subject) {
      case 'PHYSICS':
        return const Color.fromARGB(255, 220, 211, 236);
      case 'CHEMISTRY':
        return const Color.fromARGB(255, 200, 223, 201);
      case 'MATHEMATICS':
        return const Color.fromARGB(255, 245, 221, 229);
      default:
        return Colors.grey.shade100;
    }
  }

    Color getTitleColor(String subject) {
      switch (subject) {
      case 'PHYSICS':
        return Colors.deepPurple.shade500;
      case 'CHEMISTRY':
        return const Color.fromARGB(255, 24, 71, 26);
      case 'MATHEMATICS':
        return const Color.fromARGB(255, 205, 43, 170);
      default:
        return Colors.grey.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Today\'s Classes', true),
            const SizedBox(height: 12),
            _buildClassCard(
              'PHYSICS',
              'Kinematics',
              '9:00 AM',
              Colors.teal.shade50,
            ),
            const SizedBox(height: 30),
            _buildSectionHeader('Upcoming Tests', false),
            const SizedBox(height: 12),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                      for(var i=0;i<UpcomingTests.length;i++)...[
                        _buildTestCard(
                          UpcomingTests[i][0],
                          UpcomingTests[i][1],
                          UpcomingTests[i][2],
                          UpcomingTests[i][3],
                          UpcomingTests[i][4],
                          getColor(UpcomingTests[i][0]),
                          'Start',
                          getTitleColor(UpcomingTests[i][0]),
                          context
                        ),
                        const SizedBox(width: 12),
                      ]
                  ],
                ),
            ),
            const SizedBox(height: 30),
            _buildSectionHeader('Submissions', false),
            const SizedBox(height: 12),
            for(var i=0;i<Submissions.length;i++)
              _buildSubmissionItem(
                Submissions[i][0],
                Submissions[i][1],
                Submissions[i][2],
                getColor(Submissions[i][0]),
                getTitleColor(Submissions[i][0]),
                context
              )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool showViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showViewAll)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'View All',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildClassCard(
    String subject,
    String topic,
    String time,
    Color bgColor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            topic,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,

            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // child: const Text('Join'),
                child:
                Text('Join', style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestCard(
    String subject,
    String topic,
    String time,
    String duration,
    String questions,
    Color bgColor,
    String buttonText,
    Color buttonColor,
    BuildContext context
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
              fontSize: 18,
              color: buttonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            topic,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 10, color: Colors.black87),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                questions,
                style: const TextStyle(fontSize: 10, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Duration: $duration',
                style: const TextStyle(fontSize: 10, color: Colors.black87),
              ),
              SizedBox(
                // width: double.infinity,
                width:70,
                height:35,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> QuizStartPage()),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    textStyle: const TextStyle(fontSize: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(buttonText,style: const TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubmissionItem(
    String subject,
    String assignmentTitle,
    String deadline,
    Color bgColor,
    Color titleColor,
    BuildContext context
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:titleColor,
                ),
              ),
              Text(
                '• $assignmentTitle',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Deadline: $deadline',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap:(){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> AssignmentDetailsPage()),
                  );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
