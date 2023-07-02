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
    List<LostPersonDataModel> list = [];
    json['data'].forEach((element){
      list.add(LostPersonDataModel.fromJson(element));
    });
    return SearchByNameModel(
      status: json['status'],
      message: json['message'],
      data: list.isNotEmpty
          ? list
          : null,
      errors: json['errors']?.cast<String>(),
    );
  }
}