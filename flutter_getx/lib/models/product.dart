import 'package:json_annotation/json_annotation.dart';

import 'rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final num id;
  final String title;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final num price;
  final String category;
  final String description;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  static num _fromJson(String json) => num.parse(json);
  static String _toJson(num object) => object.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && id == other.id;

  @override
  int get hashCode => id as int;
}

// id: num.parse(json['id']) as int,
//       title: json['title'] as String,
//       price: num.parse(json['price']) as double,