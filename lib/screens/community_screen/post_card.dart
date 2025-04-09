import 'package:learning_module_app/components/utils.dart';
import 'package:learning_module_app/models/user.dart' as model;
import 'package:learning_module_app/resources/firestore_methods.dart';
import 'package:learning_module_app/resources/user_provider.dart';
import 'package:learning_module_app/screens/community_screen/like_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_module_app/screens/solution_page.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      setState(() {
        commentLen = snap.docs.length;
      });
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

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
    //final model.User user = Provider.of<UserProvider>(context).getUser!;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                Hero(
                  tag: 'profile_${widget.snap['postId']}',
                  child: Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.grey[700],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( 
                          // widget.snap['isAnonymous']? 'Anonymous':
                          // widget.snap['username'] ?? user.username,
                          widget.snap['username'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // widget.snap['uid'] == user.uid
                //     ? IconButton(
                //         onPressed: () {
                //           showDialog(
                //             context: context,
                //             builder: (context) => Dialog(
                //               child: ListView(
                //                 padding:
                //                     const EdgeInsets.symmetric(vertical: 16),
                //                 shrinkWrap: true,
                //                 children: ['Delete'].map(
                //                   (e) => InkWell(
                //                     child: Container(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 12, horizontal: 16),
                //                       child: Text(e),
                //                     ),
                //                     onTap: () {
                //                       deletePost(widget.snap['postId']);
                //                       Navigator.of(context).pop();
                //                     },
                //                   ),
                //                 ).toList(),
                //               ),
                //             ),
                //           );
                //         },
                //         icon: const Icon(Icons.more_vert),
                //       )
                //     : Container(),
              ],
            ),
          ),
          // Post Content
          GestureDetector(
            onDoubleTap: () async {
              // await FireStoreMethods().likePost(
              //   widget.snap['postId'],
              //   user!.uid??'',
              //   widget.snap['likes'],
              // );
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                widget.snap['postUrl'] != null &&
                        widget.snap['postUrl'].isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.width * 0.8,
                        width: double.infinity,
                        child: Image.network(
                          widget.snap['postUrl'],
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "What will be the rolling ball projectile length vertically and horizontally:",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Actions
          Row(
            children: [
              // LikeAnimation(
              //   isAnimating: widget.snap['likes'].contains(user.uid),
              //   smallLike: true,
              //   child: IconButton(
              //     icon: widget.snap['likes'].contains(user.uid)
              //         ? const Icon(
              //             Icons.favorite,
              //             color: Colors.red,
              //           )
              //         : const Icon(Icons.favorite_border),
              //     onPressed: () async {
              //       await FireStoreMethods().likePost(
              //         widget.snap['postId'],
              //         user!.uid??'',
              //         widget.snap['likes'],
              //       );
              //     },
              //   ),
              // ),
              // IconButton(
              //   icon: const Icon(Icons.comment_outlined),
              //   onPressed: () => Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => CommentsScreen(
              //         postId: widget.snap['postId'],
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(                
                    children: [
                        Container(
                          decoration: BoxDecoration(
                            color: getColor('Mathematics'),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: Text(
                              'Mathematics',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width:10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: Text(
                              'Linear Algebra',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          // Footer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w800),
                  child: Text(
                    '${widget.snap['likes'].length} solutions posted',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: widget.snap['username'],
                          //text: widget.snap['isAnonymous']?'Anonymous': widget.snap['username'] ?? user.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if(widget.snap['postUrl']!=null)TextSpan(text: " What will be the rolling ball projectile length vertically and horizontally:"),
                      ],
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SimplificationScreen(originalString: widget.snap['description'])));
                //   },
                //   child: Text("Explain this text")),
                SizedBox(height:8),
                InkWell(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> MathSolutionsScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> MathSolutionsScreen()),
                          );
                        },
                        child: const Text(
                          'Check all solutions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}