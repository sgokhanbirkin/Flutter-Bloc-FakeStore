// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'product_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductModel extends INetworkModel<ProductModel?> {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  ProductModel fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  @override
  Map<String, dynamic>? toJson() => null;

  @override
  String toString() {
    return 'Title : $title \nprice : $price\ndescription : $description\ncategory : $category';
  }
}

@JsonSerializable(createToJson: false)
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }
}
