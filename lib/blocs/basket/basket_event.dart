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
  final bool value;

  const ToggleSwitch({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}