import 'package:equatable/equatable.dart';

class BasicSuccessResponseEntity extends Equatable {
  final int status;
  final String message;
  final String data;
  final List<String> errors;

  const BasicSuccessResponseEntity({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];
}
