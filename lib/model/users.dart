class User {
  String id;
  String fullName;
  String age;

  User({required this.id, required this.fullName, required this.age});

  User.fromJson(Map json)
      : fullName = json['fullName'],
        id = json['id'],
        age = json['age'];
}
