import 'package:flutter/material.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton(
      {super.key, this.height, this.width, required this.onPressed});

  final double? height;
  final double? width;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.primary,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: width ?? 30,
            height: height ?? 30,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.image,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: width ?? 30 * 1.5,
                  ),
                  const Text("Upload an image")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
