import 'package:json_annotation/json_annotation.dart';

class Rating {
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'count')
  int? count;

  Rating({this.rate, this.count});
}
