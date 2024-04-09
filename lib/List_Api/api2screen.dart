import 'dart:convert';
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api2model.dart';


class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _isLoading = true;

  List<Product> products = [

  ];

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }


  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
        _isLoading = false;

      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Product List'),
         backgroundColor: Colors.blue,
         actions: [
           Container(
             padding: const EdgeInsets.only(right: 20),
             child: const Icon(Icons.shopping_cart, color: Colors.white,
               size: 25,
             ),
           ),
         ],
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,),
      ):
      GridView.builder(
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           mainAxisSpacing: 10, // spacing between rows
          crossAxisSpacing: 10,
        ),
        physics: const AlwaysScrollableScrollPhysics (),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                child: Card(
                  child: AspectRatio(
                    aspectRatio: 1, // this is the ratio
                    child: CachedNetworkImage( // this is to fetch the image
                      imageUrl: products[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),


              Column(
                children: [
                  Text(products[index].title,
                    style: const TextStyle(
                        fontSize: 10
                    ),
                  ),


                  Row(
                    children: [


                      Text('\  \$ ${products[index].price} ',
                        style: const TextStyle(
                            fontSize: 12,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Spacer(),

                      const Icon(Icons.shopping_cart, color: Colors.black,
                        size: 20,
                      ),// this will give the rating


                    ],
                  )
                ],
              ),
              const Divider(
                thickness: 3,
              ),


            ],
          );
        },
      ),
    );
  }
}
