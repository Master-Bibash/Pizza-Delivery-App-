 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row CartItemMiddlePart({
    required String title,
    required int order,
    required BuildContext context,
    String? doller,
    Color? color,
    double? Fsize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
              color: color ?? Theme.of(context).primaryColor.withOpacity(0.5),
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
        RichText(
            textAlign: TextAlign.center,
            //  strutStyle: StrutStyle(),
            text: TextSpan(children: [
              TextSpan(
                text: doller ?? '',
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "${order}",
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: Fsize ?? 27,
                    fontWeight: FontWeight.bold),
              )
            ])),
      ],
    );
  }
