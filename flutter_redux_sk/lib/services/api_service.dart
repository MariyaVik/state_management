import 'package:dio/dio.dart';
import 'package:flutter_redux_sk/models/product.dart';

class APIService {
  final Dio dio = Dio();

  Future<List<Product>> getAllProducts() async {
    final response = await dio
        .get('https://632db5452cfd5ccc2af5186b.mockapi.io/v1/products');
    if (response.statusCode == 200) {
      final products =
          response.data.map<Product>((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw 'Something went wrong ${response.statusCode}';
    }
  }
}
