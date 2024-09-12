import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/domain/entities/loginResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';
import 'package:route_ecommerce/domain/repository/auth_repository.dart';
@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
    
    TextEditingController email,
    TextEditingController password,
  ) {
    return authRepository.login(email, password);
  }
}
