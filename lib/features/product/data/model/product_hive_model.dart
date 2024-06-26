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
  final String productTitle;
  @HiveField(1)
  final String productDescription;
  @HiveField(2)
  final String productPrice;
  @HiveField(3)
  final String productImage;
  @HiveField(4)
  final String productQuantity;
  @HiveField(5)
  final String productType;
  


  // Constructor
  ProductHiveModel({
    String? userId,
    required this.fullname,
    required this.phone,
    required this.username,
    required this.password,
    required this.securityQuestion,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  ProductHiveModel.empty()
      : this(
          userId: '',
          fullname: '',
          phone: '',
          username: '',
          password: '',
          securityQuestion: '',
        );

  // Convert Hive Object to Entity
  ProductEntity toEntity() => ProductEntity(
        id: userId,
        fullname: fullname,
        phone: phone,
        username: username,
        password: password,
        securityQuestion: securityQuestion,
      );

  // Convert Entity to Hive Object
  ProductHiveModel toHiveModel(ProductEntity entity) => ProductHiveModel(
        userId: const Uuid().v4(),
        fullname: entity.fullname,
        phone: entity.phone,
        
        username: entity.username,
        password: entity.password,
        securityQuestion: entity.securityQuestion,
      );

  // Convert Entity List to Hive List
  List<ProductHiveModel> toHiveModelList(List<ProductEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fullname: $fullname, phone : $phone, username: $username, password: $password, securityQuestion: $securityQuestion';
  }
}
