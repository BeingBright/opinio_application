import 'dart:math';

import 'package:flutter/material.dart';
import 'package:opinio_application/mixin/form_field_required.dart';
import 'package:opinio_application/model/user_registration_details.dart';
import 'package:opinio_application/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.authService});

  final AuthService? authService;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin, RequiredFormFieldMixin {
  late AnimationController _controller;

  late AuthService authService;

  final _formKey = GlobalKey<FormState>();

  final UserRegistrationDetails _userRegistrationDetails =
      UserRegistrationDetails.empty();

  void _registerUser() {
    if (!_formKey.currentState!.validate()) {
      _userRegistrationDetails.clear();
      return;
    }
    _formKey.currentState!.save();
    var result = authService.registerUser(_userRegistrationDetails);
    result.then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    });
  }

  void _toLoginScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
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
      body: Center(
        child: SizedBox(
          width: min(600, MediaQuery.of(context).size.width),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Opinio",
                    style: textTheme.displayLarge,
                  ),
                ),
                Center(
                  child: Text(
                    "Register",
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
                      _userRegistrationDetails.username = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "john Dowe",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                    validator: requiredField,
                    textInputAction: TextInputAction.next,
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      _userRegistrationDetails.email = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "john@iconica.nl",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.newPassword],
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: requiredField,
                    textInputAction: TextInputAction.next,
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      _userRegistrationDetails.password = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.newPassword],
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: requiredField,
                    textInputAction: TextInputAction.next,
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      _userRegistrationDetails.repeatPassword = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Repeat Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    keyboardType: TextInputType.phone,
                    validator: requiredField,
                    textInputAction: TextInputAction.send,
                    onEditingComplete: () {
                      _registerUser();
                    },
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      _userRegistrationDetails.phoneNumber = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      hintText: "06XXXXXXXX",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _registerUser,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Register"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: _toLoginScreen,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Login"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
