import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
        ),
      ),
    );
  }
}
