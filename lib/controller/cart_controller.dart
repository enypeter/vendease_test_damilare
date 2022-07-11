import 'package:get/state_manager.dart';

import '../model/model/model.dart';
import '../views/widgets/snack_bar.dart';

class CartController extends GetxController {
  var products = {}.obs;

  void addProducts(ProductModel product) {
    if (products.containsKey(product)) {
      products[product] += 1;
    } else {
      products[product] = 1;
    }
    showNoticeSnackBar(
        'Product Added!', 'You have added ${product.name} to your cart');
  }

  void reduceProducts(ProductModel product) {
    if (products.containsKey(product) && products[product] == 1) {
      products.removeWhere((key, value) => key == product);
    } else {
      products[product] -= 1;
    }
  }

  get totalProductPrice => products.entries
      .map((product) => product.key.vendeasePrice * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
