// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController _searchController = TextEditingController();
//   List<dynamic> _searchResults = [];
//
//
//   Future<void> fetchData(String query) async {
//     final response = await http.get(Uri.parse(
//         'https://jsonplaceholder.typicode.com/todos?title=$query'));
//      if (response.statusCode == 200) {
//       setState(() {
//         _searchResults = jsonDecode(response.body);
//       });
//     } else {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No data')));
//
//      // throw Exception('Failed to load data');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('API'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                    fetchData(_searchController.text);
//                  },
//                 child: const Text('Search'),
//               ),
//               const SizedBox(height: 16.0),
//               _searchResults.isNotEmpty
//                   ?
//               Expanded(
//
//                 child:  ListView.builder(
//                   itemCount: _searchResults.length,
//                   itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                         title: Text(_searchResults[index]['title']),
//                           subtitle: Text('Completed: ${_searchResults[index]['completed']}'),
//                   );
//                 },
//               ),
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
