import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/colors_constant.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
  

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height - 200,
                width: width,
                child: Lottie.asset("assets/animation/pizza.json",
                    fit: BoxFit.contain),
              ),
              Spacer(),
              TextLiquidFill(
                text: '\nPizza Hub',
                textAlign: TextAlign.left,

                waveColor: Colors.blue,
                waveDuration: Duration(seconds: 10),

                boxBackgroundColor: ColorConstant.splash,
                textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                boxHeight: 200,
                // boxWidth: 250,
              )
              //   ShaderMask(
              //   // Use ShaderMask to add a gradient to the "Flutter UIX" text
              //   shaderCallback: (Rect bounds) {
              //     return const LinearGradient(
              //       colors: [Color(0xFF0089CF), Color(0xFF00CDBA)],
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //     ).createShader(bounds);
              //   },
              //   child: const Text(
              //     "Pizza Hub",
              //     style: TextStyle(
              //         fontSize: 40,
              //         color: Colors.amber,
              //         fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          )),
    );
  }
}
