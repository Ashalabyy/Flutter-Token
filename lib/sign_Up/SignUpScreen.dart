import 'SignUpView.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const RouteName = '/SignUpScreen';
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Size.height,
            width: Size.width,
            child: Image.asset(
              'assets/images/test2.gif',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: Size.height,
            width: Size.width,
            color: Colors.black.withOpacity(0.6),
          ),
          SignUpView(),
        ],
      ),
    );
  }
}
