import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Category({
    required this.id,
    required this.name,
    required this.image,
  });

  Category copyWith({
    int? id,
    String? name,
    Image? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  List<Object> get props => [id, name, image];

  @override
  String toString() => 'Category(id: $id, name: $name, image: $image)';

  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Pizza',
      image: Image.asset(
        'assets/pizza.png',
      ),
    ),
    Category(
      id: 2,
      name: 'Burger',
      image: Image.asset(
        'assets/burger.png',
      ),
    ),
    Category(
      id: 3,
      name: 'Dessert',
      image: Image.asset(
        'assets/pancake.png',
      ),
    ),
    Category(
      id: 4,
      name: 'Salad',
      image: Image.asset(
        'assets/avocado.png',
      ),
    ),
    Category(
      id: 5,
      name: 'Drink',
      image: Image.asset(
        'assets/juice.png',
      ),
    ),
  ];
}
