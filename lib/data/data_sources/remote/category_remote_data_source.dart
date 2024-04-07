import 'package:karlagalvezapp/core/error/failures.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/strings.dart';
import '../../models/category/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<TypeModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TypeModel>> getCategories() =>
      _getCategoryFromUrl('$baseUrl/categories');

  Future<List<TypeModel>> _getCategoryFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return typeModelListFromRemoteJson(response.body);
    } else {
      throw ServerFailure();
    }
  }
}
