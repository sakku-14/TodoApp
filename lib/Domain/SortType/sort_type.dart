import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort_type.g.dart';

@riverpod
class SortType extends _$SortType {
  @override
  SortState build() => SortState.createdAt;

  void update(SortState newState) => state = newState;
}

enum SortState {
  createdAt('登録日時'),
  emergencyTimesPrimary('緊急度×重要度');

  const SortState(this.typeName);
  final String typeName;

  factory SortState.fromName(String name) {
    switch (name) {
      case '登録日時':
        return SortState.createdAt;
      case '緊急度×重要度':
        return SortState.emergencyTimesPrimary;
    }
    return SortState.createdAt;
  }
  List<String> get sortTypeList =>
      [SortState.createdAt.typeName, SortState.emergencyTimesPrimary.typeName];
}
