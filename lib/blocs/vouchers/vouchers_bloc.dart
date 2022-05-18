import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/voucher_model.dart';
import 'package:food_delivery_app_flutter/repository/vouchers/vouchers_repository.dart';

part 'vouchers_event.dart';
part 'vouchers_state.dart';

class VouchersBloc extends Bloc<VouchersEvent, VouchersState> {
  final VouchersRepository _vouchersRepository;
  StreamSubscription? _vouchersSubscription;

  VouchersBloc({required VouchersRepository vouchersRepository})
      : _vouchersRepository = vouchersRepository,
        super(VouchersLoading()) {
    on<LoadVoucher>(_onLoadVoucher);
    on<UpdateVoucher>(_onUpdateVoucher);
    on<SelectVoucher>(_onSelectVoucher);
  }

  void _onLoadVoucher(
    LoadVoucher event,
    Emitter<VouchersState> emit,
  ) async {
    _vouchersSubscription?.cancel();
    _vouchersSubscription = _vouchersRepository.getVoucher().listen(
      (vouchers) {
        add(UpdateVoucher(vouchers: vouchers));
      },
    );
  }

  void _onUpdateVoucher(
    UpdateVoucher event,
    Emitter<VouchersState> emit,
  ) async {
    emit(VouchersLoaded(vouchers: event.vouchers));
  }

  void _onSelectVoucher(
    SelectVoucher event,
    Emitter<VouchersState> emit,
  ) async {
    emit(VoucherSelected(voucher: event.voucher));
  }
}
