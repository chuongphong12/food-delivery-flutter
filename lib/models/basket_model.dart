import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/delivery_time_model.dart';
import 'package:food_delivery_app_flutter/models/models.dart';

class Basket extends Equatable {
  final List<MenuItem> menuItems;
  final bool cutlery;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

  const Basket({
    this.menuItems = const <MenuItem>[],
    this.cutlery = false,
    this.voucher,
    this.deliveryTime,
  });

  Basket copyWith({
    List<MenuItem>? menuItems,
    bool? cutlery,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
      menuItems: menuItems ?? this.menuItems,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [menuItems, cutlery, voucher, deliveryTime];

  Map itemQuantity(List<MenuItem> menuItems) {
    var quantity = {};

    for (var item in menuItems) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    }

    return quantity;
  }

  double get subtotal => menuItems.fold(0, (sum, item) => sum + item.price);

  double get total => (voucher == null)
      ? (subtotal + 5) + (cutlery ? 10 : 0)
      : (subtotal + 5) + (cutlery ? 10 : 0) - (voucher?.value ?? 0);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total.toStringAsFixed(2);
}
