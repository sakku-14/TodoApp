// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_state_todo_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedStateTodoListHash() =>
    r'8310e8b220eb1f6565a77630490a7db2c514d2f1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [selectedStateTodoList].
@ProviderFor(selectedStateTodoList)
const selectedStateTodoListProvider = SelectedStateTodoListFamily();

/// See also [selectedStateTodoList].
class SelectedStateTodoListFamily extends Family<List<Todo>> {
  /// See also [selectedStateTodoList].
  const SelectedStateTodoListFamily();

  /// See also [selectedStateTodoList].
  SelectedStateTodoListProvider call(
    TodoStatus tabTitle,
  ) {
    return SelectedStateTodoListProvider(
      tabTitle,
    );
  }

  @override
  SelectedStateTodoListProvider getProviderOverride(
    covariant SelectedStateTodoListProvider provider,
  ) {
    return call(
      provider.tabTitle,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    sortTypeProvider,
    todoListProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    sortTypeProvider,
    ...?sortTypeProvider.allTransitiveDependencies,
    todoListProvider,
    ...?todoListProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedStateTodoListProvider';
}

/// See also [selectedStateTodoList].
class SelectedStateTodoListProvider extends AutoDisposeProvider<List<Todo>> {
  /// See also [selectedStateTodoList].
  SelectedStateTodoListProvider(
    TodoStatus tabTitle,
  ) : this._internal(
          (ref) => selectedStateTodoList(
            ref as SelectedStateTodoListRef,
            tabTitle,
          ),
          from: selectedStateTodoListProvider,
          name: r'selectedStateTodoListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedStateTodoListHash,
          dependencies: SelectedStateTodoListFamily._dependencies,
          allTransitiveDependencies:
              SelectedStateTodoListFamily._allTransitiveDependencies,
          tabTitle: tabTitle,
        );

  SelectedStateTodoListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tabTitle,
  }) : super.internal();

  final TodoStatus tabTitle;

  @override
  Override overrideWith(
    List<Todo> Function(SelectedStateTodoListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedStateTodoListProvider._internal(
        (ref) => create(ref as SelectedStateTodoListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tabTitle: tabTitle,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Todo>> createElement() {
    return _SelectedStateTodoListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedStateTodoListProvider && other.tabTitle == tabTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tabTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedStateTodoListRef on AutoDisposeProviderRef<List<Todo>> {
  /// The parameter `tabTitle` of this provider.
  TodoStatus get tabTitle;
}

class _SelectedStateTodoListProviderElement
    extends AutoDisposeProviderElement<List<Todo>>
    with SelectedStateTodoListRef {
  _SelectedStateTodoListProviderElement(super.provider);

  @override
  TodoStatus get tabTitle => (origin as SelectedStateTodoListProvider).tabTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
