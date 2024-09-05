import 'package:diploy_assignment/core/network/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CoreUsecases<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params input);
}

class NoParams {}
