import 'package:dartz/dartz.dart';

import '../../core/error/auth_error_exception.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_base_repository.dart';

class LoginUsecase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  LoginUsecase({required this.authenticationBaseRepository});

  Future<Either<AuthErrorException, AuthenticationEntity>> execute({required String password, required String phone}) async{
    return await authenticationBaseRepository.login(password: password, phone: phone);
  }
}