import 'package:flutter/material.dart';
import 'package:strangerschat/router/routes.dart';
import 'package:strangerschat/widgets/logout_model.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onLogout;

  const CustomDrawer({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/images/vivek.png'),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Vivek Kumar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "vivek.kumar.cipl@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
          ListTile(
            iconColor: Colors.redAccent,
            title: const Row(
              children: [
                Icon(Icons.person, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.profileScreen);
            },
          ),
          ListTile(
            iconColor: Colors.redAccent,
            title: const Row(
              children: [
                Icon(Icons.settings, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.settingScreen);
            },
          ),
          ListTile(
            iconColor: Colors.redAccent,
            title: const Row(
              children: [
                Icon(Icons.logout, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LogoutDialog(
                      onLogout: onLogout);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

