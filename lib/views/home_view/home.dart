import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendease_text/core/app_assets.dart';
import 'package:vendease_text/core/app_colors.dart';
import 'package:vendease_text/core/consts.dart';
import 'package:vendease_text/views/home_view/order_list_Card.dart';
import 'package:vendease_text/views/home_view/product_catgeory_card.dart';

import '../cart_view/cart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    SIDE_PADDING, 10, SIDE_PADDING, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: DARK_GREY,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(text: 'Welcome, '),
                                TextSpan(
                                  text: 'Mhiday',
                                  style: TextStyle(color: PRIMARY_COLOR),
                                ),
                              ])),
                        ),
                        Row(
                          children: [
                            Image.asset(
                                'assets/images/ayo-ogunseinde-6W4F62sN_yI-unsplash 7.png',
                                height: 26),
                            smallHorizontalSpacing(),
                            InkWell(
                                onTap: () => Get.to(() => CartsScreen()),
                                child: Image.asset(CART, height: 24))
                          ],
                        )
                      ],
                    ),
                    tinyVerticalSpacing(),
                    const Text(
                      'What are you looking for today?',
                      style: TextStyle(color: DARK_GREY),
                    )
                  ],
                ),
              ),
              smallerVerticalSpacing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(
                                        color: DARK_GREY, fontSize: 12),
                                    children: [
                                  TextSpan(text: 'Show: '),
                                  TextSpan(
                                    text: 'This week',
                                    style: TextStyle(color: PRIMARY_COLOR),
                                  ),
                                ])),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        const Text(
                          'View more',
                          style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        ),
                      ],
                    ),
                    smallerVerticalSpacing(),
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: LIGHT_ORANGE,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Total Orders',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          smallVerticalSpacing(),
                          const Text('200',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: DEEP_ORANGE)),
                          smallVerticalSpacing(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              dot(WHITE),
                              dot(DEEP_ORANGE),
                              dot(WHITE),
                              dot(WHITE),
                            ],
                          ),
                        ],
                      ),
                    ),
                    mediumVerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Product categories',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              smallVerticalSpacing(),
              SizedBox(
                height: 150,
                child: ListView(
                  padding: const EdgeInsets.only(left: SIDE_PADDING),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const CategoryCard(
                        title: 'Drinks',
                        color: LIGHT_BLUE,
                        image: 'assets/images/drinks.png'),
                    smallHorizontalSpacing(),
                    const CategoryCard(
                        title: 'Processed Can',
                        color: LIGHT_PINK,
                        image: 'assets/images/can_food.png'),
                    smallHorizontalSpacing(),
                    const CategoryCard(
                        title: 'Seafoods',
                        color: LIGHT_ORANGE,
                        image: 'assets/images/sea_food.png'),
                  ],
                ),
              ),
              mediumVerticalSpacing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Recent order list',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    smallVerticalSpacing(),
                    const OrderListCard(
                        color: GREEN,
                        ref: 'P037487HG736',
                        amount: '8000',
                        date: 'Jan 3, 2021 10:11 AM'),
                    smallVerticalSpacing(),
                    const OrderListCard(
                        color: PEACH,
                        ref: 'P037487HG736',
                        amount: '8000',
                        date: 'Jan 3, 2021 10:11 AM'),
                    smallVerticalSpacing(),
                    const OrderListCard(
                        color: PEACH,
                        ref: 'P037487HG736',
                        amount: '8000',
                        date: 'Jan 3, 2021 10:11 AM'),
                    smallVerticalSpacing(),
                    const OrderListCard(
                        color: GREEN,
                        ref: 'P037487HG736',
                        amount: '8000',
                        date: 'Jan 3, 2021 10:11 AM'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dot(color) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      );
}
