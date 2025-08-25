import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutDialog({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onLogout();
          },
          child: const Text('Yes, Logout'),
        ),
      ],
    );
  }
}
