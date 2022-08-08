import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_startBasket);
    on<AddItem>(_addItem);
    on<RemoveItem>(_removeItem);
    on<RemoveAllItem>(_removeAllItem);
    on<ToggleSwitch>(_toggleSwitch);
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

  FutureOr<void> _addItem(AddItem event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..add(event.item),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  FutureOr<void> _removeItem(RemoveItem event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..remove(event.item),
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
      RemoveAllItem event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)
                ..removeWhere((item) => item == event.item),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
