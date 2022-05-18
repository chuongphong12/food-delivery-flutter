part of 'vouchers_bloc.dart';

abstract class VouchersState extends Equatable {
  const VouchersState();

  @override
  List<Object> get props => [];
}

class VouchersInitial extends VouchersState {}

class VouchersLoading extends VouchersState {}

class VouchersLoaded extends VouchersState {
  final List<Voucher> vouchers;

  const VouchersLoaded({this.vouchers = const <Voucher>[]});

  @override
  List<Object> get props => [vouchers];
}

class VoucherSelected extends VouchersState {
  final Voucher voucher;

  const VoucherSelected({required this.voucher});

  @override
  List<Object> get props => [voucher];
}

class VouchersError extends VouchersState {}
