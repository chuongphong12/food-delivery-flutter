import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/blocs/vouchers/vouchers_bloc.dart';
import 'package:food_delivery_app_flutter/models/delivery_time_model.dart';
import 'package:food_delivery_app_flutter/models/models.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final VouchersBloc _vouchersBloc;
  StreamSubscription? _vouchersSubscription;

  BasketBloc({required VouchersBloc vouchersBloc})
      : _vouchersBloc = vouchersBloc,
        super(BasketInitial()) {
    on<StartBasket>(_onStartBasket);
    on<AddBasket>(_onAddBasket);
    on<RemoveBasket>(_onRemoveBasket);
    on<ClearBasket>(_onClearBasket);
    on<ToggleSwitch>(_onToggleSwitch);
    on<AddVoucher>(_onAddVoucher);
    on<SelectDeliveryTime>(_onSelectDeliveryTime);

    _vouchersSubscription = _vouchersBloc.stream.listen(
      (state) {
        if (state is VoucherSelected) {
          add(AddVoucher(voucher: state.voucher));
        }
      },
    );
  }

  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(const BasketLoaded(basket: Basket()));
  }

  void _onAddBasket(
    AddBasket event,
    Emitter<BasketState> emit,
  ) async {
    final Basket basket = (state as BasketLoaded).basket;
    try {
      emit(
        BasketLoaded(
          basket: basket.copyWith(
            menuItems: List.from(basket.menuItems)..add(event.menuItem),
          ),
        ),
      );
    } catch (_) {}
  }

  void _onRemoveBasket(
    RemoveBasket event,
    Emitter<BasketState> emit,
  ) async {
    final Basket basket = (state as BasketLoaded).basket;
    try {
      emit(
        BasketLoaded(
          basket: basket.copyWith(
            menuItems: List.from(basket.menuItems)..remove(event.menuItem),
          ),
        ),
      );
    } catch (_) {}
  }

  void _onClearBasket(
    ClearBasket event,
    Emitter<BasketState> emit,
  ) async {}

  void _onToggleSwitch(
    ToggleSwitch event,
    Emitter<BasketState> emit,
  ) async {
    final Basket basket = (state as BasketLoaded).basket;
    try {
      emit(
        BasketLoaded(
          basket: basket.copyWith(cutlery: !basket.cutlery),
        ),
      );
    } catch (_) {}
  }

  void _onAddVoucher(AddVoucher event, Emitter<BasketState> emit) async {
    final Basket basket = (state as BasketLoaded).basket;
    try {
      emit(
        BasketLoaded(
          basket: basket.copyWith(voucher: event.voucher),
        ),
      );
    } catch (_) {}
  }

  void _onSelectDeliveryTime(
      SelectDeliveryTime event, Emitter<BasketState> emit) async {
    final Basket basket = (state as BasketLoaded).basket;
    try {
      emit(
        BasketLoaded(
          basket: basket.copyWith(deliveryTime: event.deliveryTime),
        ),
      );
    } catch (_) {}
  }
}
