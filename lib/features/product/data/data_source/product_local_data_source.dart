import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/networking/local/hive_service.dart';
import 'package:kheti_pati/features/product/data/model/product_hive_model.dart';

final productLocalDataSourceProvider = Provider((ref) => ProductLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    productHiveModel: ref.read(productHiveModelProvider)));

class ProductLocalDataSource {
  final HiveService hiveService;
  final ProductHiveModel productHiveModel;

  ProductLocalDataSource(
      {required this.hiveService, required this.productHiveModel});

  

}
