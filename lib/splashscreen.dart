import 'dart:async';
import 'package:flutter_application_444/gridex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Replace this with the file containing your next screen (GridEx).

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Start the timer to navigate to the next screen after 3 seconds (3000 milliseconds).
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const GridEx(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.adjust_rounded,
              size: 50,
              color: Colors.amber,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '95 A Terminal  ',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black38,
                  fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
