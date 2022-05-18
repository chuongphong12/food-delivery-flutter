import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app_flutter/models/voucher_model.dart';
import 'package:food_delivery_app_flutter/repository/vouchers/base_vouchers_repository.dart';

class VouchersRepository extends BaseVoucherRepository {
  final FirebaseFirestore _firestore;

  VouchersRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Voucher>> getVoucher() {
    return _firestore.collection('vouchers').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Voucher.fromSnapshot(doc)).toList());
  }

  @override
  Future<bool> searchVoucher(String code) async {
    final voucher = await _firestore
        .collection('vouchers')
        .where('code', isEqualTo: code)
        .get();

    return voucher.docs.isNotEmpty;
  }
}
