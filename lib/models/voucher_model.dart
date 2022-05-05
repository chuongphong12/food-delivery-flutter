import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String code;
  final double value;

  const Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  Voucher copyWith({
    int? id,
    String? code,
    double? value,
  }) {
    return Voucher(
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'Voucher(id: $id, code: $code, value: $value)';

  @override
  List<Object> get props => [id, code, value];

  static List<Voucher> vouchers = [
    const Voucher(
      id: 1,
      code: 'SAVE5',
      value: 5,
    ),
    const Voucher(
      id: 2,
      code: 'SAVE10',
      value: 10,
    ),
    const Voucher(
      id: 3,
      code: 'SAVE15',
      value: 15,
    ),
  ];
}
