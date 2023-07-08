import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_final_year/appDrawer.dart';



void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoScreen(),
    );
  }
}

class Todo {
  String task;
  DateTime dateTime;
  bool isCompleted;

  Todo({
    required this.task,
    required this.dateTime,
    this.isCompleted = false,
  });
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    // Update the time and date every second
    // by calling the _updateDateTime function.
    _updateDateTime();
  }

  void _updateDateTime() {
    setState(() {});
    // Delay the next update by 1 second.
    Future.delayed(Duration(seconds: 1), _updateDateTime);
  }

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
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    final formattedDate = DateFormat('EEE, MMM d').format(now);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],

      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];

          return Card(
            elevation: 2,
            color: todo.isCompleted ? Colors.grey[300] : Colors.white,
            child: ListTile(
              title: Text(
                todo.task.isNotEmpty ? todo.task : 'No task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                  color: todo.isCompleted ? Colors.grey[700] : Colors.black,
                ),
              ),
              subtitle: Text(
                DateFormat('yyyy-MM-dd   HH:mm').format(todo.dateTime),
                style: TextStyle(
                  color: todo.isCompleted ? Colors.grey[600] : Colors.grey[700],
                ),
              ),
              onTap: () {
                setState(() {
                  todo.isCompleted = !todo.isCompleted;
                });
              },
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteTodoTask(index),
              ),
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
