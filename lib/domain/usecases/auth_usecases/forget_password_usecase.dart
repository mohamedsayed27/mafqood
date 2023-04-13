import 'package:dartz/dartz.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_base_repository/auth_base_repository.dart';

class ForgetPasswordUsecase extends BaseUsecase<AuthenticationEntity,String>{
  final AuthenticationBaseRepository authenticationBaseRepository;

  ForgetPasswordUsecase({required this.authenticationBaseRepository});

  @override
  Future<Either<AuthErrorException, AuthenticationEntity>> call(String parameters) async {
    return await authenticationBaseRepository.forgetPassword(phone: parameters);
  }
}

