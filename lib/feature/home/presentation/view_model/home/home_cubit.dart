import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:shopping_app/feature/home/domain/use_case/get_product_by_category_id_use_case.dart';
import 'package:shopping_app/feature/home/domain/use_case/get_product_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoryUseCase, this._productUseCase,this._productByCategoryIdUseCase) : super(HomeCategoryInitial());
  final GetCategoryUseCase _categoryUseCase;
  final GetProductUseCase _productUseCase;
  final GetProductByCategoryIdUseCase _productByCategoryIdUseCase;
  List<CategoryEntity> categories = [];
  List<ProductEntity> products = [];

  Future<void> getAllCategories() async {
    emit(HomeCategoryLoading());
    final result = await _categoryUseCase.call();

    switch (result) {
      case NetworkSuccess<List<CategoryEntity>>():
        categories = result.data;
        emit(HomeCategorySuccess());
      case NetworkError<List<CategoryEntity>>():
        emit(HomeCategoryError());
    }
  }

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    final result = await _productUseCase.call();
    switch (result) {
      case NetworkSuccess<List<ProductEntity>>():
        emit(GetAllProductsSuccess());
        products = result.data;
      case NetworkError<List<ProductEntity>>():
        emit(GetAllProductsError());
    }
  }

  Future<void> getProductsByCategory(int id) async {
    emit(HomeProductsByCategoryLoading());
    final result = await _productByCategoryIdUseCase.call(id);
    switch (result) {
      case NetworkSuccess<List<ProductEntity>>():
        emit(HomeProductsByCategorySuccess());
        products = result.data;
      case NetworkError<List<ProductEntity>>():
        emit(HomeProductsByCategoryError());
    }
  }
}
