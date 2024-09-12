class LoginResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;

  LoginResponseEntity({this.message, this.user, this.token, this.statusMsg});

}

class UserEntity {
  String? name;
  String? email;

  UserEntity({this.name, this.email});


}
