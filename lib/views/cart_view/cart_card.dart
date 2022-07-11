import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/consts.dart';
import '../../core/utils.dart';
import '../../model/model/model.dart';

class CartCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;

  CartCard(this.product, this.quantity, {Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: const Offset(0.2, 0.2),
              blurRadius: 1,
              spreadRadius: 2,
              color: LIGHT_GREY.withOpacity(0.1)),
          BoxShadow(
              offset: const Offset(-0.2, -0.2),
              blurRadius: 1,
              spreadRadius: 2,
              color: LIGHT_GREY.withOpacity(0.1))
        ],
      ),
      padding: const EdgeInsets.fromLTRB(10, 5, 30, 5),
      child: Row(
        children: [
          Image.network(product.image.toString(), width: 98),
          smallHorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      product.name.toString(),
                      style: const TextStyle(fontSize: 15),
                    )),
                    Image.asset(DELETE, height: 18)
                  ],
                ),
                tinyVerticalSpacing(),
                Text(
                  '$quantity ${product.weightUnit}',
                  style: const TextStyle(fontSize: 14, color: GREY),
                ),
                smallerVerticalSpacing(),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Text(
                          '${formatToNaira(product.vendeasePrice)}',
                          style: const TextStyle(fontSize: 15, color: GREY),
                        )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () => cartController.reduceProducts(product),
                              child:
                                  const Icon(Icons.remove_circle, color: GREY)),
                          Expanded(
                              child: Center(
                            child: Text(
                              '$quantity',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w800),
                            ),
                          )),
                          InkWell(
                              onTap: () => cartController.addProducts(product),

                              child: const Icon(Icons.add_circle, color: GREY)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
