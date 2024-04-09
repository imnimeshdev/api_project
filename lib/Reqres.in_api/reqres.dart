import 'dart:convert';
 import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Search_Api/Drop_Down.dart';
import 'listmodel.dart';

class Reqres extends StatefulWidget {
  const Reqres({super.key});

  @override
  State<Reqres> createState() => _ReqresState();
}

class _ReqresState extends State<Reqres> {
  bool _isLoading = true;


  @override
  void initState() {
    _getData();
    super.initState();
  }

  ListUserModel? dataFromAPI;

  _getData() async {
    try {
      String url = "https://reqres.in/api/users?page=2";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = ListUserModel.fromJson(json.decode(res.body));
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
      appBar: AppBar(
        title: const Text('Profile Details',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20
          ),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green)):
      Stack(
        children: [
          Center(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        dataFromAPI!.data[index].avatar,
                        //width: 100,
                      ),

                      Row(

                        children: [
                          const Text("First Name:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(dataFromAPI!.data[index].firstName,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16
                              )
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Last Name:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(dataFromAPI!.data[index].lastName,
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 16
                            ),)
                        ],
                      ),
                      Row(

                        children: [
                          const Text("E-mail:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(dataFromAPI!.data[index].email,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16)
                          ),

                        ],
                      ),



                    ],
                  ),
                );
              },
              itemCount: dataFromAPI!.data.length,
            ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DropdownSearchDemo()));

            }, child: const Text("Next",
            style: TextStyle(
              color: Colors.black
            ),
            )
            ),
          ),

        ],
      ),


    );
  }
}
