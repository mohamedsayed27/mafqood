import '../../domain/entities/paginated_response_entity.dart';
import 'lost_person_model.dart';

class PaginatedResponsePeopleModel extends PaginatedLostPeopleResponseEntityEntity {
  const PaginatedResponsePeopleModel({
    required super.currentPage,
    required super.pageSize,
    required super.totalPages,
    required super.data,
  });

  factory PaginatedResponsePeopleModel.fromJson(Map<String, dynamic> json) {
    return PaginatedResponsePeopleModel(
      currentPage: json['currentPage'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      data: json["data"].isNotEmpty
          ? List.from(json["data"])
          .map((e) => LostPersonDataModel.fromJson(e))
          .toList()
          : null,
    );
  }
}
