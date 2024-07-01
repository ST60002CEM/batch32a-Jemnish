// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentProductDto _$GetCurrentProductDtoFromJson(
        Map<String, dynamic> json) =>
    GetCurrentProductDto(
      productTitle: json['productTitle'] as String,
      productDescription: json['productDescription'] as String,
      productPrice: json['productPrice'] as String,
      productImage: json['productImage'] as String,
      productQuantity: json['productQuantity'] as String,
      productType: json['productType'] as String,
    );

Map<String, dynamic> _$GetCurrentProductDtoToJson(
        GetCurrentProductDto instance) =>
    <String, dynamic>{
      'productTitle': instance.productTitle,
      'productDescription': instance.productDescription,
      'productPrice': instance.productPrice,
      'productImage': instance.productImage,
      'productQuantity': instance.productQuantity,
      'productType': instance.productType,
    };
