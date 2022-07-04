import 'dart:convert';
import 'dart:developer';

import 'package:api_app_demo/api_handler/api_handler.dart';
import 'package:api_app_demo/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/all_user_model.dart';
import '../model/makeup_model.dart';
import '../model/news_model.dart';

class ApiServices {
  static Future<List<ProductModel>> getModel() async {
    var response = await API.apiHandler(
        url: "https://fakestoreapi.com/products", apiType: ApiType.aGet);
    return productModelFromJson(response.body);
  }

  static Future getData() async {
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    var result = jsonDecode(response.body);
    print("Response===>>${jsonDecode(response.body)}");
    return result;
  }

  static Future<NewsModel?> getNewsData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2022-04-06&sortBy=publishedAt&apiKey=1811635805274abdad04a580b1005717"),
    );
    print("Response===>>${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      // print("StatusCode==>>${response.statusCode}");
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<MakeupModel>?> makeupData() async {
    http.Response response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      return makeupModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future signUpData(Map<String, dynamic> reqData) async {
    http.Response response = await http.post(
      Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
      body: reqData,
    );
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    return result;
  }

  static Future registerUser(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/user/create"),
        body: reqData,
        headers: header);
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    return result;
  }

  static Future<bool?> loginUser(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/login/login_check"),
        body: reqData,
        headers: header);

    // print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      log(
        jsonDecode(response.body),
      );
      return true;
    } else {
      return null;
    }
  }

  static Future<bool?> getOtp(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/1"),
        body: reqData,
        headers: header);
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      return result;
    } else {
      return null;
    }
  }

  static Future<bool?> registerOtp(Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/0"),
        body: reqData,
        headers: header);

    // print("${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      log(
        jsonDecode(response.body),
      );
      return true;
    } else {
      return null;
    }
  }

  static Future<AllUserModel> allUser() async {
    http.Response response = await http.get(
      Uri.parse("https://codelineinfotech.com/student_api/User/allusers.php"),
    );
    return allUserModelFromJson(response.body);
  }

  static Future deleteUser(
      {Map<String, dynamic>? reqBody, BuildContext? context}) async {
    http.Response response = await http.post(
        Uri.parse(
          "https://codelineinfotech.com/student_api/User/delete_user.php",
        ),
        body: reqBody);
    var result = jsonDecode(response.body);
    print("${jsonDecode(response.body)}");
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("User deleted"),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return result;
  }
}
