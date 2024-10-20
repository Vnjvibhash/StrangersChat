import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:strangerschat/router/routes.dart';

class SignInnScreen extends StatefulWidget {
  const SignInnScreen({super.key});

  @override
  _SignInnScreenState createState() => _SignInnScreenState();
}

class _SignInnScreenState extends State<SignInnScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _loginWithMobileNumber() {
    print("Mobile Number Login");
  }

  void _loginWithGoogle() async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        print("Google Sign-In successful: ${user.displayName}");
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      }
    } catch (error) {
      print("Google Sign-In error: $error");
    }
  }

  // Continue as Guest
  void _continueAsGuest() {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1, vertical: mediaQuery.size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Logo Image
                Image.asset('assets/images/logo_transparent.png'),

                const SizedBox(height: 50),

                SizedBox(height: mediaQuery.size.height * 0.02),

                SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.06,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: _loginWithMobileNumber,
                    backgroundColor: Colors.green,
                    label: const Text(
                      'Login With Mobile Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Google Sign-In Button
                SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.06,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: _loginWithGoogle,
                    backgroundColor: Colors.white,
                    label: const Text(
                      'Login With Google',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                
                SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.06,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: _continueAsGuest,
                    backgroundColor: Colors.red,
                    label: const Text(
                      'Continue as Guest',
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
          ),
        ),
      ],
    );
  }
}
