import 'package:dio/dio.dart';

import '../models/product.dart';
import '../models/rating.dart';

const String server = 'https://632db5452cfd5ccc2af5186b.mockapi.io/v1';

class APIService {
  final Dio dio = Dio();

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await dio.get('$server/products');
      final products =
          response.data.map<Product>((e) => Product.fromJson(e)).toList();
      print('товары загрузились');
      return products;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<void> addProduct() async {
    const productUrl = '$server/products';
    Dio dio = Dio();
    final data = Product(
            id: 666,
            title: 'Супер острая пицца',
            price: 666,
            category: 'Pizza',
            description: 'Очень вкусно',
            image:
                'https://otzovik.com/review/tF1f72232/fe0cd8C2aXg/KmU6lYkGtcHSLnJfuHnRJmR5R-bMmcIUU9nsbXSlGKk8Isps6HKM_0sJfgY3c3SyaV9nvYm6LGTxO2zlHtpiuigrONSIQrvWkOl9Dn6zUyFlNkUwAo7eBs5Is3Nn-Qc4LewKpGozwj0BwLvOcTp8eWfeL3PCfm9--nNk7FAD6vPo6zXSRg581NZvNEB2c1HiqHHFu0VAUETHDrF-4jDA-SrvAWTjfM37hQQ7zzj69rqmEic6D7Infv24aqCfgad5re322wmHdF4b77PMuT1YKS91CvdMz5UAAonwv6o8CDEka0voL32G_cLFtgJ_fzSzLNHvv0nzbHx8M24oFALiveCjdZuCivvY2qmzCDey32XiuAu1h4lTzEyJMXNltsS9ZyPHoOY1yHfJx7jM9vw9MGyQZ7tE-iL79DFuo51PJ_NopXRfD4X8UpSgdUd3NBUl6T-KtUAMUg0Dibny6HxKsC2qhGOlcUT-SsV3hnZzMLRgnqV-Cboq-zXxI6iYBO974mq514WNNhHcZXPGsjzV4qT2BvGICZhOy8F9taU6TT8k50CtbnaAuorLvU9_czJ1rl4jfgf0Yj10_awpkAOiPeLsd5pBArtSHib5iXFzGSav-cp8hYKXykOM9P5tPc5wqetBoGL2iD1HQjjGubw-P2bUZHdIdGr5-zUsIliMLnInIb-VxYK6llSnOoz68t7rp_IBPU6Gmg1JTT40aHFI9isggu6i9wn6wEy9CjawMHyrU-0_BnGo9TL9qqzYCCyxbS3028oMMp4SLz3COHdVo-j1xz7HRtYDBgVwPWGyD3esLgJoo7YC9k3CN85-Ojqwb5El_4i5L_Sxey9knIbndSIh-dqOjDJZVi75hbM1UGLuNMAxCAqTAcsDvvjvcM75pi_NYOG_RXoLT3SD9Xo18qBZIfABey038HviLNHJYvjtaXYST405UVSpc8a-fdJu5f1AtMnK0ktFjnq-YbBAdGzlwGgsv885QEAxCbk2_Husl-mzxzUo8_p-7-lZiGr6qem91AhAeR9Qpr0OPnxeKii3BXYCR9LChQuxdis9DHtpq82nbDXEMQtFMAmw-3X7p1rtNsX26zzw9u0iHcqssyWhdJpAD70T1mQyRTcymKah_4kwDctaA0XEuPysugGx5OuIb2M-CLPJyvbGOzI79CtRZT2HuyX2sPHtoZKOZv5hbP4TyI18EBzuu4W68tWrITkFfobIUkXMRLuzJXmIeOXkguVjtwV7xkfwA792uPdm16d3QjviMfM5I2yYT-I_KCzwV8eMvVCbKDIPOXASJGa8g7zGQZwCjQw8umz9gHWhrgRt7H7PcUWKvkb5s3i45hInPsX8bPI7Me6qFA_sOyAjt58OwToQkauwyLJ536qncsE-Qg_TgIcPsn_jcA88KaNEruVxhXtKADeL9r-7N-TaLTVAs6Y1dfGh553I6_PjqXESDgG9EFFvtcj9PBBrZj7J8EAPFcAFxn38pDWBOKyvSu3tfE9yxwMzRrH5fXCkEeH6wjQjtDr4KuEdhuk67yj0lMRBuhYRK7BK-vwX5aR1i37FAROLQwW1PuPxhvdvLg3p5DAI98cMOYB4O3j9JBilf0C7Lfp7PO2vmAgtt-AsNdqEyv2QGah9gL951u0k94fxgQKTwc2AdXAtcMkxLm3L7GR3DTRBxzxAtHD',
            rating: Rating(count: 555, rate: 4.4))
        .toJson();

    dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';

    try {
      final response = await dio.post(productUrl, data: data);
      print('post : ${response.data}');
      print('post : ${response.statusMessage}');
    } catch (e) {
      print('exception $e');
    }
  }
}
