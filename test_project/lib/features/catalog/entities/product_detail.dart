import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;

  ProductDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}
