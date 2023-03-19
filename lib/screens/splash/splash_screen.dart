import 'package:flutter/material.dart';
import 'package:gdg_peshawar/screens/home/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // three seconds later, navigate to home screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => HomeScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // title and image  of the app
        Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/gdg pew fb.jpg',
                height: 200, width: 200, fit: BoxFit.scaleDown),
            SizedBox(height: 16.0),
            Text(
              'GDG Peshawar',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 92, 168),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
