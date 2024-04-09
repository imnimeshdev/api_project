import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DropdownFromApiDemo extends StatefulWidget {
  @override
  _DropdownFromApiDemoState createState() => _DropdownFromApiDemoState();
}

class _DropdownFromApiDemoState extends State<DropdownFromApiDemo> {
  List<dynamic> _dropdownItems = [];
  dynamic _selectedItem;
  bool _isLoading = true; // Initial loading indicator for fetching data from API
  bool _dropdownLoading = false; // Loading indicator for loading additional details after selecting a dropdown option

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        _dropdownItems = data;
        _isLoading = false; // Set isLoading to false after fetching data from API
      });
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  void handleDropdownChange(dynamic newValue) {
    setState(() {
      _selectedItem = newValue;
      _dropdownLoading = true; // Set dropdownLoading to true after selecting a dropdown option
    });

    // Simulate loading delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _dropdownLoading = false; // Set dropdownLoading to false after loading additional details
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown from API'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Initial loading indicator while fetching data from API
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedItem,
                  items: _dropdownItems.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item['name']),
                    );
                  }).toList(),
                  onChanged: _dropdownLoading ? null : handleDropdownChange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _dropdownLoading
                ? const CircularProgressIndicator() // Loading indicator while loading additional details after selecting a dropdown option
                : _selectedItem != null
                ? Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${_selectedItem['name']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Username: ${_selectedItem['username']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Email: ${_selectedItem['email']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Address: ${_selectedItem['address']['street']}, ${_selectedItem['address']['suite']}, ${_selectedItem['address']['city']}, ${_selectedItem['address']['zipcode']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Phone: ${_selectedItem['phone']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Website: ${_selectedItem['website']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Company: ${_selectedItem['company']['name']}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
