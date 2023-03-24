import 'package:dartz/dartz.dart';

import '../../core/error/auth_error_exception.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_base_repository.dart';

class ForgetPasswordUsecase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  ForgetPasswordUsecase({required this.authenticationBaseRepository});

  Future<Either<AuthErrorException, AuthenticationEntity>> execute({
    required String phone,
  }) async {
    return await authenticationBaseRepository.forgetPassword(phone: phone);
  }
}
