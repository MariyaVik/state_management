import 'package:dio/dio.dart';
import 'package:flutter_mobx_sk/models/product.dart';

class APIService {
  final Dio dio = Dio();

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await dio
          .get('https://632db5452cfd5ccc2af5186b.mockapi.io/v1/products');
      final products =
          response.data.map<Product>((e) => Product.fromJson(e)).toList();
      return products;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}
