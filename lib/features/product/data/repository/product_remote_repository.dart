import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/product/data/data_source/product_remote_data_source.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';
import 'package:kheti_pati/features/product/domain/repository/i_auth_repository.dart';

final productRemoteRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRemoteRepository(
    ref.read(productRemoteDataSourceProvider),
  );
});

class ProductRemoteRepository implements IProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductRemoteRepository(this._productRemoteDataSource);
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts( page) {
    return _productRemoteDataSource.getAllProducts(page);
  }

}
