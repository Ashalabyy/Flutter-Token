import 'FormData.dart';
import '../sign_in/SignInScreen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Token test',
                style: GoogleFonts.nunito(
                  color: Colors.yellow,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: Size.height * 0.10,
              ),
              SignUpFromdata(),
              SizedBox(
                height: Size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'already have account ?',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.RouteName);
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.nunito(
                        color: Colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
