import 'package:flutter/material.dart';
import 'package:strangerschat/models/message_model.dart';
import 'package:strangerschat/router/routes.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter the chats to get only the favorite ones
    List<Message> favoriteChats = chats.where((chat) => chat.isFavorite).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Favorite Contacts',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                  iconSize: 30.0,
                  color: Colors.white70,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favoriteChats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message favorite = favoriteChats[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.chatScreen,
                    arguments: favorite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(favorite.sender.imageUrl),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          favorite.sender.name,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
