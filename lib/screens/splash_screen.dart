import 'package:flutter/material.dart';
import 'package:strangerschat/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
     _navigateToHome();
  }
  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 3000),(){});
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XFFFFFFFF),
                Color(0XFFFF0E0E),
              ]
          ),
        ),
        child: Stack(
            children:[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.355),
                        child:
                        Image.asset('assets/images/logo.png',
                        height: 100,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.19,),
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            width: 240,
                            alignment: Alignment.bottomLeft,
                            child:
                            Image.asset('assets/images/makeInIndia.png',)
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            width: 149,
                            alignment: Alignment.bottomRight,
                            child:
                            Image.asset('assets/images/digitalIndia.png',)
                        ),
                      ],
                    )
                  ]
              ),
            ]
        )
    );

  }
}