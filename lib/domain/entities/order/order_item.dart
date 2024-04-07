import 'package:equatable/equatable.dart';
import 'package:karlagalvezapp/domain/entities/category/category.dart';

import '../product/price_tag.dart';
import '../product/product.dart';

class OrderItem extends Equatable {
  final String id;
  final Product product;
  final Size size;
  final Category type;
  final num price;
  final num quantity;
  final String namePersonalization;

  const OrderItem({
    required this.id,
    required this.product,
    required this.size,
    required this.price,
    required this.quantity,
    required this.type,
    required this.namePersonalization,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
