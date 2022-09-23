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
    var theme = Theme.of(context);
    return AuthorizationChecker(
      child: Scaffold(
        floatingActionButton: floatingAction,
        body: Center(
          heightFactor: 1,
          child: Stack(
            children: [
              child,
              SafeArea(
                child: Container(
                  constraints: BoxConstraints.tight(
                    const Size(double.infinity, 60),
                  ),
                  child: Row(
                    mainAxisAlignment: actionAlignment ?? MainAxisAlignment.end,
                    children: [
                      ...actions,
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              (authService ?? AuthService()).logout();
                            },
                            icon: Icon(
                              Icons.logout_sharp,
                              color: theme.iconTheme.color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
