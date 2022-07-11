import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vendease_text/core/app_colors.dart';
import '../../controller/cart_controller.dart';
import '../../core/consts.dart';
import '../widgets/text_box.dart';
import 'cart_card.dart';
import 'cart_checkout_card.dart';

class CartsScreen extends StatelessWidget {
  final panelController = PanelController();
  final searchController = TextEditingController();
  final CartController cartController = Get.put(CartController());

   CartsScreen({Key? key}) : super(key: key);

  sumOfProducts(list) => list.reduce((a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: BLACK),
        title: const Text('Your Cart', style: TextStyle(color: BLACK)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: SIDE_PADDING),
            child: Obx(
              () => Text(
                cartController.products.isEmpty
                    ? '0 Item'
                    : '${sumOfProducts(cartController.products.values.toList())} Items',
                textAlign: TextAlign.end,
                style: const TextStyle(color: PRIMARY_COLOR),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GestureDetector(
        onTap: ()=>panelController.close(),
        child: SafeArea(
          bottom: false,
          child: SlidingUpPanel(
            maxHeight: height(context) * 0.3,
            minHeight: height(context) * 0.13,
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            controller: panelController,
            color: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      SIDE_PADDING, 10, SIDE_PADDING, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      searchTextField(
                          controller: searchController, onChanged: (value) {}),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(()=>
                    Column(
                        children: [
                          cartController.products.isEmpty
                              ? Padding(
                                padding:  EdgeInsets.only(top: height(context)*0.2),
                                child: const Text('There are no\nproduct in your cart',textAlign: TextAlign.center,),
                              )
                              : ListView.separated(
                                  padding: EdgeInsets.only(
                                    top:20,
                                      bottom: height(context) * 0.3),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (c, i) =>
                                      CartCard(cartController.products.keys.toList( )[i],cartController.products.values.toList()[i]),
                                  separatorBuilder: (c, i) =>
                                      smallerVerticalSpacing(),
                                  itemCount: cartController.products.length),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            panelBuilder: (ScrollController scrollController) => GestureDetector(
              onTap: () => panelController.open(),
              child: CheckOutCard(cartController),
            ),
          ),
        ),
      ),
    );
  }


}
