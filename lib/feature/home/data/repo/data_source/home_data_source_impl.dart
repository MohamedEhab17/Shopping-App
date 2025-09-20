import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_by_category_id_dto.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_contract.dart';

class HomeDataSourceImpl implements HomeDataSourceContract {
  HomeDataSourceImpl(this._api);
  final HomeApi _api;
  @override
  Future<NetworkResult<List<HomeCategoryResponseDto>>>
  getAllCategories() async => await _api.getAllCategories();

  @override
  Future<NetworkResult<List<HomeProductsByCategoryIdResponseDto>>>
  getProductsByCategory(int id) async => await _api.getProductsByCategory(id);
  
  @override
  Future<NetworkResult<List<HomeProductsByCategoryIdResponseDto>>> getAllProducts() async => await _api.getAllProducts();
}

HomeDataSourceContract injectableHomeDataSource() =>
    HomeDataSourceImpl(HomeApi.instance);
