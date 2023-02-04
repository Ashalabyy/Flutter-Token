import 'package:auth/constants/constants.dart';
import 'package:auth/models/User.dart';
import 'package:auth/sign_Up/TestScreen.dart';
import 'package:provider/provider.dart';
import '../sign_Up/SignUpScreen.dart';
import '../providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey2 = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  Map<String, String> Auth2 = {
    'email': '',
    'password': '',
  };

  _SubmitForm() async {
    final isValid = _formKey2.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey2.currentState!.save();
    await Provider.of<Auth>(context, listen: false)
        .Signin(Auth2['email']!, Auth2['password']!);
    Navigator.of(context).pushNamed(Test.RouteName);
  }
  // NOTE : This project didnt finish yet this is not the final result of it

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.end,
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
                buildEmailFormField(),
                SizedBox(
                  height: Size.height * 0.05,
                ),
                buildPasswordFormField(),
                SizedBox(
                  height: Size.height * 0.03,
                ),
                Text(
                  'Forget Password ?',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: Size.height * 0.03,
                ),
                MaterialButton(
                  minWidth: Size.width * 0.8,
                  height: Size.height * 0.06,
                  child: Center(
                    child: Text(
                      'login',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  color: Colors.orange,
                  onPressed: _SubmitForm,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  height: Size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'dont have account ?',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUpScreen.RouteName);
                      },
                      child: Text(
                        'Sign up',
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
      ),
    );
  }
  // NOTE : This project didnt finish yet this is not the final result of it

  TextFormField buildPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please eneter a vaild Password.';
        } else if (value.length < 8) {
          return 'Password Must Be More than 8 charchters';
        }
        return null;
      },
      onChanged: (value) {
        Auth2['password'] = value;
      },
      obscureText: isPasswordVisible,
      decoration: Constants.defaultInputDecoration.copyWith(
        labelText: "password",
        hintText: "enter your password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFFff7900),
          ),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.orange),
    );
  }
  // NOTE : This project didnt finish yet this is not the final result of it

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please eneter a vaild Email.';
        }
        return null;
      },
      onChanged: (value) {
        Auth2['email'] = value;
      },
      decoration: Constants.defaultInputDecoration.copyWith(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: Icon(
            Icons.email,
            color: Colors.orange,
          )),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.orange),
    );
  }
}
