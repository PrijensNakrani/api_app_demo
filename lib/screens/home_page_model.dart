import 'package:api_app_demo/api_service/api_service.dart';
import 'package:api_app_demo/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenModel extends StatefulWidget {
  const HomeScreenModel({Key? key}) : super(key: key);

  @override
  State<HomeScreenModel> createState() => _HomeScreenModelState();
}

class _HomeScreenModelState extends State<HomeScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiServices.getModel(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(
                    "${product.title}",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("${product.image}"),
                  ),
                  subtitle: Text("${product.rating!.rate}"),
                );
              },
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
