import 'dart:ffi';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';
import 'package:kheti_pati/features/product/domain/repository/i_auth_repository.dart';

final productUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(productRepository: ref.watch(productRepositoryProvider));
});

class ProductUseCase {
  final IProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts(int page) async {
    return productRepository.getAllProducts(page);
  }

  
}
