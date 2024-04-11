import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripify/models/todo_model.dart';

class TodoService {
  Box<TodoModel>? _todoBox;

  Future<void> openBox() async {
    _todoBox = await Hive.openBox<TodoModel>('todos');
  }

  Future<void> closeBox() async {
    await _todoBox!.close();
  }
  //adding

  Future<void> addTodo(TodoModel todoModel) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.add(todoModel);
  }

  //get all todos
  Future<List<TodoModel>> getTodos() async {
    if (_todoBox == null) {
      await openBox();
    }
    return _todoBox!.values.toList();
  }

  //updating

  Future<void> updateTodo(int index, TodoModel todoModel) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.putAt(index, todoModel);
  }

  //deletetodo
  Future<void> deleteTodo(int index) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.deleteAt(index);
  }
}
