import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final String productQuantity;
  final String productType;

  const ProductEntity({
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productTitle,
    required this.productType,
  });

  @override
  List<Object?> get props => [
        productDescription,
        productImage,
        productPrice,
        productQuantity,
        productTitle,
        productType,
      ];
}
