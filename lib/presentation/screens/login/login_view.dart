import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return loginWidget(context);
  }
}

Widget loginWidget(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: Text('Login'),
    ),
  );
}
