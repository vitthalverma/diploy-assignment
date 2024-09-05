import 'package:diploy_assignment/features/product/domain/entity/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.description,
    required super.price,
  });
}
