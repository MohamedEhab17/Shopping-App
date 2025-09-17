import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_by_category_id_dto.dart';

abstract class HomeRepositoryContract {
  Future<NetworkResult<List<HomeCategoryResponseDto>>> getAllCategories();

  Future<NetworkResult<List<HomeProductsByCategoryIdResponseDto>>> getProductsByCategory(int id);

}
