import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_base_repository/auth_base_repository.dart';

class RegisterUsecase
    extends BaseUsecase<AuthenticationEntity, RegisterParameter> {
  final AuthenticationBaseRepository authenticationBaseRepository;

  RegisterUsecase({required this.authenticationBaseRepository});

  @override
  Future<Either<AuthErrorException, AuthenticationEntity>> call(
      RegisterParameter parameters) async {
    return await authenticationBaseRepository.register(parameters);
  }
}

class RegisterParameter extends Equatable {
  final String password;
  final String phone;
  final String firstName;
  final String lastName;

  const RegisterParameter({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        password,
        phone,
        lastName,
        firstName,
      ];
}
