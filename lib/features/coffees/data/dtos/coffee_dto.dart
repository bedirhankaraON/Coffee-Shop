import 'package:equatable/equatable.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee_dto.g.dart';

@JsonSerializable()
class CoffeeDTO with EquatableMixin {
  const CoffeeDTO({
    required this.id,
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.price,
  });

  final int id;
  final String? title;
  final String? description;
  final List<String>? ingredients;
  final String? image;
  final double? price;

  factory CoffeeDTO.fromJson(Map<String, dynamic> json) => _$CoffeeDTOFromJson(json);

  Coffee toEntity() => Coffee(
        id: id,
        title: title,
        description: description,
        ingredients: ingredients,
        image: image,
        price: price,
      );

  Map<String, dynamic> toJson() => _$CoffeeDTOToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        ingredients,
        image,
        price,
      ];
}
