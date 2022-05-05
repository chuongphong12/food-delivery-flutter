part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddBasket extends BasketEvent {
  final MenuItem menuItem;

  const AddBasket({
    required this.menuItem,
  });

  @override
  List<Object> get props => [menuItem];
}

class RemoveBasket extends BasketEvent {
  final MenuItem menuItem;

  const RemoveBasket({
    required this.menuItem,
  });

  @override
  List<Object> get props => [menuItem];
}

class ClearBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class ToggleSwitch extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddVoucher extends BasketEvent {
  final Voucher voucher;

  const AddVoucher({
    required this.voucher,
  });

  @override
  List<Object> get props => [voucher];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;

  const SelectDeliveryTime({
    required this.deliveryTime,
  });

  @override
  List<Object> get props => [deliveryTime];
}
