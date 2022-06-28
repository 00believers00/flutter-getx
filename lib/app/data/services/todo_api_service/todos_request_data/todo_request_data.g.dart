// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequestData _$TodoRequestDataFromJson(Map<String, dynamic> json) =>
    TodoRequestData(
      topic: json['topic'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$TodoRequestDataToJson(TodoRequestData instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'completed': instance.completed,
    };
