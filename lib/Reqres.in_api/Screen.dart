import 'dart:convert';
 import 'package:api_project/Search_Api/Drop_Down.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 import '../News_Screen.dart';
import 'listmodel.dart';


class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile Details'),
        backgroundColor: Colors.green,
      ),
      body:_isLoading ? const Center(
          child: CircularProgressIndicator(
              color: Colors.green)):
      Stack(
        children: [
          ListView.builder(
            itemCount:  dataFromAPI!.data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage( dataFromAPI!.data[index].avatar),),
                    title: Text("Name: ${dataFromAPI!.data[index].firstName} ${dataFromAPI!.data[index].lastName}"),
                    subtitle: Text("E-mail: ${dataFromAPI!.data[index].email}"),

                  ),
                ),
              );
            },
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
      )
    );
  }
}

