import 'package:auth/sign_in/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'sign_Up/SignUpScreen.dart';
import 'package:provider/provider.dart';
import './providers/Auth.dart';
import 'sign_Up/TestScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Authorization.dart';

// NOTE : This project didnt finish yet this is not the final result of it

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _storge = FlutterSecureStorage();
  String? token = await Authorization.getToken();
  Widget page;
  if (token == null || token == "") {
    page = SignInScreen();
  } else {
    page = Test();
  }
  runApp(MyApp(
    Screen: page,
  ));
}

class MyApp extends StatelessWidget {
  final Widget Screen;

  MyApp({required this.Screen});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen,
        routes: {
          SignInScreen.RouteName: (context) => SignInScreen(),
          Test.RouteName: (context) => Test(),
          SignUpScreen.RouteName: (context) => SignUpScreen(),
        },
      ),
    );
  }
}
