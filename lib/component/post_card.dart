import 'package:flutter/material.dart';
import 'package:opinio_application/model/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(post.content),
          Text(post.by),
          Text(post.dateAdded.toString()),
        ],
      ),
    );
  }
}
