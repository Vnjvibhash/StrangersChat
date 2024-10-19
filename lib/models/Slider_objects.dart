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
    imageUrl: 'assets/images/firstSlide.png',
    title: 'Chat with Strangers',
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
  ),
  Slide(
    imageUrl: 'assets/images/secondSlide.png',
    title: 'No Hardware',
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',

  ),
  Slide(
    imageUrl: 'assets/images/thirdSlide.png',
    title: 'Digital your Shop',
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
  ),
];