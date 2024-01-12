import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/detail_screen/Components/Button_Widgets.dart';
import 'package:flutter_application_1/view/main_screen/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Button_widget_with_animation_widget extends StatelessWidget {
  const Button_widget_with_animation_widget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: "Add To Cart",
      ontap: () => showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width,
                      height: height * 0.7,
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(bottom: 80),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "Thank you for",
                            style: GoogleFonts.ubuntu(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                          Text(
                            "your Order !",
                            style: GoogleFonts.ubuntu(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                          Lottie.asset(
                            "assets/animation/thank4.json",
                          ),
                          Text(
                            "Your pizza will arrive in",
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF5e5e60),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          TweenAnimationBuilder<Duration>(
                              duration: Duration(minutes: 30),
                              tween: Tween(
                                  begin: Duration(minutes: 30),
                                  end: Duration.zero),
                              onEnd: () {
                                Text("Your order has come at your door step");
                              },
                              builder: (BuildContext con, Duration value,
                                  Widget? child) {
                                final minutes = value.inMinutes;
                                final seconds = value.inSeconds % 60;
                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.timer_outlined),
                                        Text(
                                          '$minutes:$seconds Mins',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.ubuntu(
                                              color: Color(0xFF6b6b6b),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        )
                                      ],
                                    ));
                              }),

                          // Spacer(),
                          // Text(
                          //   "Click below to go back",
                          //   textAlign: TextAlign.center,
                          //   style: GoogleFonts.ubuntu(
                          //       color: Color(0xFF6b6b6b).withOpacity(0.5),
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 15),
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: Icon(Icons.back_hand),
                          // )
                          // SizedBox(height: 12,),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: ElevatedButton(
                                      autofocus: false,
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Continue",
                                        style: GoogleFonts.ubuntu(
                                            color: Color(0xFF727272),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MainScreenPage(),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFee3964),
                                    elevation: 0,
                                  ),
                                  child: RichText(

                                      // textAlign: TextAlign.end,
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "Home ",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    // WidgetSpan(child: sp),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                        Icons.east,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  ])))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderButtonWidget extends StatelessWidget {
  const OrderButtonWidget({
    super.key,
    required this.text,
    this.backcolor,
    this.txtColor,
    this.ontap,
  });
  final String text;
  final Color? backcolor;
  final Color? txtColor;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: ElevatedButton(
            autofocus: false,
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: backcolor),
            onPressed: () {},
            child: Text(
              "$text",
              style: GoogleFonts.ubuntu(
                  color: txtColor ?? Color(0xFF727272),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )),
      ),
    );
  }
}
