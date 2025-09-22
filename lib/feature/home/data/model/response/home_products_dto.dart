import 'package:shopping_app/feature/home/data/model/response/home_category_response_dto.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class HomeProductsResponseDto {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  HomeCategoryResponseDto? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  HomeProductsResponseDto({
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

  HomeProductsResponseDto.fromJson(Map<String, dynamic> json) {
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

  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 1,
      title: title ?? "",
      slug: slug ?? "",
      price: price ?? 0,
      description: description ?? "",
      category: category!.toEntity(),
      images: images ?? [],
    );
  }
}
