import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    super.key,
    this.iconPath,
    this.username,
    this.height,
    required this.onPressed,
  });

  final String? iconPath;
  final String? username;

  final Function() onPressed;

  final double? height;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
                iconPath ??
                    "https://media.giphy.com/media/hS42TuYYnANLFR9IRQ/giphy.gif",
                height: height ?? 60),
            Text(
              username ?? "404 Cat's",
              style: textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
