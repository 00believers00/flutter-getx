import 'package:flutter/material.dart';

import '../../../../data/models/todo_detail.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.detail}) : super(key: key);
  final TodoDetail detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Card(
          color: (detail.completed != null)
              ? detail.completed!
                  ? Colors.green
                  : Colors.deepOrangeAccent
              : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${detail.id}"),
                    Text("${detail.userId}"),
                  ],
                ),
                Expanded(
                  child: Flexible(
                    child: Text(detail.title ?? "N/A"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
