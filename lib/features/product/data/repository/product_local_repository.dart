import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/product/data/data_source/product_local_data_source.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';
import 'package:kheti_pati/features/product/domain/repository/i_auth_repository.dart';

final productLocalRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductLocalRepository(
      productLocalDataSource: ref.read(productLocalDataSourceProvider));
});

class ProductLocalRepository implements IProductRepository {
  final ProductLocalDataSource productLocalDataSource;

  ProductLocalRepository({required this.productLocalDataSource});
  
  @override
  Future<Either<Failure, bool>> addUser(ProductEntity product) {
    // TODO: implement addUser
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }


}
