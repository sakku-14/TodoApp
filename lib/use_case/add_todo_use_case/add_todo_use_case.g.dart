// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTodoUseCaseHash() => r'296dfa38c1ac41d54dc91a65a4f76332f40c7cae';

/// See also [addTodoUseCase].
@ProviderFor(addTodoUseCase)
final addTodoUseCaseProvider = AutoDisposeProvider<AddTodoUseCase>.internal(
  addTodoUseCase,
  name: r'addTodoUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTodoUseCaseHash,
  dependencies: <ProviderOrFamily>[todoListProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    todoListProvider,
    ...?todoListProvider.allTransitiveDependencies
  },
);

typedef AddTodoUseCaseRef = AutoDisposeProviderRef<AddTodoUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
