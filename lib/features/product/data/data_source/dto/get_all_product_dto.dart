import 'package:json_annotation/json_annotation.dart';
import 'package:kheti_pati/features/product/data/model/product_api_model.dart';

part 'get_all_product_dto.g.dart';

@JsonSerializable()
class GetAllProductDTO {
  final bool success;
  final String message;
  final List<ProductApiModel> data;

  GetAllProductDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllProductDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductDTOToJson(this);
}
