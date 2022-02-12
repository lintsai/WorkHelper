

class UserProfile{
  final String userName;
  final String phoneNumber;

  UserProfile({ required this.phoneNumber, required this.userName});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
    };
  }
}