import 'package:flutter/material.dart';
import 'package:strangerschat/models/message_model.dart';
import 'package:strangerschat/router/routes.dart';

class OnlineUsers extends StatelessWidget {
  const OnlineUsers({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> onlineUsers = chats.where((chat) => chat.isOnline).toList();

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = onlineUsers[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.chatScreen,
                  arguments: chat,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: chat.unread ? const Color(0xFFFFEFEE) : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                    title: Text(
                      chat.sender.name,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      chat.text,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          chat.time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        chat.unread
                            ? Container(
                          width: 40.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
