import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/constants/api_endpoint.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/core/networking/remote/http_service.dart';
import 'package:kheti_pati/features/product/data/data_source/dto/get_all_product_dto.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

final productRemoteDataSourceProvider = Provider(
  (ref) => ProductRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts(page) async {
    try {
      final response = await dio.get(ApiEndpoints.getAllProduct);
      if (response.statusCode == 201) {
        final getAllProductDTO = GetAllProductDTO.fromJson(response.data);
        final products =
            getAllProductDTO.data.map((e) => e.toEntity()).toList();
        return Right(products);
      } else {
        return Left(Failure(error: 'Failed to retrive Products'));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}
