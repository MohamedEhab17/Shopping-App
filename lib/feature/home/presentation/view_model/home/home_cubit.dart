import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_by_category_id_dto.dart';
import 'package:shopping_app/feature/home/data/repo/repository/home_repository_contract.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeCategoryInitial());
  final HomeRepositoryContract _repository;
  List<HomeCategoryResponseDto> categories = [];
  List<HomeProductsByCategoryIdResponseDto> products = [];
  Future<void> getAllCategories() async {
    emit(HomeCategoryLoading());
    final result = await _repository.getAllCategories();

    switch (result) {
      case NetworkSuccess<List<HomeCategoryResponseDto>>():
        categories = result.data;
        emit(HomeCategorySuccess());
      case NetworkError<List<HomeCategoryResponseDto>>():
        emit(HomeCategoryError());
    }
  }

  Future<void> getProductsByCategory(int id) async {
    emit(HomeProductsByCategoryLoading());
    final result = await _repository.getProductsByCategory(id);
    switch (result) {
      case NetworkSuccess<List<HomeProductsByCategoryIdResponseDto>>():
        emit(HomeProductsByCategorySuccess());
        products = result.data;
      case NetworkError<List<HomeProductsByCategoryIdResponseDto>>():
        emit(HomeProductsByCategoryError());
    }
  }
}
