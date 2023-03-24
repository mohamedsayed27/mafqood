import 'package:dartz/dartz.dart';

import '../../core/error/auth_error_exception.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_base_repository.dart';

class ResetPasswordUsecase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  ResetPasswordUsecase({required this.authenticationBaseRepository});

  Future<Either<AuthErrorException, AuthenticationEntity>> execute({
    required String password,
    required String phone,
    required String code,
  }) async {
    return await authenticationBaseRepository.resetPassword(
      password: password,
      phone: phone,
      code: code,
    );
  }
}
