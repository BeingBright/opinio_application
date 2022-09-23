import 'package:flutter/material.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/service/user_service.dart';

class PostCardHeader extends StatefulWidget {
  const PostCardHeader({super.key, required this.post});

  final Post post;

  @override
  State<PostCardHeader> createState() => _PostCardHeaderState();
}

class _PostCardHeaderState extends State<PostCardHeader> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder(
          future: UserService().getUser(widget.post.by),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("");
            if (snapshot.connectionState == ConnectionState.done) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    snapshot.data?.imageID ??
                        "https://media.giphy.com/media/hS42TuYYnANLFR9IRQ/giphy.gif",
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    snapshot.data?.name ?? "Username",
                    style: textTheme.titleLarge,
                  )
                ],
              );
            }
            return Container();
          },
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz_sharp,
            color: theme.hintColor,
          ),
        )
      ],
    );
  }
}
