import 'package:dartz/dartz.dart';

import '../../core/error/auth_error_exception.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_base_repository.dart';

class RegisterUsecase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  RegisterUsecase({required this.authenticationBaseRepository});

  Future<Either<AuthErrorException, AuthenticationEntity>> execute({
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    return await authenticationBaseRepository.register(
      password: password,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
