part of 'vouchers_bloc.dart';

abstract class VouchersEvent extends Equatable {
  const VouchersEvent();

  @override
  List<Object> get props => [];
}

class LoadVoucher extends VouchersEvent {}

class UpdateVoucher extends VouchersEvent {
  final List<Voucher> vouchers;

  const UpdateVoucher({this.vouchers = const <Voucher>[]});

  @override
  List<Object> get props => [vouchers];
}

class SelectVoucher extends VouchersEvent {
  final Voucher voucher;

  const SelectVoucher({required this.voucher});

  @override
  List<Object> get props => [voucher];
}
