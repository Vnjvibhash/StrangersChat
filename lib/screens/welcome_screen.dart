import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strangerschat/router/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/grey_bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Logo Image
              Image.asset('assets/images/logo.png'),

              const SizedBox(height: 100),

              // Welcome Text
              Text(
                'Welcome To \nStrangers Chat!',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: mediaQuery.size.height * 0.03),

              // Description Text
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.07,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: mediaQuery.size.height * 0.03),

              // Floating Action Button (Continue)
              SizedBox(
                width: mediaQuery.size.width * 0.7,
                height: mediaQuery.size.height * 0.06,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.walkThroughSlider);
                  },
                  backgroundColor: Colors.red,
                  label: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
            ],
          ),
        ],
      ),
    );
  }
}
