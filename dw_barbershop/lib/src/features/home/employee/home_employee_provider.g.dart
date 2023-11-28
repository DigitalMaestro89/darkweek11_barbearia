// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_employee_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTotalSchedulesTodayHash() =>
    r'ec991558c2daf303a25cafc26b1006c9065cae31';

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

/// See also [getTotalSchedulesToday].
@ProviderFor(getTotalSchedulesToday)
const getTotalSchedulesTodayProvider = GetTotalSchedulesTodayFamily();

/// See also [getTotalSchedulesToday].
class GetTotalSchedulesTodayFamily extends Family<AsyncValue<int>> {
  /// See also [getTotalSchedulesToday].
  const GetTotalSchedulesTodayFamily();

  /// See also [getTotalSchedulesToday].
  GetTotalSchedulesTodayProvider call(
    int userId,
  ) {
    return GetTotalSchedulesTodayProvider(
      userId,
    );
  }

  @override
  GetTotalSchedulesTodayProvider getProviderOverride(
    covariant GetTotalSchedulesTodayProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getTotalSchedulesTodayProvider';
}

/// See also [getTotalSchedulesToday].
class GetTotalSchedulesTodayProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getTotalSchedulesToday].
  GetTotalSchedulesTodayProvider(
    int userId,
  ) : this._internal(
          (ref) => getTotalSchedulesToday(
            ref as GetTotalSchedulesTodayRef,
            userId,
          ),
          from: getTotalSchedulesTodayProvider,
          name: r'getTotalSchedulesTodayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTotalSchedulesTodayHash,
          dependencies: GetTotalSchedulesTodayFamily._dependencies,
          allTransitiveDependencies:
              GetTotalSchedulesTodayFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetTotalSchedulesTodayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetTotalSchedulesTodayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTotalSchedulesTodayProvider._internal(
        (ref) => create(ref as GetTotalSchedulesTodayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetTotalSchedulesTodayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalSchedulesTodayProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTotalSchedulesTodayRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _GetTotalSchedulesTodayProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with GetTotalSchedulesTodayRef {
  _GetTotalSchedulesTodayProviderElement(super.provider);

  @override
  int get userId => (origin as GetTotalSchedulesTodayProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
