import 'package:flutter/material.dart';
import 'package:opinio_application/component/post_card_body.dart';
import 'package:opinio_application/component/post_card_footer.dart';
import 'package:opinio_application/component/post_card_header.dart';
import 'package:opinio_application/model/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PostCardHeader(
              post: post,
            ),
            PostCardBody(
              post: post,
            ),
            PostCardFooter(
              post: post,
            ),
          ],
        ),
      ),
    );
  }
}
