class User {
  final String name;
  final String uid;
  final String photoUrl;
  final String username;
  final String email;
  final String city;
  final String password;
  final String age;
  final String income;

  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.age,
    required this.income,
    required this.city,
    required this.uid,
    this.photoUrl = "", // Add a default value for photoUrl
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "age": age,
        "city": city,
        "income": income
      };
}
