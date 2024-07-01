// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductDTO _$GetAllProductDTOFromJson(Map<String, dynamic> json) =>
    GetAllProductDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductDTOToJson(GetAllProductDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
