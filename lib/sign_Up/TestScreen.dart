import 'package:auth/sign_in/SignInScreen.dart';
import 'package:flutter/material.dart';
import '../models/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/Auth.dart';

class Test extends StatefulWidget {
  static const RouteName = '/Test';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Auth>(context, listen: false);

    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: Size.height * 0.3,
          width: Size.width * 0.8,
          child: MaterialButton(
            minWidth: Size.width * 0.5,
            height: Size.height * 0.06,
            child: Center(
              child: Text(
                'Sign out',
                style: GoogleFonts.nunito(
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            color: Colors.orange,
            onPressed: () async {
              await data.logOut();
              Navigator.of(context).pushNamed(SignInScreen.RouteName);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
