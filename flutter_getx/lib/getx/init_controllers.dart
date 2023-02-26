import 'package:flutter_getx/getx/catalog_controller.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import 'cart_controller.dart';
import 'favorites_controller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CatalogController(APIService()));
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => CartController());
  }
}
