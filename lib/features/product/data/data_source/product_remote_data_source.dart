import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/constants/api_endpoint.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/core/networking/remote/http_service.dart';
import 'package:kheti_pati/core/networking/shared_prefs/product_shared_prefs.dart';
import 'package:kheti_pati/features/product/data/data_source/dto/get_all_product_dto.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

final productRemoteDataSourceProvider = Provider(
  (ref) => ProductRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    productSharedPrefs: ref.read(productSharedPrefsProvider),
  ),
);

class ProductRemoteDataSource {
  final Dio dio;
  final ProductSharedPrefs productSharedPrefs;

  ProductRemoteDataSource(
      {required this.dio, required this.productSharedPrefs});

  Future<Either<Failure, List<ProductEntity>>> getAllCourses() async {
    try {
      final response = await dio.get(ApiEndpoints.getAllProduct);
      if (response.statusCode == 200) {
        final getAllProductDTO = GetAllProductDTO.fromJson(response.data);
        final courses = getAllProductDTO.data.map((e) => e.toEntity()).toList();
        return Right(courses);
      } else {
        return Left(Failure(error: 'Failed to get all products'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
