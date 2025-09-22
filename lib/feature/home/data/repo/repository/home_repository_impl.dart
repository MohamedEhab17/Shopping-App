import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/data_source/home_data_source_contract.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRepositoryImpl(this._homeDataSourceContract);
  final HomeDataSourceContract _homeDataSourceContract;
  @override
  Future<NetworkResult<List<CategoryEntity>>> getAllCategories() =>
      _homeDataSourceContract.getAllCategories();

  @override
  Future<NetworkResult<List<ProductEntity>>> getProductsByCategory(
    int id,
  ) => _homeDataSourceContract.getProductsByCategory(id);

  @override
  Future<NetworkResult<List<ProductEntity>>> getAllProducts() =>
      _homeDataSourceContract.getAllProducts();
}

HomeRepositoryContract injectableHomeRepository() =>
    HomeRepositoryImpl(injectableHomeDataSource());
