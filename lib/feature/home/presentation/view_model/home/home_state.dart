part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeCategoryInitial extends HomeState {}

final class HomeCategoryLoading extends HomeState {}

final class HomeCategorySuccess extends HomeState {}

final class HomeCategoryError extends HomeState {}




final class GetAllProductsLoading extends HomeState {}

final class GetAllProductsSuccess extends HomeState {}

final class GetAllProductsError extends HomeState {}

final class HomeProductsByCategoryLoading extends HomeState {}

final class HomeProductsByCategorySuccess extends HomeState {}

final class HomeProductsByCategoryError extends HomeState {}