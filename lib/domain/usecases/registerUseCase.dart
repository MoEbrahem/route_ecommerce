import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';
import 'package:route_ecommerce/domain/repository/auth_repository.dart';
@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
