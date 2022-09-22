import 'dart:math';

import 'package:flutter/material.dart';
import 'package:opinio_application/model/error.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, required this.error});

  final Error error;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.error.icon,
              size: min(200, MediaQuery.of(context).size.width),
              color: Colors.red,
            ),
            Text(
              widget.error.title,
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              widget.error.code.toString(),
              style: theme.textTheme.titleLarge,
            ),
            Text(
              widget.error.message,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
