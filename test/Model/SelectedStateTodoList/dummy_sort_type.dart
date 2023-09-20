import 'package:todo_app/Model/SortType/sort_type.dart';

class DummySortTypeCreatedAt extends SortType {
  @override
  SortState build() {
    return SortState.createdAt;
  }
}

class DummySortTypeEmergencyTimesPrimary extends SortType {
  @override
  SortState build() {
    return SortState.emergencyTimesPrimary;
  }
}
