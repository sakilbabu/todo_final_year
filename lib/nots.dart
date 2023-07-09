import 'package:flutter/material.dart';


class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotesPage(),
    );
  }
}
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
    );
  }
}
