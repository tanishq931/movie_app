import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextStyle? heading({
  double size=20,
  bool bold=false
}){
  return GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: bold?FontWeight.bold:FontWeight.normal,
      color: Colors.white

  );
}