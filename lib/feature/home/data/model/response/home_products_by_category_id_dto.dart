import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';

class HomeProductsByCategoryIdResponseDto {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  HomeCategoryResponseDto? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  HomeProductsByCategoryIdResponseDto({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  HomeProductsByCategoryIdResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? HomeCategoryResponseDto.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  
}

