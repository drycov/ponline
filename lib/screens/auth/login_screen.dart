import 'package:flutter/material.dart';
import 'package:ponlink/widgets/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                height: height,
                child: Stack(
                  children: [
                  ],
                ))));
  }
}
