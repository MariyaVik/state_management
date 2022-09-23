import 'package:dio/dio.dart';
import 'package:flutter_riverpod_sk/models/product.dart';

class APIService {
  List<Product> products = [];
  Dio dio = Dio();
  bool hasError = false;
  String errorMessage = '';

  getData() async {
    try {
      final response = await dio
          .get('https://632db5452cfd5ccc2af5186b.mockapi.io/v1/products');
      products =
          response.data.map<Product>((e) => Product.fromJson(e)).toList();
    } on DioError catch (e) {
      hasError = true;
      // if (e.response != null) {
      //   errorMessage = e.response!.data['message'];
      // } else {
      errorMessage = e.message;
      // }
      print(errorMessage);
    }
  }
}
