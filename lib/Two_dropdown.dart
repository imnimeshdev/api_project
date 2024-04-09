import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  var _selectedSubject;
  var _selectedOption;

  Map<String, List<String>> _options = {
    'Maths': ['Algebra', 'Geometry', 'Trigonometry'],
    'Science': ['Physics', 'Chemistry', 'Biology'],
    'History': ['Ancient', 'Medieval', 'Modern']
  };

  List<String> _subjects = ['Maths', 'Science', 'History'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropdownButton<String>(
              value: _selectedSubject,
              hint: Text('Select Subject'),
              onChanged: (  newValue) {
                setState(() {
                  _selectedSubject = newValue;
                  _selectedOption = null; // Reset selected option when subject changes
                });
              },
              dropdownColor: Colors.black, // Setting background color for dropdown options
              items: _subjects.map((String subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(
                    subject,
                    style: TextStyle(color: Colors.green), // Setting text color for dropdown options
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),
            DropdownButton<String>(
              value: _selectedOption,
              hint: Text('Select Option'),
              onChanged: _selectedSubject != null
                  ? (  newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              } : null,
              dropdownColor: Colors.black, // Setting background color for dropdown options
              items: _selectedSubject != null
                  ? _options[_selectedSubject]?.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.green), // Setting text color for dropdown options
                  ),
                );
              }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
