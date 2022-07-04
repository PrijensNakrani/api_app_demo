import 'package:api_app_demo/api_routes/api_routes.dart';

import '../api_handler/api_handler.dart';
import '../model/product_model.dart';

class GetProductData {
  static Future<List<ProductModel>> getModel() async {
    var response =
        await API.apiHandler(url: ApiRoutes.allProducts, apiType: ApiType.aGet);
    return productModelFromJson(response.body);
  }
}
