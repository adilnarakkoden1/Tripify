import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/db_functioin/todo_db.dart';
import 'package:tripify/models/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({suy});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final TodoService _todoService = TodoService();
  List<TodoModel> _todos = [];

  //loading todos
  Future<void> _loadTodos() async {
    _todos = await _todoService.getTodos();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-do',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: pimaryBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: _todos.isEmpty
            ? const Center(
                child: Text(
                  'Please create a Todo!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  final todo = _todos[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        _showedit(todo, index);
                      },
                      title: Text('${todo.title}'),
                      subtitle: Text('${todo.description}'),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                // Show confirmation
                                bool? result = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Confirm Deletion'),
                                    content: const Text(
                                        'Are you sure you want to delete this to-do?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );

                                if (result == true) {
                                  await _todoService.deleteTodo(index);
                                  _loadTodos();
                                }
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                            Checkbox(
                              value: todo.completed,
                              onChanged: (value) {
                                setState(() {
                                  todo.completed = value!;
                                  _todoService.updateTodo(index, todo);

                                  setState(() {});
                                });
                                //ceck logic//
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //--------------------------------------------
  Future<void> _showDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                children: [
                  const Text(
                    'Plan your Todos',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () async {
                    final newtodo = TodoModel(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        created: DateTime.now(),
                        completed: false);
                    await _todoService.addTodo(newtodo);
                    _titleController.clear();
                    _descriptionController.clear();
                    Navigator.pop(context);
                    _loadTodos();
                  },
                  child: Text('Add')),
            ],
          );
        });
  }

  //========================
  Future<void> _showedit(TodoModel todoModel, int index) async {
    _titleController.text = todoModel.title;
    _descriptionController.text = todoModel.description;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () async {
                    todoModel.title = _titleController.text;
                    todoModel.description = _descriptionController.text;
                    todoModel.created = DateTime.now();
                    if (todoModel.completed == true) {
                      todoModel.completed = false;
                    }
                    _todoService.updateTodo(index, todoModel);
                    _titleController.clear();
                    _descriptionController.clear();
                    Navigator.pop(context);
                    _loadTodos();
                  },
                  child: Text('Update')),
            ],
          );
        });
  }
}
