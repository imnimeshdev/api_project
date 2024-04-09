import 'dart:convert';
 import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Reqres.in_api/Screen.dart';
import 'model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Mobile Product Details"),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green,


        ),
      )
          :     SingleChildScrollView(
        padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  dataFromAPI!.products[1].thumbnail,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Mobile Name:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                    ),
                    const SizedBox(width: 2,),
                    Text(dataFromAPI!.products[1].title.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text("Mobile Price:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text("\$${dataFromAPI!.products[1].price.toString()}",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Mobile Description:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text(dataFromAPI!.products[1].description.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Rating:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(dataFromAPI!.products[1].rating.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Brand:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text(dataFromAPI!.products[1].brand.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Soaks left:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text(dataFromAPI!.products[1].stock.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Discount percentage:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Text("${dataFromAPI!.products[1].discountPercentage.toString()}\%",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);

                    }, icon: const Icon(Icons.navigate_before,
                      size: 30,
                      color: Colors.red,

                    ),
                    ),
                    IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserListPage()));

                    }, icon: const Icon(Icons.navigate_next,
                      size: 30,
                      color: Colors.red,

                    ),
                    ),
                  ],
                )

              ],
            ),
          ),

    );
  }
}
