import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_by_category_id_dto.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_contract.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:shopping_app/feature/home/data/repo/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRepositoryImpl(this._homeDataSourceContract);
  final HomeDataSourceContract _homeDataSourceContract;
  @override
  Future<NetworkResult<List<HomeCategoryResponseDto>>> getAllCategories() =>
      _homeDataSourceContract.getAllCategories();

  @override
  Future<NetworkResult<List<HomeProductsByCategoryIdResponseDto>>>
  getProductsByCategory(int id) =>
      _homeDataSourceContract.getProductsByCategory(id);
}

HomeRepositoryContract injectableHomeRepository() =>
    HomeRepositoryImpl(injectableHomeDataSource());
