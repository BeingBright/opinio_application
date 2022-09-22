class UserRegistrationDetails {
  String username;
  String email;
  String password;
  String repeatPassword;
  String phoneNumber;

  UserRegistrationDetails(this.username, this.password, this.repeatPassword,
      this.email, this.phoneNumber);

  @override
  String toString() {
    return "UserRegistrationDetails{username : $username , email : $email , phoneNumber : $phoneNumber}";
  }

  UserRegistrationDetails.empty()
      : email = "",
        password = "",
        phoneNumber = "",
        repeatPassword = "",
        username = "";

  void clear() {
    email = "";
    password = "";
    phoneNumber = "";
    repeatPassword = "";
    username = "";
  }

  bool passwordIsEqual() {
    return password == repeatPassword;
  }
}
