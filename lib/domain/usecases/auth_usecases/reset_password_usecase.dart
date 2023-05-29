import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_base_repository/auth_base_repository.dart';

class ResetPasswordUsecase extends BaseUsecase<AuthenticationEntity,ResetPasswordParameters> {
  final AuthenticationBaseRepository authenticationBaseRepository;

  ResetPasswordUsecase({required this.authenticationBaseRepository});



  @override
  Future<Either<ErrorException, AuthenticationEntity>> call(ResetPasswordParameters parameters) async{
    return await authenticationBaseRepository.resetPassword(parameters);
  }
}

class ResetPasswordParameters extends Equatable {
  final String password;
  final String phone;
  final String code;

  const ResetPasswordParameters(
      {required this.password, required this.phone, required this.code});

  @override
  // TODO: implement props
  List<Object?> get props => [
        password,
        phone,
        code,
      ];
}
