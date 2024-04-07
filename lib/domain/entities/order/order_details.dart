import 'package:equatable/equatable.dart';

import '../user/delivery_info.dart';
import 'order_item.dart';

class OrderDetails extends Equatable {
  final String id;
  final String folio;
  final String customerName;
  final String customerEmail;
  final List<OrderItem> orderItems;
  final DeliveryInfo deliveryInfo;

  const OrderDetails({
    required this.folio,
    required this.customerName,
    required this.customerEmail,
    required this.id,
    required this.orderItems,
    required this.deliveryInfo,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
