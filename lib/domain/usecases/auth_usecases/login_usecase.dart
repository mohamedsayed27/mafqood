import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_base_repository/auth_base_repository.dart';

class LoginUsecase extends BaseUsecase<AuthenticationEntity,LoginParameter>{
  final AuthenticationBaseRepository authenticationBaseRepository;

  LoginUsecase({required this.authenticationBaseRepository});

  @override
  Future<Either<AuthErrorException, AuthenticationEntity>> call(LoginParameter parameters) async{
    return await authenticationBaseRepository.login(parameters);
  }
}

class LoginParameter extends Equatable{
  final String password;
  final String phone;

  const LoginParameter({required this.password, required this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [
    password,
    phone
  ];

}