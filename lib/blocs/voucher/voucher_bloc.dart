import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repos/all_repos.dart';

part 'voucher_event.dart';

part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepo _voucherRepo;
  StreamSubscription? _voucherSubscription;

  VoucherBloc({required VoucherRepo voucherRepo})
      : _voucherRepo = voucherRepo,
        super(VoucherLoading()) {
    on<LoadVouchers>(_onLoadVouchers);
    on<SelectVouchers>(_onSelectVouchers);
    on<UpdateVouchers>(_onUpdateVouchers);
  }

  FutureOr<void> _onLoadVouchers(
      LoadVouchers event, Emitter<VoucherState> emit) {
    _voucherSubscription?.cancel();
    _voucherSubscription = _voucherRepo.getVoucher().listen((vouchers) {
      add(UpdateVouchers(vouchers: vouchers));
    });
  }

  FutureOr<void> _onSelectVouchers(
      SelectVouchers event, Emitter<VoucherState> emit) {
    emit(
      VoucherSelect(voucher: event.voucher)
    );
  }

  FutureOr<void> _onUpdateVouchers(
      UpdateVouchers event, Emitter<VoucherState> emit) {
    emit(
      VoucherLoaded(vouchers: event.vouchers)
    );
  }
}
