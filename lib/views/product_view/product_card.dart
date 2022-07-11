import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendease_text/controller/cart_controller.dart';
import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/consts.dart';
import '../../core/utils.dart';
import '../../model/model/model.dart';
import '../widgets/divider.dart';

enum Availability { available, unavailable }

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard(this.product, {Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),
      child: Container(
        decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: LIGHT_GREY)),
        padding: const EdgeInsets.fromLTRB(15, 11, 15, 11),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(product.image.toString(),
                    fit: BoxFit.fill, height: 48, width: 48)),
            smallHorizontalSpacing(),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(product.description.toString())),
                    InkWell(
                        onTap: () => cartController.addProducts(product),
                        child: Image.asset(ADD_CART, width: 28, height: 28))
                  ],
                ),
                tinyVerticalSpacing(),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      product.categoryDetails!.name.toString().capitalizeFirstLetter(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: GREY,
                          fontWeight: FontWeight.w300),
                    )),
                    PopupMenuButton<Availability>(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                                product.deleted == true
                                    ? 'Unavailable'
                                    : 'Available',
                                style: TextStyle(
                                    color:
                                        product.deleted == true ? RED : GREEN,
                                    fontWeight: FontWeight.w300)),
                            const Icon(
                              Icons.expand_more,
                              color: PRIMARY_COLOR,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<Availability>>[
                              PopupMenuItem<Availability>(
                                value: Availability.available,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Text('Available'),
                                ),
                              ),
                              PopupMenuItem<Availability>(
                                value: Availability.unavailable,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Text('Unavailable'),
                                ),
                              ),
                            ]),
                  ],
                ),
                buildDivider(),
                tinyVerticalSpacing(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            product.weightUnit.toString().capitalizeFirstLetter(),
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                          const Icon(Icons.expand_more, color: PRIMARY_COLOR)
                        ],
                      ),
                    ),
                    Text(
                      '${formatToNaira(product.vendeasePrice)}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
