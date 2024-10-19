import 'package:flutter/material.dart';
import 'package:strangerschat/screens/chat_screen.dart';
import 'package:strangerschat/screens/home_screen.dart';
import 'package:strangerschat/screens/profile_screen.dart';
import 'package:strangerschat/screens/setting_screen.dart';
import 'package:strangerschat/screens/splash_screen.dart';
import 'package:strangerschat/screens/walk_through_slider.dart';
import 'package:strangerschat/screens/welcome_screen.dart';
import 'package:strangerschat/models/message_model.dart';

class AppRoutes {
  // Define the routes
  static const String homeScreen = '/home';
  static const String chatScreen = '/chat';
  static const String profileScreen = '/profile';
  static const String settingScreen = '/settings';
  static const String splashScreen = '/splash';
  static const String walkThroughSlider = '/walkthrough';
  static const String welcomeScreen = '/welcome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case walkThroughSlider:
        return MaterialPageRoute(builder: (_) => const WalkThroughSlider());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case chatScreen:
        final Message message = settings.arguments as Message; // Get the passed message
        return MaterialPageRoute(builder: (_) => ChatScreen(user: message.sender)); // Pass message sender
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());  // Default fallback
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
