import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class mIddle_part_widget extends StatelessWidget {
  const mIddle_part_widget({
    super.key,
    required this.width,
    required this.widget,
  });

  final double width;
  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.bottom,
                  child: Icon(
                    Icons.alarm_sharp,
                    color: Colors.red.shade800,
                    size: 22,
                  )),
              TextSpan(
                text: '15 Mins',
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: width * 0.06,
              )),
              WidgetSpan(
                  alignment: PlaceholderAlignment.bottom,
                  child: Lottie.asset("assets/animation/flame.json")),
              TextSpan(
                text: '32 0 Kal',
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        RichText(
            text: TextSpan(children: [
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Lottie.asset(
                  width: 46, height: 65, "assets/animation/star.json")),
          TextSpan(children: [
            TextSpan(
              text: '${widget.pizzaItem!.rating} ',
              style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '(1.7K Reviews)',
              style: GoogleFonts.tajawal(
                  color: Color(0xFF7F7F7F),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ]))
      ],
    );
  }
}
