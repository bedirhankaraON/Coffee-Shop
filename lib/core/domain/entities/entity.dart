import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class Entity with EquatableMixin {
  const Entity({
    required this.id,
  });

  final String? id;

  @override
  List<Object?> get props => [id];
}
