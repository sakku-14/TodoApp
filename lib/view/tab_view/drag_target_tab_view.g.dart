// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drag_target_tab_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isDragOnHash() => r'3e03cf5b394c65047d9dfc65f42ff097eb1597d7';

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

abstract class _$IsDragOn extends BuildlessAutoDisposeNotifier<bool> {
  late final TodoStatus status;

  bool build(
    TodoStatus status,
  );
}

/// See also [IsDragOn].
@ProviderFor(IsDragOn)
const isDragOnProvider = IsDragOnFamily();

/// See also [IsDragOn].
class IsDragOnFamily extends Family<bool> {
  /// See also [IsDragOn].
  const IsDragOnFamily();

  /// See also [IsDragOn].
  IsDragOnProvider call(
    TodoStatus status,
  ) {
    return IsDragOnProvider(
      status,
    );
  }

  @override
  IsDragOnProvider getProviderOverride(
    covariant IsDragOnProvider provider,
  ) {
    return call(
      provider.status,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isDragOnProvider';
}

/// See also [IsDragOn].
class IsDragOnProvider extends AutoDisposeNotifierProviderImpl<IsDragOn, bool> {
  /// See also [IsDragOn].
  IsDragOnProvider(
    this.status,
  ) : super.internal(
          () => IsDragOn()..status = status,
          from: isDragOnProvider,
          name: r'isDragOnProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isDragOnHash,
          dependencies: IsDragOnFamily._dependencies,
          allTransitiveDependencies: IsDragOnFamily._allTransitiveDependencies,
        );

  final TodoStatus status;

  @override
  bool operator ==(Object other) {
    return other is IsDragOnProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  bool runNotifierBuild(
    covariant IsDragOn notifier,
  ) {
    return notifier.build(
      status,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
