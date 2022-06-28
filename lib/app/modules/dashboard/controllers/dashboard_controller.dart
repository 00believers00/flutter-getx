import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/data/services/todo_api_service/todos_api_service.dart';

import '../../../data/models/todo_detail.dart';
import '../../../data/networks/exceptions/api_exceptions.dart';
import '../../../data/services/localization_service/localization_service.dart';
import '../../../routes/app_pages.dart';
import '../../../data/networks/http_networks.dart';

class DashboardController extends GetxController {
  RxInt dex = 99.obs;

  // late RxList todoList;
  RxList<TodoDetail> todoList = <TodoDetail>[].obs;
  final TextEditingController controllerTodo = TextEditingController();
  // final httpNetworks = Get.find<HttpNetworks>();
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
      final result = await Get.find<TodosApiService>().getTopic();
      debugPrint("getTodoList:$result");
    } on ApiException {
      Get.defaultDialog(
        title:
        'We apologize, your order could not be placed at this time.\nPlease try again.',
        onConfirm: Get.back,
      );
      return;
    }
  }
}
