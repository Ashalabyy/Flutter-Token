import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static final defaultInputDecoration = InputDecoration(
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
    labelStyle: GoogleFonts.nunito(
      color: Colors.orange,
      fontSize: 14,
    ),
    hintStyle: GoogleFonts.nunito(
      color: Colors.white,
      fontSize: 14,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}
