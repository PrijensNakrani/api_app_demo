import 'package:api_app_demo/api_routes/api_routes.dart';

import '../api_handler/api_handler.dart';
import '../model/sign_up_res_model.dart';

class RegisterUserData {
  static Future<SignUpResModel> registerUserData(
      Map<String, dynamic> reqData) async {
    var header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var response = await API.apiHandler(
      url: ApiRoutes.registerUser,
      apiType: ApiType.aPost,
      reqBody: reqData,
      headers: header,
    );
    // var result = jsonDecode(response.body);
    // return result;
    SignUpResModel signUpResModel = SignUpResModel.fromJson(response);
    print("${signUpResModel.response!.elementAt(3)}");
    return signUpResModel;
  }
}
