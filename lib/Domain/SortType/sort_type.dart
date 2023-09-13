import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort_type.g.dart';

@riverpod
SortType sortType(SortTypeRef ref) {
  return SortType.createdAt;
}

enum SortType {
  createdAt('登録日時'),
  emergencyTimesPrimary('緊急度×重要度');

  const SortType(this.typeName);

  final String typeName;
  List<String> get sortTypeList =>
      [SortType.createdAt.typeName, SortType.emergencyTimesPrimary.typeName];
}
