

// import 'package:learning_module_app/screens/community_screen/add_post.dart';
import 'package:learning_module_app/screens/community_screen/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/navigator.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      // appBar: AppBar(
      //   title: const Text('Community'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('datePublished', descending: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => const AddPostScreen()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}