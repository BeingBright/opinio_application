import 'package:flutter/material.dart';
import 'package:opinio_application/model/post.dart';

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
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              "https://media.giphy.com/media/hS42TuYYnANLFR9IRQ/giphy.gif",
              width: 50,
              height: 50,
            ),
            Text(
              "Username",
              style: textTheme.titleLarge,
            )
          ],
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
