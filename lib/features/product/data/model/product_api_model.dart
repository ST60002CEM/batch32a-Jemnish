import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

final productApiModelProvider = Provider<ProductApiModel>((ref) {
  return ProductApiModel.empty();
});

@JsonSerializable()
class ProductApiModel {
  @JsonKey(name: '_id')
  final String productId;
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  final String productType;


  ProductApiModel({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
    required this.productType,

  });

  // Empty constructor
  ProductApiModel.empty()
      : productId = '',
        productTitle = '',
        productDescription = '',
        productPrice = '',
        productImage = '',
        productQuantity = '',
        productType = '';

        

  factory ProductApiModel.fromJson(Map<String, dynamic> json) {
    return ProductApiModel(
      productId: json['_id'],
      productTitle: json['productTitle'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      productImage: json['productImage'],
      productQuantity: json['productQuantity'],
      productType: json['productType'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productTitle': productTitle,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productType': productType,

    };
  }

  // Convert API Object to Entity
  ProductEntity toEntity() => ProductEntity(
        productId: productId,
        productTitle: productTitle,
        productDescription: productDescription,
        productPrice: productPrice,
        productImage: productImage,
        productQuantity: productQuantity,
        productType: productType,


      );

  // Convert Entity to API Object
  ProductApiModel fromEntity(ProductEntity entity) => ProductApiModel(
        productId: entity.productId ?? '',
        productTitle: entity.productTitle,
        productDescription: entity.productDescription,
        productPrice: entity.productPrice,
        productImage: entity.productImage,
        productQuantity: entity.productQuantity,
        productType: entity.productType,
        
      );

  // Convert API List to Entity List
  List<ProductEntity> toEntityList(List<ProductApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
