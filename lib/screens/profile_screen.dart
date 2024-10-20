import 'package:flutter/material.dart';
import 'package:strangerschat/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the current user (assuming id: 0 is the current user)
    final User currentUser = users.firstWhere((user) => user.id == 0);

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Profile Screen',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            elevation: 0.0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(currentUser.imageUrl),
                ),
                const SizedBox(height: 16.0),
        
                // Name
                Text(
                  currentUser.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
        
                // Bio
                Text(
                  currentUser.bio,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
        
                // Contact Information (Phone)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    leading: const Icon(Icons.phone, color: Colors.red),
                    title: const Text(
                      'Contact Number',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      currentUser.contactNumber,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
        
                // Email Information
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    leading: const Icon(Icons.email, color: Colors.red),
                    title: const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      currentUser.email,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
        
                // Address Information
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.red),
                    title: const Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      currentUser.address,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
        
                // Location (Latitude and Longitude)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.red),
                    title: const Text(
                      'Location (Latitude, Longitude)',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Latitude: ${currentUser.latitude}, Longitude: ${currentUser.longitude}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
