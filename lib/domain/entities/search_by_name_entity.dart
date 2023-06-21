import 'package:equatable/equatable.dart';

import 'lost_person_data_entity.dart';

class SearchByNameEntity extends Equatable {
  final int? status;
  final String? message;
  final List<LostPersonDataEntity>? data;
  final List<String>? errors;

  const SearchByNameEntity({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    data,
    errors,
  ];

// LostPersonModel.fromJson(Map<String, dynamic> json) {
//   status = json['status'];
//   message = json['message'];
//   data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   errors = json['errors'].cast<String>();
// }
}