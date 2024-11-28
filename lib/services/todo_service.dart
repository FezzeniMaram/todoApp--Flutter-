import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/todo_model.dart';

class TodoService {
  //-----
  static Future<void> add(
      {required title, required description, required date}) async {
    var todo = TodoModel(title: title, description: description, date: date);
    log(todo.toString());
    FirebaseFirestore.instance
        .collection('todo')
        .add(todo.toMap())
        .then((value) => log(value.toString()));
  }

  static Future<List<TodoModel>> getAll() async {
    final data = await FirebaseFirestore.instance.collection("todo").get();
    log(data.docs.length.toString());
    return List<TodoModel>.from(
        data.docs.map((doc) => TodoModel.fromMap(doc.data())));
  }
}
