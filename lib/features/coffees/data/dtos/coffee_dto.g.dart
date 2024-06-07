// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeDTO _$CoffeeDTOFromJson(Map<String, dynamic> json) => CoffeeDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoffeeDTOToJson(CoffeeDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'image': instance.image,
      'price': instance.price,
    };
