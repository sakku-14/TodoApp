import 'package:todo_app/model/model.dart';

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
