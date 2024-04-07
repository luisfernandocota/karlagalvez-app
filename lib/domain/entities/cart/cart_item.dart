import 'package:equatable/equatable.dart';
import 'package:karlagalvezapp/domain/entities/category/category.dart';

import '../product/price_tag.dart';
import '../product/product.dart';

class CartItem extends Equatable {
  final String? id;
  final Product product;
  final Size size;
  final Category? type;

  const CartItem(
      {this.id, required this.product, required this.size, this.type});

  @override
  List<Object?> get props => [id];
}
