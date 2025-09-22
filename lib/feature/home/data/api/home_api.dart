import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/response/home_products_dto.dart';

class HomeApi {
  HomeApi._();
  static HomeApi? _instance;
  static HomeApi get instance => _instance ??= HomeApi._();

  Future<NetworkResult<List<HomeCategoryResponseDto>>>
  getAllCategories() async {
    try {
      //https://api.escuelajs.co/api/v1/categories/
      Uri url = Uri.https("api.escuelajs.co", "/api/v1/categories/");
      var response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      List<HomeCategoryResponseDto> list = json
          .map((element) => HomeCategoryResponseDto.fromJson(element))
          .toList();
      return NetworkSuccess(list);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

  Future<NetworkResult<List<HomeProductsResponseDto>>> getAllProducts() async {
    try {
      //  https://api.escuelajs.co/api/v1/products/
      Uri url = Uri.https("api.escuelajs.co", "/api/v1/products/");
      var response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      List<HomeProductsResponseDto> list = json
          .map((element) => HomeProductsResponseDto.fromJson(element))
          .toList();
      return NetworkSuccess(list);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

  Future<NetworkResult<List<HomeProductsResponseDto>>> getProductsByCategory(
    int id,
  ) async {
    try {
      //https://api.escuelajs.co/api/v1/categories/:categoryId/products
      Uri url = Uri.https(
        "api.escuelajs.co",
        "/api/v1/categories/$id/products",
      );
      var response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      List<HomeProductsResponseDto> list = json
          .map((element) => HomeProductsResponseDto.fromJson(element))
          .toList();
      return NetworkSuccess(list);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }
}
