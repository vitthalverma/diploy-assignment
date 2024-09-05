part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCartEvent extends CartEvent {
  final Product product;
  AddToCartEvent({required this.product});
}

final class DeleteFromCartEvent extends CartEvent {
  final Product product;
  DeleteFromCartEvent({required this.product});
}

final class IncreaseQuantityEvent extends CartEvent {
  final Product product;

  IncreaseQuantityEvent(this.product);
}

final class DecreaseQuantityEvent extends CartEvent {
  final Product product;

  DecreaseQuantityEvent(this.product);
}
