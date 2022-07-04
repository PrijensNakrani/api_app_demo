import 'package:api_app_demo/api_service/api_service.dart';
import 'package:flutter/material.dart';

import '../model/all_user_model.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices.allUser(),
          builder:
              (BuildContext context, AsyncSnapshot<AllUserModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.userCount,
                itemBuilder: (context, index) {
                  final user = snapshot.data!.users![index];
                  return Dismissible(
                      key: ValueKey(user.username),
                      background: Container(
                        color: Colors.red,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 100,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        var body = {"username": user.username};
                        ApiServices.deleteUser(reqBody: body, context: context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(user.username.toString()),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
