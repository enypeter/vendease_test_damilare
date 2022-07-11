import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendease_text/core/app_colors.dart';
import 'package:vendease_text/core/consts.dart';
import 'package:vendease_text/views/widgets/text_box.dart';

import '../../controller/product_controller.dart';
import '../widgets/divider.dart';
import 'product_card.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: SIDE_PADDING, top: 10),
                child: Text('Products',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 28))),
            buildDivider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    SIDE_PADDING, 10, SIDE_PADDING, 10),
                child: searchTextField(
                    onChanged: (value) => productController.search(value))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tabHeader('All Products',6),
                tabHeader('Fruits and Vegetables',9),
                tabHeader('Toiletries',5),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      shrinkWrap: true,
                      itemBuilder: (c, i) =>
                          ProductCard(productController.productList.value[i]),
                      separatorBuilder: (c, i) => smallerVerticalSpacing(),
                      itemCount: productController.productList.value.length);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabHeader(title,flex) {
    return Obx(
      () => Expanded(
        flex: flex,
        child: InkWell(
          onTap: () => productController.setTab(title),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color:
                            productController.tab.toString() == title.toString()
                                ? PRIMARY_COLOR
                                : BLUE_GREY.withOpacity(0.3)))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
