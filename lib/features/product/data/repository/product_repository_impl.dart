import 'package:diploy_assignment/core/network/failure.dart';
import 'package:diploy_assignment/core/network/network_exceptions.dart';
import 'package:diploy_assignment/features/product/data/remote_data/product_remote_data.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:diploy_assignment/features/product/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteData productRemoteData;

  ProductRepositoryImpl(this.productRemoteData);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final List<Product> products = await productRemoteData.fetchProducts();
      return right(products);
    } on NtwkExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
