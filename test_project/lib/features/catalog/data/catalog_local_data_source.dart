import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_project/core/utils/json_catalog.dart';
import 'package:test_project/features/catalog/entities/category.dart';
import 'package:test_project/features/catalog/entities/product.dart';
import 'package:test_project/features/catalog/entities/product_detail.dart';

class CatalogLocalDataSource {
  Future<List<Category>> getCategories() async {
    final String response =
        await rootBundle.loadString(JsonCatalog.categoriesJson);
    final List<dynamic> data = json.decode(response);
    return data.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final String response =
        await rootBundle.loadString(JsonCatalog.productsJson);
    final List<dynamic> data = json.decode(response);
    return data
        .where((e) => e['categoryId'] == categoryId)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<ProductDetail> getProductDetail(String productId) async {
    final String response =
        await rootBundle.loadString(JsonCatalog.productDetailJson);
    final List<dynamic> data = json.decode(response);
    final product = data.firstWhere((e) => e['id'] == productId);
    return ProductDetail.fromJson(product);
  }
}
