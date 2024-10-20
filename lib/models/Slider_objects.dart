class Slide {
  final String imageUrl;
  final String title;
  final String content;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.content,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/logo_transparent.png',
    title: 'Welcome To\nStrangers Chat!',
    content:
        'Join a community of anonymous users and start chatting with strangers around the world. Discover new people and make new connections!',
  ),
  Slide(
    imageUrl: 'assets/images/firstSlide.png',
    title: 'Chat with Strangers',
    content:
        'Our platform offers a safe and engaging space where you can start conversations with people from different cultures and backgrounds. Talk about anything, anytime!',
  ),
  Slide(
    imageUrl: 'assets/images/secondSlide.png',
    title: 'No Information\nRequired',
    content:
        'Start chatting instantly! No personal information needed. Simply connect and communicate without any hassle.',
  ),
  Slide(
    imageUrl: 'assets/images/thirdSlide.png',
    title: 'Digital Chat App',
    content:
        'Stay connected digitally. Our app provides seamless messaging, real-time conversations, and a simple user interface for easy interaction.',
  ),
];
