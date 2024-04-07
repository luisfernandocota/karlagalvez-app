import 'package:equatable/equatable.dart';

class DeliveryInfo extends Equatable {
  final String id;
  final String address;
  final String numExt;
  final String city;
  final String state;
  final String suburb;
  final String zipCode;

  const DeliveryInfo({
    required this.id,
    required this.address,
    required this.numExt,
    required this.city,
    required this.state,
    required this.suburb,
    required this.zipCode,
  });

  @override
  List<Object> get props => [id];

  Set<String> getFullAddress() =>
      {address, numExt, zipCode, suburb, city, state};
}
