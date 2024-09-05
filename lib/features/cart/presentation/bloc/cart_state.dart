part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {
  final Map<Product, int> products;

  CartUpdated({required this.products});
}

final class CartError extends CartState {}
