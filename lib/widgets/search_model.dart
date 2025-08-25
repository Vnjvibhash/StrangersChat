import 'package:flutter/material.dart';
import 'package:strangerschat/models/user_model.dart';
import 'package:strangerschat/models/message_model.dart'; // Import your message model
import 'package:strangerschat/router/routes.dart';

class SearchModel extends StatefulWidget {
  final List<User> users;  // Accept the list of users as a parameter

  const SearchModel({super.key, required this.users});

  @override
  _SearchModelState createState() => _SearchModelState();
}

class _SearchModelState extends State<SearchModel> {
  final TextEditingController _searchController = TextEditingController();
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;
  }

  // Function to filter the user list based on the search query
  void _filterUsers(String query) {
    setState(() {
      filteredUsers = widget.users
          .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: _filterUsers,
            decoration: InputDecoration(
              labelText: 'Search Users...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(filteredUsers[index].imageUrl),
                  ),
                  title: Text(filteredUsers[index].name),
                  subtitle: Text(filteredUsers[index].bio),
                  onTap: () {
                    Navigator.pop(context);
                    Message message = Message(
                      sender: filteredUsers[index],
                      time: DateTime.now().toString(),
                      text: "Hey, how's it going?",
                      isLiked: false,
                      unread: true,
                      isFavorite: false,
                      isRecent: true,
                      isOnline: true,
                    );
          
                    Navigator.pushNamed(
                      context,
                      AppRoutes.chatScreen,
                      arguments: message,  // Pass the Message object
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
