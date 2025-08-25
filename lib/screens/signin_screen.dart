import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:strangerschat/router/routes.dart';
import 'package:strangerschat/widgets/otp_box.dart'; // Import OtpBox widget
import 'dart:developer' as developer;

import 'package:strangerschat/widgets/show_snackbar.dart';

class SignInnScreen extends StatefulWidget {
  const SignInnScreen({super.key});

  @override
  _SignInnScreenState createState() => _SignInnScreenState();
}

class _SignInnScreenState extends State<SignInnScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  bool _isOtpVisible = false;
  bool _isRecievedOTP = false;
  bool _isOtpVerified = false;
  var _verification = "";

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        developer.log('User signed in: ${account.displayName}',
            name: 'Strangers Chat');
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        }
      }
    });
    _googleSignIn.signInSilently();
  }

  void _loginWithMobileNumber() async {
    setState(() {
      _isRecievedOTP = true;
    });
    developer.log('Mobile Number Login', name: 'Strangers Chat');

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        developer.log(error.toString(), name: 'Strangers Chat');
      },
      codeSent: (verificationId, forceResendingToken) {
        showSnackbar(
            context, "OTP Sent $verificationId & $forceResendingToken");
        setState(() {
          _isOtpVisible = true;
          _isRecievedOTP = false;
          _verification = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        developer.log("Auto Retireval timeout", name: 'Strangers Chat');
      },
    );
  }

  void _verifyOtp() async {
    setState(() {
      _isOtpVerified = true;
    });
    String otp = _otpControllers.map((controller) => controller.text).join();
    developer.log('OTP Verified: $otp', name: 'Strangers Chat');
    showSnackbar(context, "OTP Verified");
    try {
      final cred = PhoneAuthProvider.credential( verificationId: _verification, smsCode: otp);
      await FirebaseAuth.instance.signInWithCredential(cred);
      setState(() {
        _isOtpVerified = false;
      });
    } catch (e) {
      setState(() {
        _isOtpVerified = false;
      });
      developer.log(e.toString(), name: 'Strangers Chat');
    }
  }

  void _loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      developer.log('Google Sign-In error: $error', name: 'Strangers Chat');
    }
  }

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
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.1,
                vertical: mediaQuery.size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/logo_transparent.png'),
                SizedBox(height: mediaQuery.size.height * 0.02),

                // Phone Number Input
                if (!_isOtpVisible) ...[
                  SizedBox(
                    width: mediaQuery.size.width * 0.8,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        labelText: _phoneController.text.isEmpty
                            ? '+91 1234567890'
                            : null,
                        labelStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: mediaQuery.size.width * 0.8,
                    height: mediaQuery.size.height * 0.05,
                    child: _isRecievedOTP
                        ? const CircularProgressIndicator()
                        : FloatingActionButton.extended(
                            heroTag: null,
                            onPressed: _loginWithMobileNumber,
                            backgroundColor: Colors.green,
                            label: const Text(
                              'Login With OTP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                  ),
                ],

                // OTP Fields
                if (_isOtpVisible) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return OtpBox(controller: _otpControllers[index]);
                    }),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: mediaQuery.size.width * 0.8,
                    height: mediaQuery.size.height * 0.05,
                    child: _isOtpVerified
                        ? const CircularProgressIndicator()
                        : FloatingActionButton.extended(
                            heroTag: null,
                            onPressed: _verifyOtp,
                            backgroundColor: Colors.green,
                            label: const Text(
                              'Verify OTP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                  ),
                ],

                const SizedBox(height: 25),

                // Google Sign-In Button
                SizedBox(
                  width: mediaQuery.size.width * 0.8,
                  height: mediaQuery.size.height * 0.05,
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

                // Continue as Guest Button
                SizedBox(
                  width: mediaQuery.size.width * 0.8,
                  height: mediaQuery.size.height * 0.05,
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
