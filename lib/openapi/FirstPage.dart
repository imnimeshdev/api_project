import 'dart:convert';

import 'package:api_project/openapi/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _isLoading = true;


  @override
  void initState() {
    _getData();
    super.initState();
  }
  DataModel? dataFromAPI;

  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :
      ListView.builder(
           scrollDirection: Axis.vertical,
           itemBuilder: (context, index) {
           return Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));

              },
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    dataFromAPI!.products[index].thumbnail,
                    width: 80,
                  ),
                   Text(dataFromAPI!.products[index].title.toString(),
                     style: const TextStyle(
                         color: Colors.green,
                       fontSize: 14
                      ),
                   ),
                  ],
              ),
            ),
          );
        },
        itemCount: dataFromAPI!.products.length,
      ),
    );
  }
}
