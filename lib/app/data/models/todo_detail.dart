import 'package:json_annotation/json_annotation.dart';

part 'todo_detail.g.dart';

@JsonSerializable()
class TodoDetail {

  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoDetail({this.userId, this.id, this.title, this.completed});

  factory TodoDetail.fromJson(Map<String, dynamic> json) => _$TodoDetailFromJson(json);
  Map<String, dynamic> toJson() => _$TodoDetailToJson(this);
}