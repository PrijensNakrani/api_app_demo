import 'dart:convert';

import 'package:flutter/material.dart';

import '../api_handler/api_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future getData() async {
  //   http.Response response = await http.get(
  //     Uri.parse("https://fakestoreapi.com/products"),
  //   );
  //   var result = jsonDecode(response.body);
  //   return result;
  // }

  Future getData() async {
    var response = await API.apiHandler(
        url: "https://fakestoreapi.com/products", apiType: ApiType.aGet);
    var result = jsonDecode(response);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: (snapshot.data as List).length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    snapshot.data[index]["title"],
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(snapshot.data[index]["image"]),
                  ),
                  subtitle: Text("\$ ${snapshot.data[index]["price"]}"),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
