import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:route_ecommerce/domain/entities/loginResponseEntity.dart';
import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';
import 'package:route_ecommerce/domain/repository/auth_repository.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(TextEditingController email, TextEditingController password) async {
    var either = await authRemoteDataSource.login(
        email, password);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
