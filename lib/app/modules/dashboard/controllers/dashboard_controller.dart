import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/todo_detail.dart';
import '../../../data/networks/api/todo_client.dart';
import '../../../routes/app_pages.dart';
import '../../../data/networks/http_networks.dart';
import '../../../data/services/localization_service.dart';

class DashboardController extends GetxController {
  RxInt dex = 99.obs;

  // late RxList todoList;
  RxList<TodoDetail> todoList = <TodoDetail>[].obs;
  final TextEditingController controllerTodo = TextEditingController();
  final httpNetworks = Get.find<HttpNetworks>();
  RxString selectedLang = LocalizationService.languages.first.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void nextSettings() {
    Get.toNamed(AppRoutes.settings);
  }

  void onChangeLocalization(value) {
    // updates dropdown selected value
    selectedLang.value = value;
    // gets language and changes the locale
    LocalizationService().changeLocale(value);
  }

  bool addTodoList(String data) {
    if (data.isNotEmpty) {
      _addTodoList(data);
      return true;
    }
    return false;
  }

  void _addTodoList(String data) {
    todoList.add(TodoDetail(
      userId: 32,
      id: DateTime.now().millisecond,
      title: data,
      completed: false
    ));
  }

  Future<void> getTodoList() async {
    try {
      // debugPrint("baseUrl:${httpNetworks.baseUrl}");
      // final client = TodoClient(httpNetworks.dio, baseUrl: httpNetworks.baseUrl);
      // List<TodoDetail> todos = await client.getTodoList();
      // todoList.value = todos;
      final result = await httpNetworks.dio.get("${httpNetworks.baseUrl}/user-info");

      //debugPrint("getTodoList:$result");
    } catch (e) {
      debugPrint("ERROR getTodoList:$e");
    }
  }
}
