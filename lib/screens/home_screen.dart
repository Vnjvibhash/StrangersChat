import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:strangerschat/router/routes.dart';
import 'package:strangerschat/widgets/drawer_widget.dart';
import 'package:strangerschat/widgets/online_users.dart';
import 'package:strangerschat/widgets/favorite_contacts.dart';
import 'package:strangerschat/widgets/recent_chats.dart';
import 'package:strangerschat/widgets/search_model.dart';
import 'package:strangerschat/models/user_model.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Use in initState');
  }

  void _openSearchModel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SearchModel(users: users);
      },
    );
  }

  // Handle sign-out
  void _logout() async {
    await _googleSignIn.signOut();
    setState(() {
    });
    developer.log('User signed out', name: 'Strangers Chat');
    if(mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Strangers',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 24.0,
                  color: Colors.red,
                  onPressed: () {
                    _openSearchModel(context);
                  },
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Tab(text: "Message"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Tab(text: "Online"),
                  ),
                ],
                labelStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.red.withOpacity(0.7),
                labelColor: Colors.white,
                indicatorColor: Colors.red.withOpacity(0.7),
                indicator: ShapeDecoration(
                  color: Colors.red.withOpacity(0.7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: CustomDrawer(onLogout: _logout),
            body: TabBarView(
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: const Column(
                            children: <Widget>[
                              FavoriteContacts(),
                              RecentChats(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const OnlineUsers(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
