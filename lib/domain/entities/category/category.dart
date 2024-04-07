import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String charge;

  const Category({
    required this.id,
    required this.name,
    required this.charge,
  });

  @override
  List<Object?> get props => [id];
}
