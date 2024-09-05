part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetProductsEvent extends ProductEvent {}

final class SearchProductsEvent extends ProductEvent {
  final String query;
  SearchProductsEvent(this.query);
}

final class GetProductByIdEvent extends ProductEvent {
  final int productId;

  GetProductByIdEvent(this.productId);
}
