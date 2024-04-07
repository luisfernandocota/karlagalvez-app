import 'package:karlagalvezapp/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<TypeModel>> getCategories();
  Future<void> saveCategories(List<TypeModel> categoriesToCache);
}

const cachedCategories = 'CACHED_CATEGORIES';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;
  CategoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TypeModel>> getCategories() {
    final jsonString = sharedPreferences.getString(cachedCategories);
    if (jsonString != null) {
      return Future.value(typeModelListFromLocalJson(jsonString));
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<void> saveCategories(List<TypeModel> categoriesToCache) {
    return sharedPreferences.setString(
      cachedCategories,
      typeModelListToJson(categoriesToCache),
    );
  }
}
