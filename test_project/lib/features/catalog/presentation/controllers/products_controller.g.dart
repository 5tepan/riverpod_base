// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsControllerHash() =>
    r'86c77deb9b39fda916cf6e5a43bb1518ba179ac4';

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

abstract class _$ProductsController
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String categoryId;

  FutureOr<List<Product>> build(
    String categoryId,
  );
}

/// See also [ProductsController].
@ProviderFor(ProductsController)
const productsControllerProvider = ProductsControllerFamily();

/// See also [ProductsController].
class ProductsControllerFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [ProductsController].
  const ProductsControllerFamily();

  /// See also [ProductsController].
  ProductsControllerProvider call(
    String categoryId,
  ) {
    return ProductsControllerProvider(
      categoryId,
    );
  }

  @override
  ProductsControllerProvider getProviderOverride(
    covariant ProductsControllerProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'productsControllerProvider';
}

/// See also [ProductsController].
class ProductsControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProductsController, List<Product>> {
  /// See also [ProductsController].
  ProductsControllerProvider(
    String categoryId,
  ) : this._internal(
          () => ProductsController()..categoryId = categoryId,
          from: productsControllerProvider,
          name: r'productsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsControllerHash,
          dependencies: ProductsControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductsControllerFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  ProductsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant ProductsController notifier,
  ) {
    return notifier.build(
      categoryId,
    );
  }

  @override
  Override overrideWith(ProductsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsControllerProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductsController, List<Product>>
      createElement() {
    return _ProductsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsControllerProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _ProductsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductsController,
        List<Product>> with ProductsControllerRef {
  _ProductsControllerProviderElement(super.provider);

  @override
  String get categoryId => (origin as ProductsControllerProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
