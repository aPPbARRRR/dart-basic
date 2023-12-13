// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_application_1/12_05/assignment_12_1/tangible_asset.dart';

class Book extends TangibleAsset {
  String name;
  int price;
  String color;
  String isbn;

  Book(
      {required this.name,
      required this.price,
      required this.color,
      required this.isbn,
      required super.weight});
}
