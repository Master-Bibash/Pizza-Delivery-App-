import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center, backgroundColor: Colors.black),
        clipBehavior: Clip.antiAlias,
        onPressed: ontap,
        child: Text(
          text,
          textAlign: TextAlign.end,
          style: GoogleFonts.tajawal(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
