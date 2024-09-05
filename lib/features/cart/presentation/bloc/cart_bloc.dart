import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<Product, int> _cartItems = {};

  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {
      if (_cartItems.containsKey(event.product)) {
        _cartItems[event.product] = _cartItems[event.product]! +
            1; // Increment quantity if already in cart
      } else {
        _cartItems[event.product] = 1; // Add new product with quantity 1
      }
      emit(CartUpdated(products: Map.from(_cartItems)));
    });

    on<DeleteFromCartEvent>((event, emit) {
      _cartItems.remove(event.product);
      emit(CartUpdated(products: Map.from(_cartItems)));
    });

    on<IncreaseQuantityEvent>((event, emit) {
      if (_cartItems.containsKey(event.product)) {
        _cartItems[event.product] = _cartItems[event.product]! + 1;
        emit(CartUpdated(products: Map.from(_cartItems)));
      }
    });

    on<DecreaseQuantityEvent>((event, emit) {
      if (_cartItems.containsKey(event.product) &&
          _cartItems[event.product]! > 1) {
        _cartItems[event.product] = _cartItems[event.product]! - 1;
        emit(CartUpdated(products: Map.from(_cartItems)));
      } else {
        _cartItems
            .remove(event.product); // remove the product when quantity is zero
        emit(CartUpdated(products: Map.from(_cartItems)));
      }
    });
  }
}
