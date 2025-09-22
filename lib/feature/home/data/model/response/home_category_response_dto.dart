import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

class HomeCategoryResponseDto {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  HomeCategoryResponseDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  HomeCategoryResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? 1,
      name: name ?? "",
      slug: slug ?? "",
      image: image ?? "",
    );
  }
}
