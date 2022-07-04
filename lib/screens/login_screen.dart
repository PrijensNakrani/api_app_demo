import 'package:api_app_demo/api_service/api_service.dart';
import 'package:api_app_demo/model/login_model.dart';
import 'package:api_app_demo/screens/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _mobile,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Mobile No."),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _password,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    LoginModel model = LoginModel();
                    model.email = _mobile.text;
                    model.password = _password.text;
                    model.clientKey = "1595922666X5f1fd8bb5f662";
                    model.deviceType = "MOB";

                    // ApiServices.loginUser(model.toJson())
                    //     .then((value) => Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => HomePage(),
                    //         )));
                    bool? status = await ApiServices.loginUser(model.toJson());
                    if (status == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Login faild")));
                    }
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
