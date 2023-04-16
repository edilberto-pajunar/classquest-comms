class UserModel {
  final String email;
  final String password;
  final String username;
  final String? id;

  UserModel({
    required this.email,
    required this.password,
    required this.username,
    this.id,
  });

  toJson() {
    return {
      "Name": username,
      "Email": email,
      "Password": password,
    };
  }
}
