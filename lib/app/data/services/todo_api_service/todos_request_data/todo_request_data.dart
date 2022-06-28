import 'package:json_annotation/json_annotation.dart';

part 'todo_request_data.g.dart';

@JsonSerializable()
class TodoRequestData {
  TodoRequestData({
    required this.topic,
    required this.completed,
  });

  final String topic;
  final bool completed;

  factory TodoRequestData.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$TodoRequestDataToJson(this);
}