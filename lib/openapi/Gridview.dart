import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'model.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
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
    return   Scaffold(
      backgroundColor: Colors.black,
     body: _isLoading
         ? const Center(child: CircularProgressIndicator())
         : SingleChildScrollView(child: Column(children: [
           GridView.builder(
               gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisSpacing: 30, // spacing between rows
               crossAxisSpacing: 30,
             ),
             physics: const NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
             scrollDirection: Axis.vertical,
             itemCount: dataFromAPI!.products.length,
             itemBuilder: (context, index) {
               return InkWell(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
                   },
                 child: Container(
                   // margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                   color: Colors.black,
                   child: ClipRect(
                     child:   Image.network(
                       dataFromAPI!.products[index].thumbnail,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
               );
             },
           ),


         ],
       )
     ),

    );
  }
}
