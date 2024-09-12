// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/data/apiManager.dart';
import 'package:route_ecommerce/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:route_ecommerce/data/end_points.dart';
import 'package:route_ecommerce/data/model/loginResponse.dart';
import 'package:route_ecommerce/data/model/registerResponse.dart';
import 'package:route_ecommerce/domain/entities/loginResponseEntity.dart';
import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
  try {
    // var checkResults = await Connectivity().checkConnectivity();
    // if (checkResults == ConnectivityResult.mobile ||
    //     checkResults == ConnectivityResult.wifi || 
    //     checkResults == ConnectivityResult.ethernet) {

      var response = await apiManager.postData(
        
        EndPoints.register,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        },
      );
      var registerResponse = RegisterResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errMessage: registerResponse.message!));
      }
    
    // } else {
    //   return Left(
    //     NetworkError(errMessage: 'No internet Connection , '
    //     'Please your check internet.'),
    //   );
    // }
  } catch (e) {
      return Left(Failures(errMessage: e.toString()));
}
  }
  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      TextEditingController email, TextEditingController password) async {
    try {
    // var checkResults = await Connectivity().checkConnectivity();
    // if (checkResults == ConnectivityResult.mobile ||
    //     checkResults == ConnectivityResult.wifi
    //     ) {
      var response = await apiManager.postData(
        
        EndPoints.login,
        body: {
          "email": email.text,
          "password": password.text,
        },
      );
      var loginResponse = LoginResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errMessage: loginResponse.message!),);
      }
    // } else {
    //   return Left(
    //     NetworkError(errMessage: "No internet Connection , Please your check internet."),
    //   );
    // }
  } catch (e) {
      return Left(Failures(errMessage: e.toString()));
}
  }
  
}
