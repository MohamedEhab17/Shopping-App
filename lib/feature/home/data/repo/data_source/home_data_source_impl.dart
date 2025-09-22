import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_dto.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/data_source/home_data_source_contract.dart';

class HomeDataSourceImpl implements HomeDataSourceContract {
  HomeDataSourceImpl(this._api);
  final HomeApi _api;
  @override
  Future<NetworkResult<List<CategoryEntity>>> getAllCategories() async {
    final result = await _api.getAllCategories();
    switch (result) {
      case NetworkSuccess<List<HomeCategoryResponseDto>>():
        return NetworkSuccess<List<CategoryEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case NetworkError<List<HomeCategoryResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<ProductEntity>>> getAllProducts() async {
    final result = await _api.getAllProducts();
    switch (result) {
      case NetworkSuccess<List<HomeProductsResponseDto>>():
        return NetworkSuccess<List<ProductEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case NetworkError<List<HomeProductsResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<ProductEntity>>> getProductsByCategory(
    int id,
  ) async {
    final result = await _api.getProductsByCategory(id);
    switch (result) {
      case NetworkSuccess<List<HomeProductsResponseDto>>():
        return NetworkSuccess<List<ProductEntity>>(
          result.data.map((e) => e.toEntity()).toList(),
        );
      case NetworkError<List<HomeProductsResponseDto>>():
        return NetworkError(result.message);
    }
  }
}

HomeDataSourceContract injectableHomeDataSource() =>
    HomeDataSourceImpl(HomeApi.instance);
