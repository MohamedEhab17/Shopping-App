import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepositoryContract {
  Future<NetworkResult<List<CategoryEntity>>> getAllCategories();
  Future<NetworkResult<List<ProductEntity>>> getAllProducts();
  Future<NetworkResult<List<ProductEntity>>> getProductsByCategory(int id);
}
