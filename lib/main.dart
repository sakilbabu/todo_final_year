import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_final_year/appDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final TextEditingController textController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: textController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter a task'),
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
              ? SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                          // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Set the clip behavior of the card
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widgets of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                              Image.network(
                                'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS0CPzyADrTZT2g0a03Lh51eCAA9Any8wuXEnRgttzJ4nl21V3E',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              // Add a container with padding that contains the card's title, text, and buttons
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      "Stephen R. Covey",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      'The 7 Habits of Highly Effective People',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    // Add a row with two buttons spaced apart and aligned to the right side of the card
                                    Row(
                                      children: <Widget>[
                                        // Add a spacer to push the buttons to the right side of the card
                                        const Spacer(),
                                        // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "SHARE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "EXPLORE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {
                                            _launchUrl("www.facebook.com");
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Add a small space between the card and the next widget
                              Container(height: 5),
                            ],
                          ),
                        ),
                        Card(
                          // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Set the clip behavior of the card
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widgets of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                              Image.network(
                                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQHv2LgBcAojD9tLZcCZwOM1TB-Pm_9B9EY2zBZE5McZOnDdnN1',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              // Add a container with padding that contains the card's title, text, and buttons
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      "Mark Manson",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      'The Subtle Art of Not Giving a F*ck',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    // Add a row with two buttons spaced apart and aligned to the right side of the card
                                    Row(
                                      children: <Widget>[
                                        // Add a spacer to push the buttons to the right side of the card
                                        const Spacer(),
                                        // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "SHARE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "EXPLORE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Add a small space between the card and the next widget
                              Container(height: 5),
                            ],
                          ),
                        ),
                        Card(
                          // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Set the clip behavior of the card
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widgets of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa8fK2XPR2ahpu1PZOLzTK4It1_VvoSwVuTvk1jc34dw58IOaX',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              // Add a container with padding that contains the card's title, text, and buttons
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      "Paulo Coelho",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      'The Alchemist',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    // Add a row with two buttons spaced apart and aligned to the right side of the card
                                    Row(
                                      children: <Widget>[
                                        // Add a spacer to push the buttons to the right side of the card
                                        const Spacer(),
                                        // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "SHARE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "EXPLORE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Add a small space between the card and the next widget
                              Container(height: 5),
                            ],
                          ),
                        ),
                        Card(
                          // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Set the clip behavior of the card
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widgets of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                              Image.network(
                                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTMadNIsQmJH-Yh4fgFTA3fKEV5rF_Xgzrg-my-345kaICKVWdk',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              // Add a container with padding that contains the card's title, text, and buttons
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      "William H. McRaven",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      'Make Your Bed',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    // Add a row with two buttons spaced apart and aligned to the right side of the card
                                    Row(
                                      children: <Widget>[
                                        // Add a spacer to push the buttons to the right side of the card
                                        const Spacer(),
                                        // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "SHARE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "EXPLORE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Add a small space between the card and the next widget
                              Container(height: 5),
                            ],
                          ),
                        ),
                        Card(
                          // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Set the clip behavior of the card
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widgets of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                              Image.network(
                                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS8t902mozZtNMVvdk7a3yyhtE1ToWBBpWoa4-w_9oYPu7ebi1k',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              // Add a container with padding that contains the card's title, text, and buttons
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      "Napoleon Hill",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      'Think and Grow Rich',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    // Add a row with two buttons spaced apart and aligned to the right side of the card
                                    Row(
                                      children: <Widget>[
                                        // Add a spacer to push the buttons to the right side of the card
                                        const Spacer(),
                                        // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "SHARE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            "EXPLORE",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Add a small space between the card and the next widget
                              Container(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.blue,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://example.com/profile_image.jpg'), // Replace with your own image URL
                          ),
                          SizedBox(height: 16),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Software Engineer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('johndoe@example.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('+1 123 456 7890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('New York, USA'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
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
            icon: Icon(Icons.brightness_2),
            label: 'Focus Mode',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

Future<void> _launchUrl(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(
      urlString,
      forceWebView: true,
    );
  } else {
    print("Can\'t Launch Url");
  }
}
