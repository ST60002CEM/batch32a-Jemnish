import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  final String productType;

  const ProductEntity({
    this.id,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productTitle,
    required this.productType,
  });

  @override
  List<Object?> get props => [
        id,
        productDescription,
        productImage,
        productPrice,
        productQuantity,
        productTitle,
        productType,
      ];
}
