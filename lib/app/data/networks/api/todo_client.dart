import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/todo_detail.dart';

part 'todo_client.g.dart';

@RestApi()
abstract class TodoClient {
  factory TodoClient(Dio dio, {String baseUrl}) = _TodoClient;

  @GET("/todos")
  Future<List<TodoDetail>> getTodoList();
}
