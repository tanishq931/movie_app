import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextStyle? heading({
  double size=20,
  bool bold=false,
  Color color=Colors.white,
}){
  return GoogleFonts.poppins(
    fontSize: size,
    fontWeight: bold?FontWeight.bold:FontWeight.normal,
      color: color

  );
}