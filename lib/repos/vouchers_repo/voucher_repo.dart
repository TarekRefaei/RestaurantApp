import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/models/voucher_model.dart';
import 'package:food_delivery_app/repos/vouchers_repo/base_voucher_repo.dart';

class VoucherRepo extends BaseVoucherRepo {
  final FirebaseFirestore _firebaseFirestore;

  VoucherRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Voucher>> getVoucher() {
    return _firebaseFirestore.collection('vouchers')
        .snapshots()
        .map(
        (snapshot) =>
            snapshot.docs.map((doc) => Voucher.fromSnapShots(doc)).toList());
  }

  @override
  Future<bool> searchVoucher(String code) async {
    final voucher = await _firebaseFirestore
        .collection('vouchers')
        .where('code', isEqualTo: code)
        .get();
    return voucher.docs.isNotEmpty;
  }
}
