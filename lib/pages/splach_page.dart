import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sec9/pages/home_page.dart';


class SplachPage extends StatelessWidget {
  const SplachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white, 
      animationDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 1),
      // backgroundImage: Image.asset('assets/images/back.jpg'),
      gradient:const RadialGradient(colors: [
        Colors.blueAccent, 
        Colors.greenAccent
      ]),
      childWidget: SizedBox(
        width: 200, 
        height: 200, 
        child: Image.asset('assets/images/logo4.jpg'),
      ),
      nextScreen:const HomePage(),
    );
  }
}
