import 'package:diploy_assignment/core/network/failure.dart';
import 'package:diploy_assignment/core/usecase/core_usecase.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';
import 'package:diploy_assignment/features/product/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductsUsecase implements CoreUsecases<List<Product>, NoParams> {
  final ProductRepository productRepository;

  GetProductsUsecase(this.productRepository);
  @override
  Future<Either<Failure, List<Product>>> call(NoParams input) async {
    return await productRepository.getProducts();
  }
}
