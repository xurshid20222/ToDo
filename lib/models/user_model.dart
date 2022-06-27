import 'dart:math';

class User {
  late String fullName;
  late String email;

  User(this.fullName, this.email);

  User.fromJon(Map<String, dynamic> json){
    fullName = json['fullName'];
    email = json['email'];
  }

  @override
  bool operator == (Object other) {
    return other is User && other.email == email && other.fullName == fullName;
  }

  @override
  int get hashCode => Object.hash(email, fullName);

  @override
  String toString() {
    return "Fullname: $fullName\nEmail: $email; ";
  }


}