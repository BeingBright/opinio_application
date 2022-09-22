import 'dart:math';

import 'package:flutter/material.dart';
import 'package:opinio_application/component/authorization_checker.dart';
import 'package:opinio_application/service/auth_service.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.actions,
    required this.child,
    this.floatingAction,
    this.authService,
    this.actionAlignment,
  });

  final List<Widget> actions;
  final MainAxisAlignment? actionAlignment;
  final Widget child;
  final Widget? floatingAction;
  final AuthService? authService;

  @override
  Widget build(BuildContext context) {
    return AuthorizationChecker(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: floatingAction,
          body: Center(
            heightFactor: 1,
            child: SizedBox(
              width: min(750, MediaQuery.of(context).size.width),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: child,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints.tight(
                      const Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          actionAlignment ?? MainAxisAlignment.end,
                      children: [
                        ...actions,
                        IconButton(
                          onPressed: () {
                            (authService ?? AuthService()).logout();
                          },
                          icon: const Icon(
                            Icons.logout_sharp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
