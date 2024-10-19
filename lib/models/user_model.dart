class User {
  final int id;
  final String name;
  final String bio;
  final String imageUrl;
  final String contactNumber;

  User({
    required this.id,
    required this.name,
    required this.bio,
    required this.imageUrl,
    required this.contactNumber,
  });
}

List<User> users = [
  User(
    id: 0,
    name: 'Current User',
    bio: 'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/vivek.png',
    contactNumber: '9876543210', // Dummy contact number
  ),
  User(
    id: 1,
    name: 'Vivek',
    bio: 'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/vivek.png',
    contactNumber: '9876543211',
  ),
  User(
    id: 2,
    name: 'Amarjeet',
    bio: 'The only time my job is bearable is when I am vacationing',
    imageUrl: 'assets/images/amarjeetkr.png',
    contactNumber: '9876543212',
  ),
  User(
    id: 3,
    name: 'Rishabh',
    bio: 'At the day’s end, I am grateful that my blessings outnumber my problems.',
    imageUrl: 'assets/images/rishabh.png',
    contactNumber: '9876543213',
  ),
  User(
    id: 4,
    name: 'Aradhana',
    bio: 'There is no remote control for life. You have to get up if you want the channel changed.',
    imageUrl: 'assets/images/aradhana.png',
    contactNumber: '9876543214',
  ),
  User(
    id: 5,
    name: 'Olivia',
    bio: 'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/olivia.png',
    contactNumber: '9876543215',
  ),
  User(
    id: 6,
    name: 'Abhishek',
    bio: 'Make sure you are perfect before judging me',
    imageUrl: 'assets/images/abhishek.png',
    contactNumber: '9876543216',
  ),
  User(
    id: 7,
    name: 'Viveka Jee',
    bio: 'Do not squander your opportunities for achieving temporary comfort.',
    imageUrl: 'assets/images/vivekajee.png',
    contactNumber: '9876543217',
  ),
  User(
    id: 8,
    name: 'Sarfaraj',
    bio: 'Your followers may not always be your fans',
    imageUrl: 'assets/images/sarfaraj.png',
    contactNumber: '9876543218',
  ),
];
