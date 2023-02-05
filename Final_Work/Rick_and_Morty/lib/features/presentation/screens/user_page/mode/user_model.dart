// Model User
class User {
  final String imagePath;
  final String name;
  final String email;
  final String isDartMode;

  User(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.isDartMode});

  User copy(
          {String? imagePath,
          String? name,
          String? email,
          String? isDartMode}) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        isDartMode: isDartMode ?? this.isDartMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        isDartMode: json['isDartMode'],
      );
  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'isDartMode': isDartMode,
      };
}
