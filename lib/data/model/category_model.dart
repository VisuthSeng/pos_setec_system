import 'dart:convert';

class CategoryModel {
  final String id;
  final String name;
  final String img;

  CategoryModel({
    required this.id,
    required this.name,
    required this.img,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? img,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'img': img,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(id: $id, name: $name, img: $img)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name == name &&
        other.img == img;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ img.hashCode;
}
