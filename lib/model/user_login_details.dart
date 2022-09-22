class UserLoginDetails {
  String password;
  String username;

  UserLoginDetails(this.username, this.password);

  @override
  String toString() {
    return "UserLoginDetails{username : $username}";
  }

  void clear() {
    password = "";
    username = "";
  }
}
