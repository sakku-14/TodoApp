// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_todo_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteTodoUseCaseHash() => r'8a5bd272c24af8c0c4c2344dce636a153c6a80db';

/// See also [deleteTodoUseCase].
@ProviderFor(deleteTodoUseCase)
final deleteTodoUseCaseProvider =
    AutoDisposeProvider<DeleteTodoUseCase>.internal(
  deleteTodoUseCase,
  name: r'deleteTodoUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteTodoUseCaseHash,
  dependencies: <ProviderOrFamily>[todoListProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    todoListProvider,
    ...?todoListProvider.allTransitiveDependencies
  },
);

typedef DeleteTodoUseCaseRef = AutoDisposeProviderRef<DeleteTodoUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
