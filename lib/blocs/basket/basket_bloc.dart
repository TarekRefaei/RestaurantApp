import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart';
import '../voucher/voucher_bloc.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final VoucherBloc _voucherBloc;
  late StreamSubscription _voucherSubscription;

  BasketBloc({required VoucherBloc voucherBloc})
      : _voucherBloc = voucherBloc,
        super(BasketLoading()) {
    on<StartBasket>(_startBasket);
    on<AddElement>(_addItem);
    on<RemoveElement>(_removeItem);
    on<RemoveAllElement>(_removeAllItem);
    on<ToggleSwitch>(_toggleSwitch);
    on<ApplyVoucher>(_applyVoucher);
    on<AddDeliveryTime>(_addDeliveryTime);

    _voucherSubscription = voucherBloc.stream.listen((state) {
      if (state is VoucherSelect){
        add(ApplyVoucher(voucher: state.voucher));
      }
    });
  }

  FutureOr<void> _startBasket(
      StartBasket event, Emitter<BasketState> emit) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      const BasketLoaded(basket: Basket());
    } catch (_) {}
    emit(const BasketLoaded(basket: Basket()));
  }

  FutureOr<void> _addItem(AddElement event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              element: List.from(state.basket.element)..add(event.element),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _removeItem(RemoveElement event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              element: List.from(state.basket.element)..remove(event.element),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _toggleSwitch(ToggleSwitch event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              cutlery: !state.basket.cutlery,
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _removeAllItem(
      RemoveAllElement event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              element: List.from(state.basket.element)
                ..removeWhere((item) => item == event.element),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _applyVoucher(ApplyVoucher event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(voucher: event.voucher),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _addDeliveryTime(
      AddDeliveryTime event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(deliveryTime: event.deliveryTime),
          ),
        );
      } catch (_) {}
    }
  }
}
