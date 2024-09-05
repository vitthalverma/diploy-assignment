import 'package:diploy_assignment/core/network/network_exceptions.dart';
import 'package:diploy_assignment/features/product/domain/entity/product.dart';

abstract interface class ProductRemoteData {
  Future<List<Product>> fetchProducts();
}

class ProductRemoteDataImpl implements ProductRemoteData {
  @override
  Future<List<Product>> fetchProducts() async {
    try {
      return [
        Product(
          id: 1,
          name: 'Car',
          imageUrl: 'assets//car.webp',
          description: 'Description of Product 1',
          price: 29.99,
        ),
        Product(
          id: 2,
          name: 'Bike',
          imageUrl: 'assets//bike.webp',
          description: 'Description of Product 2',
          price: 19.99,
        ),
        Product(
          id: 3,
          name: 'Camera',
          imageUrl: 'assets//cam.jpeg',
          description: 'Description of Product 3',
          price: 10.99,
        ),
        Product(
          id: 4,
          name: 'T-shirt',
          imageUrl: 'assets//shirt.jpeg',
          description: 'Description of Product 4',
          price: 29.99,
        ),
        Product(
          id: 5,
          name: 'Cargo Pants',
          imageUrl: 'assets//pant.webp',
          description: 'Description of Product 5',
          price: 19.99,
        ),
        Product(
          id: 6,
          name: 'Body wash',
          imageUrl: 'assets//wash.webp',
          description: 'Description of Product 6',
          price: 10.99,
        ),
        Product(
          id: 7,
          name: 'Laptop',
          imageUrl: 'assets//laptop.webp',
          description: 'Description of Product 7',
          price: 10.99,
        ),
        // Add more products
      ];
    } catch (e) {
      throw NtwkExceptions(e.toString());
    }
  }
}
