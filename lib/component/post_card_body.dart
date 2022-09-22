import 'dart:math';

import 'package:flutter/material.dart';
import 'package:opinio_application/model/post.dart';

class PostCardBody extends StatelessWidget {
  const PostCardBody({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(post.content),
        if (post.images.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            itemCount: post.images.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black,
                child: Image.network(
                  post.images[index],
                ),
              );
            },
          )
      ],
    );
  }
}
