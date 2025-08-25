import 'package:strangerschat/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  final bool isFavorite;
  final bool isRecent;
  final bool isOnline;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
    required this.isFavorite,
    required this.isRecent,
    required this.isOnline,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: users[7], // Viveka Jee
    time: '5:30 PM',
    text: 'Hey, how\'s everything going? Have you finished that project yet?',
    isLiked: false,
    unread: true,
    isFavorite: false,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[2], // Amarjeet
    time: '4:30 PM',
    text: 'I finally found that movie we were talking about! Have you seen it yet?',
    isLiked: false,
    unread: true,
    isFavorite: false,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[3], // Rishabh
    time: '3:30 PM',
    text: 'How was your day? Mine was pretty productive, got a lot done!',
    isLiked: false,
    unread: false,
    isFavorite: true,
    isRecent: false,
    isOnline: true,
  ),
  Message(
    sender: users[6], // Abhishek
    time: '2:30 PM',
    text: 'I think I\'m getting a cold. Just been resting all day, how about you?',
    isLiked: false,
    unread: true,
    isFavorite: false,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[5], // Olivia
    time: '1:30 PM',
    text: 'Did you hear the news about the concert next month? We should go!',
    isLiked: false,
    unread: false,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[4], // Aradhana
    time: '12:30 PM',
    text: 'I just tried that new restaurant downtown. The food was amazing!',
    isLiked: false,
    unread: false,
    isFavorite: true,
    isRecent: false,
    isOnline: true,
  ),
  Message(
    sender: users[8], // Sarfaraj
    time: '11:30 AM',
    text: 'Got some new books today! Can\'t wait to start reading them this weekend.',
    isLiked: false,
    unread: false,
    isFavorite: false,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[1], // Vivek
    time: '01:30 AM',
    text: 'Just finished my workout. Feeling great, let\'s catch up soon!',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: false,
    isOnline: true,
  ),
];


List<Message> messages = [
  Message(
    sender: users[7], // Viveka Jee
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[0], // Current User
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[0], // Current User
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  // Additional messages
  Message(
    sender: users[0], // Current User
    time: '1:30 PM',
    text: 'Do you like spicy food?',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '1:00 PM',
    text: 'I love spicy food! It\'s the best.',
    isLiked: true,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '12:30 PM',
    text: 'By the way, I saw a great movie yesterday. Have you watched "The Secret"?',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[0], // Current User
    time: '12:00 PM',
    text: 'No, I haven\'t watched it yet. Is it good?',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[7], // Viveka Jee
    time: '11:30 AM',
    text: 'It\'s amazing! You should definitely check it out.',
    isLiked: true,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
  Message(
    sender: users[0], // Current User
    time: '11:00 AM',
    text: 'I will, I will! Thanks for the suggestion.',
    isLiked: false,
    unread: true,
    isFavorite: true,
    isRecent: true,
    isOnline: true,
  ),
];



