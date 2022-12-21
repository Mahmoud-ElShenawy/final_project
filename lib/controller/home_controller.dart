import 'package:dio/dio.dart';
import 'package:final_project/network/network_helper.dart';

import '../model/product_model.dart';

class HomeController {
  final Dio _dio = Dio();
  String url = 'https://fakestoreapi.com/products';

  List<ProductModel> productsList = [];

  Future<List<ProductModel>> getProduct() async {
    Response response = await _dio.get(url);

    response.data.forEach(
      (e) => productsList.add(ProductModel.fromJson(e)),
    );

    return productsList;
  }
}
