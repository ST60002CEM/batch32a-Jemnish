import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kheti_pati/app/constants/hive_table_constant.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';
import 'package:uuid/uuid.dart';

part 'product_hive_model.g.dart';

final productHiveModelProvider = Provider(
  (ref) => ProductHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class ProductHiveModel {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final String productTitle;
  @HiveField(2)
  final String productDescription;
  @HiveField(3)
  final String productPrice;
  @HiveField(4)
  final String productImage;
  @HiveField(5)
  final String productQuantity;
  @HiveField(6)
  final String productType;

  // Constructor
  ProductHiveModel({
    String? productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
    required this.productType,
  }) : productId = productId ?? const Uuid().v4();

  // empty constructor
  ProductHiveModel.empty()
      : this(
          productId: '',
          productTitle: '',
          productDescription: '',
          productPrice: '',
          productImage: '',
          productQuantity: '',
          productType: '',
        );

  // Convert Hive Object to Entity
  ProductEntity toEntity() => ProductEntity(
        productId: productId,
        productTitle: productTitle,
        productDescription: productDescription,
        productPrice: productPrice,
        productImage: productImage,
        productQuantity: productQuantity,
        productType: productType,
      );

  // Convert Entity to Hive Object
  ProductHiveModel toHiveModel(ProductEntity entity) => ProductHiveModel(
        productId: entity.productId,
        productTitle: entity.productTitle,
        productDescription: entity.productDescription,
        productPrice: entity.productPrice,
        productImage: entity.productImage,
        productQuantity: entity.productQuantity,
        productType: entity.productType,
      );

  // Convert Entity List to Hive List
  List<ProductHiveModel> toHiveModelList(List<ProductEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'ProductHiveModel(productId: $productId, productTitle: $productTitle, productDescription: $productDescription, productPrice: $productPrice, productImage: $productImage, productQuantity: $productQuantity, productType: $productType),';
  }
}
