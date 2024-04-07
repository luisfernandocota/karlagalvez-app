import 'package:dartz/dartz.dart';
import 'package:karlagalvezapp/data/data_sources/local/user_local_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/product/product_response.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/product/get_product_usecase.dart';
import '../data_sources/local/product_local_data_source.dart';
import '../data_sources/remote/product_remote_data_source.dart';
import '../models/product/product_response_model.dart';

typedef _ConcreteOrProductChooser = Future<ProductResponse> Function();

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.userLocalDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params) async {
    return await _getProduct(() async {
      late String token = "";
      if (await userLocalDataSource.isTokenAvailable()) {
        token = await userLocalDataSource.getToken();
      }
      return remoteDataSource.getProducts(params, token);
    });
  }

  Future<Either<Failure, ProductResponse>> _getProduct(
    _ConcreteOrProductChooser getConcreteOrProducts,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await getConcreteOrProducts();
        localDataSource.saveProducts(remoteProducts as ProductResponseModel);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        return Right(localProducts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
