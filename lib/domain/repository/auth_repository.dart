import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:route_ecommerce/domain/entities/loginResponseEntity.dart';
import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Either<Failures, LoginResponseEntity>> login(
    TextEditingController email,
    TextEditingController password,
  );
}
