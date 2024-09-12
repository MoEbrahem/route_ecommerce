import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity{


  RegisterResponseDto({super.message, super.user, super.token});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  
}

class UserDto extends UserEntity{

  String? role;

  UserDto({super.name, super.email, this.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}