// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsDetailControllerHash() =>
    r'849644cea1eab549721ab93b7cc1fe046055c151';

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

abstract class _$ProductsDetailController
    extends BuildlessAutoDisposeAsyncNotifier<ProductDetail> {
  late final String productId;

  FutureOr<ProductDetail> build(
    String productId,
  );
}

/// See also [ProductsDetailController].
@ProviderFor(ProductsDetailController)
const productsDetailControllerProvider = ProductsDetailControllerFamily();

/// See also [ProductsDetailController].
class ProductsDetailControllerFamily extends Family<AsyncValue<ProductDetail>> {
  /// See also [ProductsDetailController].
  const ProductsDetailControllerFamily();

  /// See also [ProductsDetailController].
  ProductsDetailControllerProvider call(
    String productId,
  ) {
    return ProductsDetailControllerProvider(
      productId,
    );
  }

  @override
  ProductsDetailControllerProvider getProviderOverride(
    covariant ProductsDetailControllerProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'productsDetailControllerProvider';
}

/// See also [ProductsDetailController].
class ProductsDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductsDetailController,
        ProductDetail> {
  /// See also [ProductsDetailController].
  ProductsDetailControllerProvider(
    String productId,
  ) : this._internal(
          () => ProductsDetailController()..productId = productId,
          from: productsDetailControllerProvider,
          name: r'productsDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsDetailControllerHash,
          dependencies: ProductsDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductsDetailControllerFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductsDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  FutureOr<ProductDetail> runNotifierBuild(
    covariant ProductsDetailController notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(ProductsDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsDetailControllerProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductsDetailController,
      ProductDetail> createElement() {
    return _ProductsDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsDetailControllerProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProductDetail> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductsDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductsDetailController,
        ProductDetail> with ProductsDetailControllerRef {
  _ProductsDetailControllerProviderElement(super.provider);

  @override
  String get productId =>
      (origin as ProductsDetailControllerProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
