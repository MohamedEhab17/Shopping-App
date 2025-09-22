import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/repo/repository/home_repository_impl.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetCategoryUseCase {
  const GetCategoryUseCase(this._repository);
  final HomeRepositoryContract _repository;

  Future<NetworkResult<List<CategoryEntity>>> call() =>
      _repository.getAllCategories();
}

GetCategoryUseCase injectGetCategoryUseCase() => GetCategoryUseCase(injectableHomeRepository());