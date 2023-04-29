import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mafqood/core/base_usecases/base_usecase.dart';

import '../../../core/error/auth_error_exception.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_base_repository/auth_base_repository.dart';

class VerifyPhoneUsecase extends BaseUsecase<AuthenticationEntity,VerifyPhoneParameter>{
  final AuthenticationBaseRepository authenticationBaseRepository;

  VerifyPhoneUsecase({required this.authenticationBaseRepository});


  @override
  Future<Either<AuthErrorException, AuthenticationEntity>> call(VerifyPhoneParameter parameters) async{
    return await authenticationBaseRepository.verifyPhone(parameters);
  }
}

class VerifyPhoneParameter extends Equatable{
  final String phone;
  final String code;

  const VerifyPhoneParameter({required this.phone, required this.code});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
