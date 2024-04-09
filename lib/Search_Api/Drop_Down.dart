import 'package:flutter/material.dart';


class DropdownSearchDemo extends StatefulWidget {
  @override
  _DropdownSearchDemoState createState() => _DropdownSearchDemoState();
}

class _DropdownSearchDemoState extends State<DropdownSearchDemo> {
  var _selectedOption;
  String _searchQuery = '';
  List<String> _options = ["Author", "Book", "All", "Subject"];
  List<String> _availableBooks = ["Story Book", "Comedy Book", "Love Book", "Tech Book"];
  List<String> _availableAuthors = ["James Author", "David Author", "Hope Author"];
  List<String> _availableSubjects = ["Tamil", "English", "Maths"];

  List<String> _filteredItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown & Search  '),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(

          children: [
            DropdownButton<String>(
              value: _selectedOption,
              onChanged: (  newValue) {
                setState(() {
                  _selectedOption = newValue!;
                  _updateDisplayItems();
                });
              },
              items: _options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text('Select an option'),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  if (_searchQuery.isNotEmpty) {
                    _updateDisplayItems();
                  } else {
                    _filteredItems.clear(); // Clear the list when search query is empty
                  }
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter search query',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 100),
            if (_searchQuery.isNotEmpty  || _selectedOption == 'All')
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredItems[index]),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _updateDisplayItems() {
    _filteredItems.clear();

    if (_selectedOption == 'All') {
      _filteredItems.addAll(_availableBooks);
      _filteredItems.addAll(_availableAuthors);
      _filteredItems.addAll(_availableSubjects);
    }
    else {
      List<String> selectedList;
      switch (_selectedOption) {
        case 'Book':
          selectedList = _availableBooks;
          break;
        case 'Author':
          selectedList = _availableAuthors;
          break;
        case 'Subject':
          selectedList = _availableSubjects;
          break;
        default:
          selectedList = [];
      }

      for (String item in selectedList) {
        if (_searchQuery.isEmpty ||
            item.toLowerCase().contains(_searchQuery.toLowerCase())) {
          _filteredItems.add(item);
        }
      }
    }
  }
}
