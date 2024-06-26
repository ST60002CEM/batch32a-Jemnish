import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/networking/remote/http_service.dart';
import 'package:kheti_pati/core/networking/shared_prefs/product_shared_prefs.dart';

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
}
