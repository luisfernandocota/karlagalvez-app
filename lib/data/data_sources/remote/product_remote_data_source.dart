import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../core/constant/strings.dart';
import '../../../domain/usecases/product/get_product_usecase.dart';
import '../../models/product/product_response_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponseModel> getProducts(
      FilterProductParams params, String token);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductResponseModel> getProducts(params, token) =>
      _getProductFromUrl('$baseUrl/products', token);

  Future<ProductResponseModel> _getProductFromUrl(
      String url, String token) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    if (response.statusCode == 200) {
      return productResponseModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
