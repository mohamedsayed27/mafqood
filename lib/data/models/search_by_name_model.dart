import '../../domain/entities/search_by_name_entity.dart';
import 'lost_person_model.dart';

class SearchByNameModel extends SearchByNameEntity {
  const SearchByNameModel({
    required super.status,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory SearchByNameModel.fromJson(Map<String, dynamic> json) {
    return SearchByNameModel(
      status: json['status'],
      message: json['message'],
      data: json['data'].isNotEmpty
          ? List.from(json["data"]).map((e) => LostPersonDataModel.fromJson(json['data'])).toList()
          : null,
      errors: json['errors'] != null ? json['errors'].cast<String>() : null,
    );
  }
}