import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:opinio_application/component/post_card.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/service/post_service.dart';

class PostView extends ConsumerStatefulWidget {
  const PostView({this.userID, super.key});

  final String? userID;

  @override
  ConsumerState<PostView> createState() => _PostViewState();
}

class _PostViewState extends ConsumerState<PostView> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Post>> posts;
    if ((widget.userID == null)) {
      posts = ref.watch(PostService().postProvider);
    } else {
      posts = ref.watch(PostService().postForUserProvider(widget.userID!));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: posts.when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PostCard(post: data[index]);
            },
          );
        },
      ),
    );
  }
}
