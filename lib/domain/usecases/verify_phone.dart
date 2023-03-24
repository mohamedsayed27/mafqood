import 'package:dartz/dartz.dart';

import '../../core/error/auth_error_exception.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_base_repository.dart';

class VerifyPhoneUsecase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  VerifyPhoneUsecase({required this.authenticationBaseRepository});

  Future<Either<AuthErrorException, AuthenticationEntity>> execute({
    required String phone,
    required String code,
  }) async {
    return await authenticationBaseRepository.verifyPhone(
      code: code,
      phone: phone,
    );
  }
}
