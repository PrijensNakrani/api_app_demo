import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:api_app_demo/api_service/api_service.dart';
import 'package:api_app_demo/model/sign_up_model.dart';
import 'package:api_app_demo/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

class SignUpWithModel extends StatefulWidget {
  const SignUpWithModel({Key? key}) : super(key: key);

  @override
  State<SignUpWithModel> createState() => _SignUpWithModelState();
}

class _SignUpWithModelState extends State<SignUpWithModel> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> uploadUserImage({String? fileName}) async {
    dio.FormData formData = dio.FormData.fromMap(
      {
        "avatar":
            await dio.MultipartFile.fromFile(_image!.path, filename: fileName),
      },
    );
    dio.Response response = await dio.Dio().post(
        "https://codelineinfotech.com/student_api/User/user_avatar_upload.php",
        data: formData);

    if (response.data['url'] != null) {
      return response.data['url'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400),
                        child: ClipOval(
                          child: _image == null
                              ? Icon(
                                  Icons.person_outline,
                                  size: 100,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                        ),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String? url = await uploadUserImage(
                              fileName:
                                  "${Random().nextInt(1000)}/${_image!.path.toString().split("/").last}");
                          SignUpModel _model = SignUpModel();
                          _model.firstName = _firstName.text;
                          _model.lastName = _lastName.text;
                          _model.username = _userName.text;
                          _model.password = _password.text;
                          _model.avatar = url;

                          setState(() {
                            isLoading = true;
                          });
                          ApiServices.signUpData(_model.toJson()).then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          });
                        }
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
