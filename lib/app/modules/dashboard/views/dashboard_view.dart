import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';


import '../../../data/models/todo_detail.dart';
import '../../../data/services/localization_service/localization_service.dart';
import '../controllers/dashboard_controller.dart';
import 'widgets/todo_card.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            icon: const Icon(Icons.arrow_drop_down),
            value: controller.selectedLang.value,
            items: LocalizationService.languages.map((String lang) {
              return DropdownMenuItem(value: lang, child: Text(lang,));
            }).toList(),
            onChanged: controller.onChangeLocalization,
          ),
          IconButton(
              onPressed: () {
                controller.nextSettings();
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "dashboard.title".tr,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: [
                const Text("TODO:"),
                Expanded(
                  child: TextField(
                    controller: controller.controllerTodo,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      bool status = controller.addTodoList(controller.controllerTodo.text);
                      if (!status) {
                        Get.defaultDialog(title: "Text Empty", middleText: "Please Enter Todo.");
                      }
                    },
                    child: const Text("Add Todo")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.getTodoList();
                },
                child: const Text("Get Todo List")),
            const SizedBox(
              height: 10,
            ),
            ObxValue<RxList<TodoDetail>>(
                (p0) => Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: p0.reversed
                            .toList()
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                  key,
                                  TodoCard(
                                    detail: value,
                                  )),
                            )
                            .values
                            .toList(),
                      ),
                    )),
                controller.todoList),
            // Obx((){
            //   return Text(controller.todoList.length.toString());
            // }),
          ],
        ),
      ),
    );
  }
}
