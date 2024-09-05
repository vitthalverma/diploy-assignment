import 'package:diploy_assignment/core/network/failure.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
