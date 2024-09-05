import 'package:diploy_assignment/core/usecase/core_usecase.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:diploy_assignment/features/product/domain/usecases/get_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase getProductsUsecase;
  List<Product> _allProducts = [];
  ProductBloc(this.getProductsUsecase) : super(ProductInitial()) {
    //
    on<GetProductsEvent>((event, emit) async {
      final result = await getProductsUsecase(NoParams());
      result.fold(
        (err) => emit(ProductError()),
        (products) {
          _allProducts = products;
          emit(ProductLoaded(products: products));
        },
      );
    });

    on<SearchProductsEvent>((event, emit) {
      if (event.query.isEmpty) {
        emit(ProductLoaded(products: _allProducts));
      } else {
        final filteredProducts = _allProducts
            .where((product) =>
                product.name.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(ProductLoaded(products: filteredProducts));
      }
    });
  }
}
