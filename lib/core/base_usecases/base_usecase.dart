import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/auth_error_exception.dart';

abstract class  BaseUsecase<T,Parameters>{
  Future<Either<AuthErrorException, T>>call(Parameters parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
