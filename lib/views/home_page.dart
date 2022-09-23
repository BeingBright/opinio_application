import 'package:flutter/material.dart';
import 'package:opinio_application/component/post_view.dart';
import 'package:opinio_application/service/auth_service.dart';
import 'package:opinio_application/service/user_service.dart';
import 'package:opinio_application/views/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.authService});

  final AuthService? authService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return BasePage(
      actionAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pushNamed("/profile");
              },
              icon: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data?.imageID != null &&
                        snapshot.data!.imageID.isNotEmpty) {
                      return Hero(
                        tag: snapshot.data!.imageID,
                        child: Image.network(
                          snapshot.data!.imageID,
                        ),
                      );
                    } else {
                      return const Icon(Icons.person);
                    }
                  }
                  return const CircularProgressIndicator();
                },
                future: UserService().getUserProfile(),
              ),
            ),
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
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: const PostView(),
        ),
      ),
    );
  }
}
