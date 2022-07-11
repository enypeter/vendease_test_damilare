import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/app_colors.dart';
import '../../core/consts.dart';
import '../../core/utils.dart';
import '../widgets/divider.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard(this.cartController,{Key? key}) : super(key: key);
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      child: Column(
        children: [
          smallVerticalSpacing(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.add, size: 15, color: PRIMARY_COLOR),
                Text(
                  'Add Products',
                  style: TextStyle(color: PRIMARY_COLOR),
                )
              ],
            ),
          ),
          smallerVerticalSpacing(),
          buildDivider(),
          smallerVerticalSpacing(),
          Obx(()=>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children:  [
                        const Expanded(
                          child: Text(
                            'TOTAL',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            cartController.products.isEmpty
                                ? '$naira 0.00'
                                :  '${formatToNaira(cartController.totalProductPrice)}',
                            textAlign: TextAlign.end,
                            style:const TextStyle(
                                color: PRIMARY_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    smallVerticalSpacing(),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Delivery fee not included yet',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    smallVerticalSpacing(),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Center(
                              child: Text(
                                'Check out',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: WHITE),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
