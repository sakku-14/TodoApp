import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';

import 'dummy_sort_type.dart';
import 'dummy_todo_list.dart';

void main() {
  /// 緊急度x重要度のソート順であればtrueを返す
  bool isEmergencyTimesPrimaryOrder(Todo a, Todo b) {
    final aPoint = a.emergencyPoint * a.priorityPoint;
    final bPoint = b.emergencyPoint * b.priorityPoint;

    if (aPoint > bPoint) {
      return true; // 緊急度x重要度の値でソートされていればtrue
    } else if (aPoint == bPoint) {
      if (a.emergencyPoint > b.emergencyPoint) {
        return true; // 緊急度の値でソートされていればtrue
      } else if (a.emergencyPoint == b.emergencyPoint) {
        if (a.createAt.isBefore(b.createAt)) {
          return true; // 作成日時でソートされていればtrue
        }
      }
    }

    return false;
  }

  group('未着手', () {
    test('未着手のTodoリストが取得できること_登録日順', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider.overrideWith(() => DummySortTypeCreatedAt()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.notBegin));

      // then
      var behindTodoCreateAt = DateTime(0);
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.notBegin, element.status); // 未着手のTodoであること
        expect(behindTodoCreateAt.compareTo(element.createAt),
            lessThanOrEqualTo(0)); // 登録日順であること
        behindTodoCreateAt = element.createAt;
      }
    });

    test('未着手のTodoリストが取得できること_緊急度x重要度', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider
              .overrideWith(() => DummySortTypeEmergencyTimesPrimary()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.notBegin));

      // then
      Todo? behindTodo;
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.notBegin, element.status);
        if (behindTodo != null) {
          expect(isEmergencyTimesPrimaryOrder(behindTodo, element), isTrue);
        }
        behindTodo = element;
      }
    });
  });

  group('作業中', () {
    test('作業中のTodoリストが取得できること_登録日順', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider.overrideWith(() => DummySortTypeCreatedAt()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.progress));

      // then
      var behindTodoCreateAt = DateTime(0);
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.progress, element.status); // 未着手のTodoであること
        expect(behindTodoCreateAt.compareTo(element.createAt),
            lessThanOrEqualTo(0)); // 登録日順であること
        behindTodoCreateAt = element.createAt;
      }
    });

    test('作業中のTodoリストが取得できること_緊急度x重要度', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider
              .overrideWith(() => DummySortTypeEmergencyTimesPrimary()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.progress));

      // then
      Todo? behindTodo;
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.progress, element.status);
        if (behindTodo != null) {
          expect(isEmergencyTimesPrimaryOrder(behindTodo, element), isTrue);
        }
        behindTodo = element;
      }
    });
  });

  group('保留', () {
    test('保留のTodoリストが取得できること_登録日順', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider.overrideWith(() => DummySortTypeCreatedAt()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.stay));

      // then
      var behindTodoCreateAt = DateTime(0);
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.stay, element.status); // 未着手のTodoであること
        expect(behindTodoCreateAt.compareTo(element.createAt),
            lessThanOrEqualTo(0)); // 登録日順であること
        behindTodoCreateAt = element.createAt;
      }
    });

    test('保留のTodoリストが取得できること_緊急度x重要度', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider
              .overrideWith(() => DummySortTypeEmergencyTimesPrimary()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.notBegin));

      // then
      Todo? behindTodo;
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.notBegin, element.status);
        if (behindTodo != null) {
          expect(isEmergencyTimesPrimaryOrder(behindTodo, element), isTrue);
        }
        behindTodo = element;
      }
    });
  });

  group('完了', () {
    test('完了のTodoリストが取得できること_登録日順', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider.overrideWith(() => DummySortTypeCreatedAt()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.complete));

      // then
      var behindTodoCreateAt = DateTime(0);
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.complete, element.status); // 未着手のTodoであること
        expect(behindTodoCreateAt.compareTo(element.createAt),
            lessThanOrEqualTo(0)); // 登録日順であること
        behindTodoCreateAt = element.createAt;
      }
    });

    test('完了のTodoリストが取得できること_緊急度x重要度', () {
      // given
      final container = ProviderContainer(
        overrides: [
          todoListProvider.overrideWith(() => DummyTodoList()),
          sortTypeProvider
              .overrideWith(() => DummySortTypeEmergencyTimesPrimary()),
        ],
      );

      // when
      final selectedStateTodoList =
          container.read(selectedStateTodoListProvider(TodoStatus.complete));

      // then
      Todo? behindTodo;
      for (var element in selectedStateTodoList) {
        expect(TodoStatus.complete, element.status);
        if (behindTodo != null) {
          expect(isEmergencyTimesPrimaryOrder(behindTodo, element), isTrue);
        }
        behindTodo = element;
      }
    });
  });
}
