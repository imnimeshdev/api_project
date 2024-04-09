// import 'dart:convert';
//  import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class NewsScreen extends StatefulWidget {
//   @override
//   _NewsScreenState createState() => _NewsScreenState();
// }
//
// class _NewsScreenState extends State<NewsScreen> {
//   List<dynamic> articles = [];
//    @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//
//   Future<void> fetchNews() async {
//     final apiKey = '3385969f6b0b4f64b84c335232c0b67d ';
//     final url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         setState(() {
//            articles = json.decode(response.body)['articles'];
//         });
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('News App'),
//       ),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           final article = articles[index];
//           return GestureDetector(
//             onTap: () {
//              },
//             child: Card(
//               color: Colors.orange,
//               elevation: 10,
//               margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(
//                           image: NetworkImage(article['urlToImage'] ?? ''),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//
//                           Text(
//                              article['title'] ?? '',
//                              style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 17,
//                             ),
//                             // maxLines: 6,
//                             // overflow: TextOverflow.fade,
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             article['description'] ?? '',
//                             style: const TextStyle(fontSize: 14),
//                             // maxLines: 6,
//                             // overflow: TextOverflow.fade,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
