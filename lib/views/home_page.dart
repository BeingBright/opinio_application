import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:opinio_application/component/post_card.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/service/auth_service.dart';
import 'package:opinio_application/service/post_service.dart';
import 'package:opinio_application/views/base_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, this.authService});

  final AuthService? authService;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late AuthService authService;

  @override
  void initState() {
    authService = widget.authService ?? AuthService();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Post>> posts = ref.watch(PostService().postProvider);
    return BasePage(
      actionAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: const Icon(
            Icons.person,
          ),
        )
      ],
      floatingAction: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed("/post");
        },
        tooltip: "Post a Post",
        icon: const Icon(Icons.speaker_notes_sharp),
        label: const Text("Post"),
      ),
      child: posts.when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(post: data[index]),
              );
            },
          );
        },
      ),
    );
  }
}
