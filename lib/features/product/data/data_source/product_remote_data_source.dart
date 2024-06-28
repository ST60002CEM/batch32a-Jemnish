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
    // send the page number too
    try {
      final response = await dio.get(
        ApiEndpoints.getAllProduct,
        queryParameters: {
          'page': page,
        },
      );

      final getAllProductDto = GetAllProductDTO.fromJson(response.data);

      return Right(getAllProductDto.data.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }
}
