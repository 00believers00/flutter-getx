// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDetail _$TodoDetailFromJson(Map<String, dynamic> json) => TodoDetail(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$TodoDetailToJson(TodoDetail instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
