import 'package:get/state_manager.dart';
import 'package:vendease_text/model/services/api_docs.dart';

import '../model/model/model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var tab = 'All Products'.obs;
  ResponseModel? allProducts;
  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>([]);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      allProducts = await ApiDocs.getProducts();
      if (allProducts != null) {
        productList.value = allProducts!.data;
      }
    } finally {
      isLoading(false);
    }
  }

  void search(String searchTerm) async {
    List<ProductModel> searchedList = [];
    if (searchTerm.isEmpty) {
      searchedList = allProducts!.data;
    } else {
      searchedList = allProducts!.data
          .where((product) =>
              product.name!.toLowerCase().contains(searchTerm.toLowerCase()) ||
              product.categoryDetails!.name!
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()))
          .toList();
    }

    productList.value = searchedList;
  }

  void setTab(title) {
    tab = RxString(title);
  }
}
