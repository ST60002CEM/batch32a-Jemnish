import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/product/data/repository/product_remote_repository.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ref.watch(productRemoteRepositoryProvider);
});

abstract class IProductRepository {

}
