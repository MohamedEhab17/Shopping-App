import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/repo/repository/home_repository_impl.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetProductByCategoryIdUseCase {
  GetProductByCategoryIdUseCase(this._repository);
  final HomeRepositoryContract _repository;

  Future<NetworkResult<List<ProductEntity>>> call(int id) =>
      _repository.getProductsByCategory(id);
}

GetProductByCategoryIdUseCase injectGetProductByCategoryIdUseCase() => GetProductByCategoryIdUseCase(injectableHomeRepository());