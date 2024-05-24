import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: height * 0.8,
            child: Lottie.asset(
              height: height,
              "assets/images/splash_animation.json",
              width: width,
              alignment: Alignment.center,
            ),
          ),
          const Text(
            "Welcome to NxCar ",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
