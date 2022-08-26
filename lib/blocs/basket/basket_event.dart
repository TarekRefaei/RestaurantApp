part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddElement extends BasketEvent {
  final MenuElement element;

  const AddElement({required this.element});

  @override
  List<Object> get props => [element];
}

class RemoveElement extends BasketEvent {
  final MenuElement element;

  const RemoveElement({required this.element});

  @override
  List<Object> get props => [element];
}

class RemoveAllElement extends BasketEvent {
  final MenuElement element;

  const RemoveAllElement({required this.element});

  @override
  List<Object> get props => [element];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  List<Object> get props => [];
}

class AddVoucher extends BasketEvent {
  final Voucher voucher;

  const AddVoucher({required this.voucher});

  @override
  List<Object> get props => [voucher];
}

class AddDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;

  const AddDeliveryTime(this.deliveryTime);

  @override
  List<Object> get props => [deliveryTime];
}
