import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  String _name = 'Md Shakil Ahamed';
  String _jobTitle = 'Software Engineer';
  String _email = 'sakil@hotmail.com';
  String _phone = '+8801758454772';
  String _location = 'Dhaka,Bangladesh';

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _jobController.text = _jobTitle;
    _emailController.text = _email;
    _phoneController.text = _phone;
    _locationController.text = _location;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _name = _nameController.text;
      _jobTitle = _jobController.text;
      _email = _emailController.text;
      _phone = _phoneController.text;
      _location = _locationController.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Icon(Icons.person,
           size: 120,
          color: Colors.deepPurple,),
          SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            enabled: _isEditing,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _jobController,
            enabled: _isEditing,
            decoration: InputDecoration(
              labelText: 'Job Title',
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.email,color: Colors.deepPurple),
            title: TextFormField(
              controller: _emailController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone,color: Colors.deepPurple,),
            title: TextFormField(
              controller: _phoneController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on,color: Colors.deepPurple),
            title: TextFormField(
              controller: _locationController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
          ),
          SizedBox(height: 16),
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.save,
              size: 50,
              color: Colors.deepPurple,),
              onPressed: _saveChanges,
            ),
          IconButton(
            icon: Icon(_isEditing ? Icons.cancel : Icons.edit,color: Colors.deepPurple,size: 50,),
            onPressed: _toggleEdit,
          ),
        ],
      ),
    );
  }
}
