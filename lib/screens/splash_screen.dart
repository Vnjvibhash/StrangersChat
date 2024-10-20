import 'package:flutter/material.dart';
import 'package:strangerschat/screens/walk_through_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const WalkThroughSlider()),
      (Route<dynamic> route) =>
          false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/grey_bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFFFFFFFF),
                    Color(0XFFFF0E0E),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Image.asset(
                      'assets/images/logo_transparent.png',
                      height: screenHeight * 0.42,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.40,
                        alignment: Alignment.bottomLeft,
                        child: Image.asset('assets/images/makeInIndia.png'),
                      ),
                      Container(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.40,
                        alignment: Alignment.bottomRight,
                        child: Image.asset('assets/images/digitalIndia.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
