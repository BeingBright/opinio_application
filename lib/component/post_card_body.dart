import 'package:flutter/material.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/views/image_preview_page.dart';

class PostCardBody extends StatelessWidget {
  const PostCardBody({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                post.content,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          if (post.images.isNotEmpty) const Divider(),
          if (post.images.isNotEmpty)
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImagePreviewPage(
                            path: post.images[index],
                          ),
                        ),
                      );
                    },
                    icon: Hero(
                      tag: post.images[index],
                      child: Image.network(
                        post.images[index],
                      ),
                    ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
