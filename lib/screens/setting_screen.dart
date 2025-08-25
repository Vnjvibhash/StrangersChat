import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';
  bool _isActiveUser = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/grey_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient Overlay
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
        // Scaffold with Transparent Background
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Setting Screen',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: <Widget>[
              // Theme Change
              ListTile(
                title: Text(
                  'Change Theme',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = !_isDarkMode;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              const Divider(),

              // Language Change
              ListTile(
                title: Text(
                  'Change Language',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: DropdownButton<String>(
                  value: _selectedLanguage,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  ),
                  elevation: 16,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Divider(),

              // Active User Switch
              ListTile(
                title: Text(
                  'Active User',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isActiveUser = !_isActiveUser;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              const Divider(),

              // Contact Us
              ListTile(
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Contact Us'),
                        content: const Text(
                            'For support, contact us at: support@example.com'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),

              // Privacy Policy
              ListTile(
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Privacy Policy'),
                        content: const Text(
                            'Your privacy is important to us. Read our full policy here.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),

              // Rate Us
              ListTile(
                title: Text(
                  'Rate Us',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Rate Us'),
                        content: const Text(
                            'Please rate our app on the Play Store or App Store.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
