// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: Product._fromJson(json['id'] as String),
      title: json['title'] as String,
      price: Product._fromJson(json['price'] as String),
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': Product._toJson(instance.id),
      'title': instance.title,
      'price': Product._toJson(instance.price),
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'rating': instance.rating,
    };
