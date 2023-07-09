import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_final_year/profilePage.dart';

import 'appDrawer.dart';
import 'nots.dart';

void main() {
  runApp(TodoApp());
}

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
  int _selectedIndex = 0;

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
    Future.delayed(const Duration(seconds: 1), _updateDateTime);
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
    final TextEditingController textController = TextEditingController(text: todos[index].task);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: textController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter a task'),
            keyboardType: TextInputType.multiline,
            maxLines: 1,
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final task = textController.text.toLowerCase();
                Navigator.of(context).pop();
                setState(() {
                  todos[index] = Todo(
                    task: task,
                    dateTime: todos[index].dateTime,
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }



  void _deleteTodoTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
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
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
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
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodoTask(index),
            ),
          ),
        );
      },
    );
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
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedTime,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      body: (_selectedIndex == 0)
          ? _buildTodoList()
          : (_selectedIndex == 1)
              ? const NotePage()
              : ProfileScreen(),
      floatingActionButton: (_selectedIndex == 0)
          ? FloatingActionButton(
              onPressed: _addTodo,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
