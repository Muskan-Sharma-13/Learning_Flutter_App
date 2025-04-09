import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/doubt_list.dart';
import 'package:learning_module_app/screens/navigator.dart';

class DoubtsPage extends StatefulWidget {
  const DoubtsPage({Key? key}) : super(key: key);

  @override
  State<DoubtsPage> createState() => _DoubtsPageState();
}

class _DoubtsPageState extends State<DoubtsPage> {
  String subject='Physics';
  final List<String> subjects = ['Physics', 'Chemistry', 'Mathematics'];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Get all your doubts answered...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildDoubtCard(context),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const PastDoubtsPage())
                    );
                  },
                    child: Text(
                      'Check your previous doubts',
                        style: TextStyle(
                        color: Colors.orange,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                    
                  ), 
                const SizedBox(height: 10),
                Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Check Community',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoubtCard(BuildContext context){
    return Container(
      width:300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(8),
        boxShadow:[
          BoxShadow(blurRadius:3, spreadRadius:4, color: const Color.fromARGB(255, 181, 181, 181), offset: const Offset(3,3)),
        ]
      ),
      child:Column(
        children: [ 
                  const SizedBox(height: 16),             
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: const Image(
                      image: AssetImage('assets/images/doubt.png'),
                      height: 150,
                    ), 
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: subject,
                        items: subjects.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            subject = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height:16),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Topic Name',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Type your question here',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:3),
                      Container(
                        width:50,
                        height:50,
                        child:Icon(
                          Icons.attach_file,
                          color:Colors.orange,
                        )
                      )
                    ],
                  ),
                  const SizedBox(height:16),
                  Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>DoubtsPage())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:16),
        ],
      )
    );
  }
}