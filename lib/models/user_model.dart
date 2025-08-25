class User {
  final int id;
  final String name;
  final String bio;
  final String imageUrl;
  final String contactNumber;
  final String email;
  final String address;
  final double latitude;
  final double longitude;

  User({
    required this.id,
    required this.name,
    required this.bio,
    required this.imageUrl,
    required this.contactNumber,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

List<User> users = [
  User(
    id: 0,
    name: 'Current User',
    bio:
        'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/vivek.png',
    contactNumber: '9876543210',
    email: 'current.user@gmail.com',
    address: '123 Main Street, Cityville',
    latitude: 28.7041,
    longitude: 77.1025,
  ),
  User(
    id: 1,
    name: 'Vivek',
    bio:
        'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/vivek.png',
    contactNumber: '9876543211',
    email: 'vivek.kumar@gmail.com',
    address: '456 Second Street, Townsville',
    latitude: 19.0760,
    longitude: 72.8777,
  ),
  User(
    id: 2,
    name: 'Amarjeet',
    bio: 'The only time my job is bearable is when I am vacationing',
    imageUrl: 'assets/images/amarjeetkr.png',
    contactNumber: '9876543212',
    email: 'amarjeet@gmail.com',
    address: '789 Third Avenue, Villagetown',
    latitude: 13.0827,
    longitude: 80.2707,
  ),
  User(
    id: 3,
    name: 'Rishabh',
    bio:
        'At the day’s end, I am grateful that my blessings outnumber my problems.',
    imageUrl: 'assets/images/rishabh.png',
    contactNumber: '9876543213',
    email: 'rishabh.m@gmail.com',
    address: '12 Boulevard Street, Metropolis',
    latitude: 22.5726,
    longitude: 88.3639,
  ),
  User(
    id: 4,
    name: 'Aradhana',
    bio:
        'There is no remote control for life. You have to get up if you want the channel changed.',
    imageUrl: 'assets/images/aradhana.png',
    contactNumber: '9876543214',
    email: 'aradhana.k@gmail.com',
    address: '34 Fourth Lane, Uptown',
    latitude: 12.9716,
    longitude: 77.5946,
  ),
  User(
    id: 5,
    name: 'Olivia',
    bio:
        'Move over “I Love You”. “Salary Credited” is the most powerful word now.',
    imageUrl: 'assets/images/olivia.png',
    contactNumber: '9876543215',
    email: 'olivia.b@gmail.com',
    address: '56 Fifth Road, Capital City',
    latitude: 40.7128,
    longitude: -74.0060,
  ),
  User(
    id: 6,
    name: 'Abhishek',
    bio: 'Make sure you are perfect before judging me',
    imageUrl: 'assets/images/abhishek.png',
    contactNumber: '9876543216',
    email: 'abhishek.s@gmail.com',
    address: '78 Sixth Avenue, Downtown',
    latitude: 51.5074,
    longitude: -0.1278,
  ),
  User(
    id: 7,
    name: 'Viveka Jee',
    bio: 'Do not squander your opportunities for achieving temporary comfort.',
    imageUrl: 'assets/images/vivekajee.png',
    contactNumber: '9876543217',
    email: 'viveka.j@gmail.com',
    address: '90 Seventh Boulevard, Cosmopolitan',
    latitude: 35.6895,
    longitude: 139.6917,
  ),
  User(
    id: 8,
    name: 'Sarfaraj',
    bio: 'Your followers may not always be your fans',
    imageUrl: 'assets/images/sarfaraj.png',
    contactNumber: '9876543218',
    email: 'sarfaraj.s@gmail.com',
    address: '12 Eight Street, Sunnyville',
    latitude: 34.0522,
    longitude: -118.2437,
  ),
];
