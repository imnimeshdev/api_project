import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class UserData {
  final String name;
  final String email;
  final String phoneNumber;

  UserData({required this.name, required this.email, required this.phoneNumber});
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  // Email validation logic
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  // Phone number validation logic
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          userData: UserData(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final UserData userData;

  SecondPage({required this.userData});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _experienceController.text = ''; // Initialize the text field with an empty string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: TextEditingController(text: widget.userData.name),
              decoration: InputDecoration(labelText: 'Name'),
              readOnly: true,
            ),
            TextFormField(
              controller: TextEditingController(text: widget.userData.email),
              decoration: InputDecoration(labelText: 'Email'),
              readOnly: true,
            ),
            TextFormField(
              controller:
              TextEditingController(text: widget.userData.phoneNumber),
              decoration: InputDecoration(labelText: 'Phone Number'),
              readOnly: true,
            ),
            TextFormField(
              controller: _experienceController,
              decoration: InputDecoration(labelText: 'Experiences'),
              // Add validation logic if needed
            ),
            ElevatedButton(
              onPressed: () {
                // Process form data here if needed
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
