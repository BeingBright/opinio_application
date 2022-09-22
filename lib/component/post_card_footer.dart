import 'package:flutter/material.dart';
import 'package:opinio_application/component/labeled_icon.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/service/post_service.dart';

class PostCardFooter extends StatefulWidget {
  const PostCardFooter({super.key, required this.post});

  final Post post;

  @override
  State<PostCardFooter> createState() => _PostCardFooterState();
}

class _PostCardFooterState extends State<PostCardFooter> {
  @override
  void initState() {
    PostService().updatePost(
      widget.post,
      {'score': widget.post.score + 1},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LabeledIcon(
          iconOnSelected: Icon(
            Icons.favorite_sharp,
            color: Colors.redAccent.shade400,
          ),
          iconOnDeselected: Icon(
            Icons.favorite_outline_sharp,
            color: theme.hintColor,
          ),
          label: Text("${widget.post.likes} likes"),
          onTap: (isSelected) {
            setState(() {
              if (isSelected) {
                widget.post.likes += 1;
              } else {
                widget.post.likes -= 1;
              }
            });
          },
        ),
        LabeledIcon(
          iconOnSelected: Icon(
            Icons.remove_red_eye_sharp,
            color: theme.colorScheme.primary,
          ),
          label: Text("${widget.post.score} views"),
          onTap: (isSelected) {},
        ),
      ],
    );
  }
}
