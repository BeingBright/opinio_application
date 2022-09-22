import 'dart:math';

import 'package:flutter/material.dart';
import 'package:opinio_application/mixin/form_field_required.dart';
import 'package:opinio_application/model/user_login_details.dart';
import 'package:opinio_application/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.authService});

  final AuthService? authService;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin, RequiredFormFieldMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormState>();

  late AuthService authService;
  final UserLoginDetails _userLoginDetails = UserLoginDetails("", "");

  String errorMessage = '';

  void _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      _userLoginDetails.clear();
      return;
    }
    _formKey.currentState!.save();

    final result = authService.login(_userLoginDetails);
    result.onError((Exception error, stackTrace) {
      setState(() {
        errorMessage = error.toString();
      });
      return null;
    });
    result.then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    });
  }

  void _registerNewUser() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/register", (route) => false);
  }

  @override
  void initState() {
    authService = widget.authService ?? AuthService();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: SizedBox(
              height: min(600, MediaQuery.of(context).size.height),
              width: min(350, MediaQuery.of(context).size.width),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "Opinio",
                        style: textTheme.displayLarge,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Login",
                        style: textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        autofillHints: const [AutofillHints.username],
                        keyboardType: TextInputType.name,
                        validator: requiredField,
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          if (newValue == null) return;
                          _userLoginDetails.username = newValue;
                        },
                        decoration: const InputDecoration(
                          labelText: "Username",
                          hintText: "john@iconica.nl",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        autofillHints: const [AutofillHints.password],
                        keyboardType: TextInputType.visiblePassword,
                        validator: requiredField,
                        onSaved: (newValue) {
                          if (newValue == null) return;
                          _userLoginDetails.password = newValue;
                        },
                        textInputAction: TextInputAction.send,
                        onEditingComplete: () {
                          _loginUser();
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "SuperSecretP@ssword",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _loginUser,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Login"),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        errorMessage,
                        style:
                            textTheme.titleMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: _registerNewUser,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Register"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
