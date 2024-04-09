 import 'package:api_project/Search_Api/search_page.dart';
  import 'package:flutter/material.dart';

 import 'Dropdown_Api/Drop_down.dart';
import 'List_Api/api2screen.dart';
import 'News_Screen.dart';
import 'Reqres.in_api/reqres.dart';
import 'Reqres.in_api/Screen.dart';
import 'Search_Api/Drop_Down.dart';
import 'Two_dropdown.dart';
import 'image upload.dart';
import 'openapi/Gridview.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
           useMaterial3: true,
       ),
      debugShowCheckedModeBanner: false,
      home:     FirstPage(),
    );
  }
}


