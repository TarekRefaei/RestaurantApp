import 'package:food_delivery_app/models/models.dart';

abstract class BaseVoucherRepo{
  Future<bool> searchVoucher(String code);
  Stream<List<Voucher>> getVoucher();
}