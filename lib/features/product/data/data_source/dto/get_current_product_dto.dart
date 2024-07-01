import 'package:json_annotation/json_annotation.dart';
import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

part 'get_current_product_dto.g.dart';

@JsonSerializable()
class GetCurrentProductDto {
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  final String productType;

  GetCurrentProductDto({
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
    required this.productType,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      productTitle: productTitle,
      productDescription: productDescription,
      productPrice: productPrice,
      productImage: productImage,
      productQuantity: productQuantity,
      productType: productType,
    );
  }

  factory GetCurrentProductDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentProductDtoToJson(this);
}
