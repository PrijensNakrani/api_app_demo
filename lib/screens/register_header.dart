import 'package:api_app_demo/model/register_model.dart';
import 'package:api_app_demo/model/register_response_model.dart';
import 'package:api_app_demo/repo/reginster_user_repo.dart';
import 'package:api_app_demo/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _dob = TextEditingController();
  final _mobile = TextEditingController();
  final _password = TextEditingController();
  final _confirmPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "must be not empty";
                      }
                    },
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: "user Name",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "must be not empty";
                      }
                    },
                    controller: _dob,
                    decoration: const InputDecoration(
                      hintText: "DOB",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "must be not empty";
                      }
                    },
                    controller: _mobile,
                    decoration: const InputDecoration(
                      hintText: "Mobile No",
                    ),
                  ),
                  const SizedBox(
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
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "must be not empty";
                      }
                    },
                    controller: _confirmPass,
                    decoration: const InputDecoration(
                      hintText: " Confirm Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        RegisterModel model = RegisterModel();
                        model.fname = _firstName.text;
                        model.lname = _lastName.text;
                        model.email = _email.text;
                        model.dob = _dob.text;
                        model.mobile = _mobile.text;
                        model.password = _password.text;
                        model.confirmPassword = _confirmPass.text;
                        model.clientKey = "1595922666X5f1fd8bb5f662";
                        model.deviceType = "MOB";

                        RegisterUserData.registerUserData(model.toJson()).then(
                          (value) async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            );
                            RegisterResponseModel model1 =
                                RegisterResponseModel();
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString(
                                "userId", "${model1.response!.first.userId}");
                          },
                        );
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
