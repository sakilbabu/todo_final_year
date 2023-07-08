import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoScreen(),
    );
  }
}

class Todo {
  String task;
  DateTime dateTime;

  Todo({
    required this.task,
    required this.dateTime,
  });
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = [];

  void _addTodo() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          todos.add(Todo(
            task: '',
            dateTime: pickedDateTime,
          ));
        });

        _editTodoTask(todos.length - 1);
      }
    }
  }

  void _editTodoTask(int index) async {
    final TextEditingController textController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter a task'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  final task = textController.text;
                  todos[index] = Todo(
                    task: task,
                    dateTime: todos[index].dateTime,
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    textController.dispose();
  }

  void _deleteTodoTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];

          return ListTile(
            title: Text(todo.task.isNotEmpty ? todo.task : 'No task'),
            subtitle: Text(DateFormat('yyyy-MM-dd   HH:mm').format(todo.dateTime)),
            onTap: () => _editTodoTask(index),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTodoTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
