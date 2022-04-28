import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/menu_item_model.dart';

class Basket extends Equatable {
  final List<MenuItem> menuItems;
  final bool cutlery;

  const Basket({
    this.menuItems = const <MenuItem>[],
    this.cutlery = false,
  });

  Basket copyWith({
    List<MenuItem>? menuItems,
    bool? cutlery,
  }) {
    return Basket(
      menuItems: menuItems ?? this.menuItems,
      cutlery: cutlery ?? this.cutlery,
    );
  }

  @override
  List<Object> get props => [menuItems, cutlery];

  Map itemQuantity(menuItems) {
    var quantity = {};

    menuItems.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });

    return quantity;
  }

  double get subtotal => menuItems.fold(0, (sum, item) => sum + item.price);

  double get total => (subtotal + 5) + (cutlery ? 10 : 0);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total.toStringAsFixed(2);
}
