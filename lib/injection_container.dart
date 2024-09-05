import 'package:diploy_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:diploy_assignment/features/product/data/remote_data/product_remote_data.dart';
import 'package:diploy_assignment/features/product/data/repository/product_repository_impl.dart';
import 'package:diploy_assignment/features/product/domain/repository/product_repository.dart';
import 'package:diploy_assignment/features/product/domain/usecases/get_products_usecase.dart';
import 'package:diploy_assignment/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initFeatures();
}

void _initFeatures() {
  // Datasource
  sl
    ..registerFactory<ProductRemoteData>(() => ProductRemoteDataImpl())

    // Repository
    ..registerFactory<ProductRepository>(() => ProductRepositoryImpl(sl()))

    // Usecases
    ..registerFactory(() => GetProductsUsecase(sl()))

    // Bloc
    ..registerLazySingleton(() => ProductBloc(sl()))
    ..registerLazySingleton(() => CartBloc());
}
