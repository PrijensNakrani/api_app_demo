import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _userName = TextEditingController();
  final _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future PostData({
    String? firstName,
    String? lastName,
    String? userName,
    String? password,
  }) async {
    Map<String, dynamic> reqData = {
      "first_name": firstName,
      "last_name": lastName,
      "username": userName,
      "password": password,
      "avatar":
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"
    };
    http.Response response = await http.post(
      Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
      body: reqData,
    );
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must be not empty";
                  }
                },
                controller: _firstName,
                decoration: const InputDecoration(
                  hintText: "Firs Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must be not empty";
                  }
                },
                controller: _lastName,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must be not empty";
                  }
                },
                controller: _userName,
                decoration: const InputDecoration(
                  hintText: "user Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must be not empty";
                  }
                },
                controller: _password,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  PostData(
                    firstName: _firstName.text,
                    lastName: _lastName.text,
                    password: _password.text,
                    userName: _userName.text,
                  );
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
