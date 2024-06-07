import 'package:equatable/equatable.dart';

class Coffee with EquatableMixin {
  const Coffee({
    this.id,
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.price,
  });

  final int? id;
  final String? title;
  final String? description;
  final List<String>? ingredients;
  final String? image;
  final double? price;

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
