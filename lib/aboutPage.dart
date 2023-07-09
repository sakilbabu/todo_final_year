import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png', // Replace with the path to your image
                height: 200,
                width: 200,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Royal University of Dhaka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This project was built for educational purposes. It was created as the final year project for my university.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Submitted By:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Md Shakil Ahamed\nid: 2101120489\nDepartment: Computer Science and Engineering',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
