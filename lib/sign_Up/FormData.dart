import 'package:auth/providers/Auth.dart';
import 'package:auth/sign_in/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../models/User.dart';
import 'package:provider/provider.dart';
import 'TestScreen.dart';

class SignUpFromdata extends StatefulWidget {
  @override
  State<SignUpFromdata> createState() => _SignUpFromdataState();
}

class _SignUpFromdataState extends State<SignUpFromdata> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  var Usermodal = User(
    id: '',
    // jsonwebtoken: '',
    FirstName: '',
    lastName: '',
    email: '',
    password: '',
  );

  void _SubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    final JsonFormat = Usermodal.toJson();
    await Provider.of<Auth>(context, listen: false).SignUp(JsonFormat);
    Navigator.of(context).pushNamed(SignInScreen.RouteName);
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(
            height: 20,
          ),
          buildlastNameFormField(),
          SizedBox(
            height: 20,
          ),
          buildEmailFormField(),
          SizedBox(
            height: 20,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: Size.height * 0.03,
          ),
          MaterialButton(
            minWidth: Size.width * 0.8,
            height: Size.height * 0.06,
            child: Center(
              child: Text(
                'Sign up',
                style: GoogleFonts.nunito(
                  letterSpacing: 1.5,
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
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please eneter a vaild Password.';
        } else if (value.length < 8) {
          return 'Password Must Be More than 8 charchters';
        } else if (value.contains(' ')) {
          return 'password cannot Contains Space';
        }
        return null;
      },
      cursorColor: Colors.white,
      onChanged: (value) {
        Usermodal = User(
          id: Usermodal.id,
          //  jsonwebtoken: Usermodal.jsonwebtoken,
          FirstName: Usermodal.FirstName,
          email: Usermodal.email,
          lastName: Usermodal.lastName,
          password: value,
        );
      },
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
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
        border: GradientOutlineInputBorder(
          gradient: LinearGradient(
            colors: [Colors.green, Color(0xFFff7900)],
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        labelText: "Password",
        labelStyle: GoogleFonts.nunito(
          color: Colors.orange,
          fontSize: 14,
        ),
        hintText: "Enter your Password",
        hintStyle: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: GoogleFonts.nunito(
        color: Color(0xFFff7900),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please eneter a vaild Email.';
        }
        return null;
      },
      onChanged: (value) {
        Usermodal = User(
          id: Usermodal.id,
          //   jsonwebtoken: Usermodal.jsonwebtoken,
          FirstName: Usermodal.FirstName,
          email: value,
          lastName: Usermodal.lastName,
          password: Usermodal.password,
        );
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.email, color: Colors.orange),
        ),
        border: GradientOutlineInputBorder(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color(0xFFff7900),
            ],
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        labelText: "Email",
        labelStyle: GoogleFonts.nunito(
          color: Colors.orange,
          fontSize: 14,
        ),
        hintText: "Enter your Email",
        hintStyle: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.nunito(
        color: Color(0xFFff7900),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty && value.length < 4) {
          return 'please eneter a vaild name.';
        }
        return null;
      },
      onChanged: (value) {
        Usermodal = User(
          id: Usermodal.id,
          //  jsonwebtoken: Usermodal.jsonwebtoken,
          FirstName: value,
          email: Usermodal.email,
          lastName: Usermodal.lastName,
          password: Usermodal.password,
        );
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.person_outlined, color: Colors.orange),
        ),
        border: GradientOutlineInputBorder(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color(0xFFff7900),
            ],
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        labelText: "First Name",
        labelStyle: GoogleFonts.nunito(
          color: Colors.orange,
          fontSize: 14,
        ),
        hintText: "Enter your First",
        hintStyle: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: GoogleFonts.nunito(
        color: Color(0xFFff7900),
      ),
    );
  }

  TextFormField buildlastNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty && value.length < 4) {
          return 'please eneter a vaild name.';
        }
        return null;
      },
      onChanged: (value) {
        Usermodal = User(
          id: Usermodal.id,
          // jsonwebtoken: Usermodal.jsonwebtoken,
          FirstName: Usermodal.FirstName,
          email: Usermodal.email,
          lastName: value,
          password: Usermodal.password,
        );
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.person_pin_circle_outlined, color: Colors.orange),
        ),
        border: GradientOutlineInputBorder(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color(0xFFff7900),
            ],
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        labelText: "last Name",
        labelStyle: GoogleFonts.nunito(
          color: Colors.orange,
          fontSize: 14,
        ),
        hintText: "Enter your lastName",
        hintStyle: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: GoogleFonts.nunito(
        color: Color(0xFFff7900),
      ),
    );
  }
}
