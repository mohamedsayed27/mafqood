import 'package:equatable/equatable.dart';

import 'lost_person_data_entity.dart';

class PaginatedLostPeopleResponseEntityEntity extends Equatable {
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final List<LostPersonDataEntity>? data;

  const PaginatedLostPeopleResponseEntityEntity({
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        currentPage,
        pageSize,
        totalPages,
        data,
      ];
}